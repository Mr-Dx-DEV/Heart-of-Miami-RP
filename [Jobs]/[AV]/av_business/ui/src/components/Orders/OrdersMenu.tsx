import { useEffect, useState } from "react";
import {
  Transition,
  Box,
  Text,
  Group,
  Stack,
  ThemeIcon,
  ScrollArea,
  Flex,
  Menu,
  ActionIcon,
} from "@mantine/core";
import {
  IconListCheck,
  IconDotsVertical,
  IconHourglassEmpty,
  IconProgressCheck,
  IconBellPlus,
  IconBellMinus,
} from "@tabler/icons-react";
import { fetchNui, isEnvBrowser } from "../../hooks/useNuiEvents";
import { ApiOrders } from "../../API/orders";
import { OrderType } from "../../types/types";
import { formatTimestamp } from "../../hooks/formatTime";
import classes from "./style.module.css";
import { Loading } from "../Loading";
import { useRecoilValue } from "recoil";
import { Lang } from "../../reducers/atoms";

const iconStyle = {
  height: "16px",
  width: "16px",
  opacity: 0.95,
};

export const OrdersMenu = () => {
  const daLang: any = useRecoilValue(Lang);
  const lang = daLang.orders;
  const [loading, setLoading] = useState(true);
  const [loaded, setLoaded] = useState(false);
  const [allOrders, setAllOrders] = useState<OrderType[]>([]);

  const handleOrder = async (callback: string, order: OrderType) => {
    if (callback == "addToQueue") {
      setLoaded(false);
      setTimeout(() => {
        fetchNui("av_business", "closeOrders");
      }, 200);
    }
    const resp = await fetchNui("av_business", callback, order);
    if (resp) {
      setAllOrders(resp);
    }
  };
  useEffect(() => {
    const fetchData = async () => {
      const resp = await fetchNui("av_business", "getOrders");
      if (resp) {
        setAllOrders(resp);
      } else {
        if (isEnvBrowser()) {
          setAllOrders(ApiOrders);
        }
      }
      setLoaded(true);
      setTimeout(() => {
        setLoading(false);
      }, 100);
    };
    const onKeyDown = (e: KeyboardEvent) => {
      if (e.code === "Escape") {
        setLoaded(false);
        setTimeout(() => {
          fetchNui("av_business", "closeOrders");
        }, 200);
      }
    };
    fetchData();
    window.addEventListener("keydown", onKeyDown);
    return () => window.removeEventListener("keydown", onKeyDown);
  }, []);

  return (
    <Box className={classes.container}>
      <Transition
        mounted={loaded}
        transition="fade-left"
        duration={800}
        exitDuration={800}
        timingFunction="ease"
      >
        {(styles) => (
          <Box className={classes.box} style={styles}>
            {loading ? (
              <Loading />
            ) : (
              <>
                <Group p="sm" justify="center">
                  <ThemeIcon
                    bg="var(--blue-500)"
                    style={{
                      cursor: "default",
                    }}
                    c="gray.1"
                    radius={50}
                  >
                    <IconListCheck
                      style={{
                        height: "16px",
                        width: "16px",
                      }}
                    />
                  </ThemeIcon>
                  <Text ta="center">{`${allOrders.length} ${lang.header}`}</Text>
                </Group>
                <ScrollArea
                  type="hover"
                  scrollbars="y"
                  scrollbarSize={3}
                  h={"calc(45vh - 110px)"}
                  offsetScrollbars
                  bg="var(--dark-800)"
                  mah={450}
                  p="xs"
                >
                  <Stack gap="xs">
                    {allOrders.map((order) => (
                      <Menu
                        classNames={classes}
                        key={order.identifier}
                        shadow="md"
                        width={200}
                        position="bottom-end"
                      >
                        <Group
                          className={classes.order}
                          p="xs"
                          justify="space-between"
                        >
                          <Flex direction="column">
                            <Text
                              fz="sm"
                              w={100}
                              truncate
                            >{`${order.customerName}`}</Text>
                            <Text fz="xs" c="dimmed">
                              {lang.customer}
                            </Text>
                          </Flex>
                          <Flex direction="column">
                            <Text fz="sm">{`${order.cart.length}`}</Text>
                            <Text fz="xs" c="dimmed">
                              {lang.products}
                            </Text>
                          </Flex>
                          <Flex direction="column">
                            <Text fz="sm">{`${formatTimestamp(
                              order.generated,
                              "HH:mm"
                            )}`}</Text>
                            <Text fz="xs" c="dimmed">
                              {lang.generated}
                            </Text>
                          </Flex>
                          <Flex direction="column" w={50}>
                            <Text
                              fz="sm"
                              c={order.inProgress ? `teal` : `orange`}
                            >{`${
                              order.inProgress ? lang.inprogress : lang.pending
                            }`}</Text>
                            <Text fz="xs" c="dimmed">
                              {lang.status}
                            </Text>
                          </Flex>
                          <Menu.Target>
                            <ActionIcon
                              size="sm"
                              variant="transparent"
                              color="var(--blue-100)"
                            >
                              <IconDotsVertical />
                            </ActionIcon>
                          </Menu.Target>
                        </Group>
                        <Menu.Dropdown bg="var(--dark-400)">
                          <Menu.Item
                            leftSection={
                              <IconHourglassEmpty
                                style={iconStyle}
                                color="var(--blue-100)"
                              />
                            }
                            onClick={() => {
                              handleOrder("addToQueue", order);
                            }}
                          >
                            {lang.addqueue}
                          </Menu.Item>
                          <Menu.Item
                            leftSection={
                              order.inProgress ? (
                                <IconBellMinus
                                  style={iconStyle}
                                  color="var(--red-200)"
                                />
                              ) : (
                                <IconBellPlus
                                  style={iconStyle}
                                  color="var(--green-200)"
                                />
                              )
                            }
                            onClick={() => {
                              handleOrder("toggleOrder", order);
                            }}
                          >
                            {order.inProgress
                              ? lang.mark_pending
                              : lang.mark_complete}
                          </Menu.Item>
                          <Menu.Item
                            leftSection={
                              <IconProgressCheck
                                style={iconStyle}
                                color="var(--orange-300)"
                              />
                            }
                            onClick={() => {
                              handleOrder("removeOrder", order);
                            }}
                          >
                            {lang.mark_delivered}
                          </Menu.Item>
                        </Menu.Dropdown>
                      </Menu>
                    ))}
                  </Stack>
                </ScrollArea>
              </>
            )}
          </Box>
        )}
      </Transition>
    </Box>
  );
};
