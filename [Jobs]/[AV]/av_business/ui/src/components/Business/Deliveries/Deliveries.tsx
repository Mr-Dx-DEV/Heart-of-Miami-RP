import {
  Group,
  Text,
  Grid,
  ScrollArea,
  Switch,
  Checkbox,
  TextInput,
} from "@mantine/core";
import { DeliveriesMap } from "./DeliveriesMap";
import { useEffect, useState } from "react";
import {
  fetchNui,
  isEnvBrowser,
  useNuiEvent,
} from "../../../hooks/useNuiEvents";
import { ApiDeliveries, ApiDelivery } from "../../../API/delivery";
import { DeliveryType } from "../../../types/types";
import { useRecoilValue } from "recoil";
import { Lang } from "../../../reducers/atoms";
import { OrderCard } from "./OrderCard";
import classes from "./style.module.css";
import global from "../../../global.module.css";
import { Details } from "./Details";
import { useViewportSize } from "@mantine/hooks";
import { Loading } from "../../Loading";

interface OrderType {
  state: boolean;
  order: DeliveryType;
}

const Deliveries = () => {
  const daLang: any = useRecoilValue(Lang);
  const lang = daLang.deliveries;
  const [loaded, setLoaded] = useState(false);
  const [allDeliveries, setAllDeliveries] = useState<DeliveryType[]>([]);
  const [filtered, setFiltered] = useState<DeliveryType[]>([]);
  const [open, setOpen] = useState(false);
  const [notify, setNotify] = useState(false);
  const [search, setSearch] = useState("");
  const [selected, setSelected] = useState<string[]>([]);
  const [myCoords, setMyCoords] = useState({ x: 0, y: 0 });
  const [myIdentifier, setMyIdentifier] = useState("");
  const [showDetails, setShowDetails] = useState<OrderType>({
    state: false,
    order: ApiDelivery,
  });
  const { height } = useViewportSize();

  const fetchData = async () => {
    const resp = await fetchNui("av_business", "getDeliveries");
    if (resp) {
      setAllDeliveries(resp.deliveries);
      setFiltered(resp.deliveries);
      setOpen(resp.isOpen);
      setNotify(resp.notify);
      setMyCoords(resp.coords);
      setMyIdentifier(resp.myIdentifier);
    } else {
      if (isEnvBrowser()) {
        setAllDeliveries(ApiDeliveries);
        setFiltered(ApiDeliveries);
      }
    }
    if (!loaded) {
      setTimeout(() => {
        setLoaded(true);
      }, 200);
    }
  };
  useNuiEvent("updateDeliveries", () => {
    fetchData();
  });
  const handleOrder = (event: string, order: DeliveryType) => {
    fetchNui("av_business", event, order);
  };
  const handleSearch = (value: string) => {
    setSearch(value);
    const search = value.toLowerCase();
    const res = allDeliveries.filter(
      (item) =>
        (item.identifier
          ? item.identifier.toLowerCase().includes(search)
          : false) ||
        (item.claimed ? item.claimed.toLowerCase().includes(search) : false)
    );
    setFiltered(res);
  };

  const handleDetails = (order: DeliveryType) => {
    setShowDetails({
      state: true,
      order,
    });
  };

  const handleSelection = (identifier: string) => {
    setSelected((prev) =>
      prev.includes(identifier)
        ? prev.filter((id) => id !== identifier)
        : [...prev, identifier]
    );
  };
  useEffect(() => {
    fetchData();
  }, []);
  if (!loaded) return <Loading />;
  return (
    <>
      {showDetails.state && (
        <Details
          daLang={daLang}
          order={showDetails.order}
          setShow={() => {
            setShowDetails({ ...showDetails, state: false });
          }}
        />
      )}
      <Group
        bg="var(--dark-500)"
        p="sm"
        style={{
          borderRadius: "6px",
          border: "solid 1px rgba(255,255,255,0.1)",
        }}
      >
        <Text
          fz="lg"
          c="white"
          fw={500}
          lts={1}
        >{`${allDeliveries.length} ${lang.header}`}</Text>
        <Group ml="auto">
          <Switch
            checked={open}
            labelPosition="left"
            label={lang.orders}
            color="var(--blue-400)"
            size="xs"
            onChange={(e) => {
              setOpen(e.currentTarget.checked);
              fetchNui(
                "av_business",
                "toggleDeliveries",
                e.currentTarget.checked
              );
            }}
          />
          <Checkbox
            labelPosition="left"
            checked={notify}
            label={lang.notify}
            color="var(--blue-400)"
            onChange={(e) => {
              setNotify(e.currentTarget.checked);
              fetchNui("av_business", "notifyme", e.currentTarget.checked);
            }}
            size="xs"
          />
          <TextInput
            classNames={global}
            placeholder={daLang.search}
            value={search}
            onChange={(e) => {
              handleSearch(e.currentTarget.value);
            }}
            size="xs"
            w={200}
          />
        </Group>
      </Group>
      <Grid grow mt="md">
        <Grid.Col span={height > 800 ? 6 : 4}>
          <ScrollArea
            className={classes.scroll}
            offsetScrollbars
            type="hover"
            scrollbars={"y"}
            scrollbarSize={6}
          >
            <Grid grow>
              {filtered.map((order) => (
                <Grid.Col span={4} miw={350} maw={350}>
                  <OrderCard
                    key={order.identifier}
                    data={order}
                    symbol={daLang.money_symbol ?? "$"}
                    handleDetails={handleDetails}
                    selected={selected.includes(order.identifier)}
                    handleOrder={handleOrder}
                    isMine={myIdentifier === order.claimedIdentifier}
                    daLang={daLang}
                  />
                </Grid.Col>
              ))}
            </Grid>
          </ScrollArea>
        </Grid.Col>
        <Grid.Col span={height > 800 ? 6 : 7} className={classes.scroll}>
          <DeliveriesMap
            orders={allDeliveries}
            setSelected={handleSelection}
            myCoords={myCoords}
            myIdentifier={myIdentifier}
            daLang={daLang}
          />
        </Grid.Col>
      </Grid>
    </>
  );
};

export default Deliveries;
