import {
  Grid,
  Text,
  Button,
  Group,
  TextInput,
  ActionIcon,
  NumberInput,
  Image,
  Card,
  ScrollArea,
  Indicator,
  Dialog,
  Stack,
} from "@mantine/core";
import { useState, useEffect } from "react";
import { ApiIngredients } from "../../../API/products";
import { useRecoilValue } from "recoil";
import { Lang } from "../../../reducers/atoms";
import { IconSearch, IconShoppingCart, IconTrash } from "@tabler/icons-react";
import classes from "./style.module.css";
import global from "../../../global.module.css";
import { useDisclosure } from "@mantine/hooks";
import { useViewportSize, useClickOutside } from "@mantine/hooks";
import { IngredientsType } from "../../../types/types";
import { Loading } from "../../Loading";
import { fetchNui, isEnvBrowser } from "../../../hooks/useNuiEvents";

const Supplies = () => {
  const daLang: any = useRecoilValue(Lang);
  const lang = daLang.supplies;
  const [loaded, setLoaded] = useState(false);
  const [opened, { toggle, close }] = useDisclosure(false);
  const [maxAmount, setMaxAmount] = useState(100);
  const ref = useClickOutside(() => close());
  const [total, setTotal] = useState(0);
  const [cart, setCart] = useState<(IngredientsType & { amount: number })[]>(
    []
  );
  const [search, setSearch] = useState("");
  const [allItems, setAllItems] = useState<
    (IngredientsType & { amount?: number })[]
  >([]);
  const [filtered, setFiltered] = useState<
    (IngredientsType & { amount?: number })[]
  >([]);
  const [inventory, setInventory] = useState("");
  const [modified, setModified] = useState<{ [key: string]: boolean }>({});
  const { height } = useViewportSize();

  const handleCart = (item: IngredientsType, amount: number) => {
    setModified((prev) => ({ ...prev, [item.value]: true }));
    setCart((prevCart) => {
      const exists = prevCart.find((i) => i.value === item.value);
      if (amount === 0) {
        return prevCart.filter((i) => i.value !== item.value);
      }
      if (exists) {
        return prevCart.map((i) =>
          i.value === item.value ? { ...i, amount } : i
        );
      }
      return [...prevCart, { ...item, amount }];
    });
  };
  const handleSearchChange = (value: string) => {
    setSearch(value);
    const search = value.toLowerCase();
    const res = allItems.filter(
      (item) =>
        (item.label ? item.label.toLowerCase().includes(search) : false) ||
        (item.value ? item.value.toLowerCase().includes(search) : false)
    );
    setFiltered(res);
  };
  const handleBuy = async () => {
    setLoaded(false);
    const resp = await fetchNui("av_business", "buySupplies", cart);
    if (resp) {
      setCart([]);
      setModified({});
    }
    setTimeout(() => {
      setLoaded(true);
    }, 200);
  };
  useEffect(() => {
    const newTotal = cart.reduce((acc, item) => {
      const price = item.price ?? 1;
      return acc + price * item.amount;
    }, 0);
    setTotal(newTotal);
  }, [cart]);

  useEffect(() => {
    const fetchData = async () => {
      const resp = await fetchNui("av_business", "getSupplies");
      if (resp) {
        setAllItems(resp.supplies);
        setFiltered(resp.supplies);
        setInventory(resp.inventory);
        setMaxAmount(resp.maxAmount);
      } else {
        if (isEnvBrowser()) {
          setAllItems(ApiIngredients);
          setFiltered(ApiIngredients);
        }
      }
      setTimeout(() => {
        setLoaded(true);
      }, 200);
    };
    fetchData();
  }, []);
  if (!loaded) return <Loading />;
  return (
    <>
      <Dialog
        bg="var(--dark-400)"
        opened={opened}
        withCloseButton
        onClose={close}
        radius="md"
        position={{ right: 15, top: 120 }}
        withinPortal={false}
        miw={220}
        size="auto"
        ref={ref}
        shadow="md"
      >
        <Text size="md" mb="xs" fw={600}>
          {lang.cart_header}
        </Text>
        <Stack mt="lg">
          {cart.length > 0 ? (
            <>
              <Stack
                style={{
                  overflow: "auto",
                  height: "auto",
                  maxHeight: height > 700 ? "400px" : "250px",
                }}
              >
                {cart.map(
                  (
                    item: IngredientsType & { amount: number },
                    index: number
                  ) => (
                    <Group mt={index === 0 ? "xs" : 0}>
                      <Indicator
                        label={
                          <Text fz="10px" c="gray.4">
                            x {item.amount}
                          </Text>
                        }
                        size="auto"
                        color="transparent"
                      >
                        <Image
                          src={`${`https://cfx-nui-${inventory}${item?.value}.png`}`}
                          fallbackSrc="./item_default.png"
                          w={25}
                        />
                      </Indicator>
                      <Group gap="xs" fz="xs" ml={3}>
                        <Text fz="sm" c="gray.2">{`${item.label}`}</Text>-
                        <Text fz="xs" c="dimmed">{`${daLang.money_symbol}${
                          item.amount * (item.price ?? 1)
                        }`}</Text>
                      </Group>
                      <ActionIcon
                        variant="transparent"
                        size="sm"
                        color="red"
                        ml="auto"
                        onClick={() => {
                          handleCart(item, 0);
                        }}
                      >
                        <IconTrash style={{ height: "12px" }} />
                      </ActionIcon>
                    </Group>
                  )
                )}
              </Stack>
              <Button
                size="xs"
                className={classes.button}
                onClick={handleBuy}
              >{`${lang.confirm} (${daLang.money_symbol}${total.toLocaleString(
                "en-US"
              )})`}</Button>
            </>
          ) : (
            <Text fz="xs" c="dimmed" ta="center">
              {lang.empty}
            </Text>
          )}
        </Stack>
      </Dialog>
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
        >{`${filtered.length} ${lang.header}`}</Text>
        <TextInput
          classNames={global}
          placeholder={lang.search}
          leftSection={<IconSearch size={16} stroke={1.5} />}
          value={search}
          onChange={(e) => {
            handleSearchChange(e.currentTarget.value);
          }}
          size="xs"
          ml="auto"
          w={200}
        />
        <Indicator
          color="var(--orange-400)"
          inline
          processing
          disabled={cart.length === 0}
        >
          <ActionIcon
            className={classes.button}
            variant="filled"
            w={40}
            onClick={toggle}
          >
            <IconShoppingCart style={{ height: "14px" }} />
          </ActionIcon>
        </Indicator>
      </Group>
      <ScrollArea
        type="hover"
        scrollbars={"y"}
        scrollbarSize={6}
        className={classes.scroll}
        mt="md"
      >
        <Grid gutter="sm">
          {filtered.map((item) => {
            const cartItem = cart.find((i) => i.value === item.value);
            const inputValue = cartItem
              ? cartItem.amount
              : modified[item.value]
              ? 0
              : undefined;
            return (
              <Grid.Col span={2} miw={190} maw={190}>
                <Card className={classes.card}>
                  <Card.Section className={classes.imageSection}>
                    <Image
                      src={`${`https://cfx-nui-${inventory}${item?.value}.png`}`}
                      fallbackSrc="./item_default.png"
                      w={60}
                      mt={5}
                    />
                  </Card.Section>
                  <Card.Section ta="center" p="sm">
                    <Text c="var(--blue-100)" truncate>
                      {item.label}
                    </Text>
                    <Text c="gray.4" fz="sm" lts={1}>
                      {`${daLang.money_symbol} ${item.price?.toLocaleString(
                        "en-US"
                      )}`}
                    </Text>
                    <NumberInput
                      classNames={global}
                      placeholder={lang.amount}
                      mt="xs"
                      size="xs"
                      allowDecimal={false}
                      allowLeadingZeros={false}
                      allowNegative={false}
                      value={inputValue}
                      max={maxAmount}
                      onChange={(e) => {
                        handleCart(item, Number(e));
                      }}
                    />
                  </Card.Section>
                </Card>
              </Grid.Col>
            );
          })}
        </Grid>
      </ScrollArea>
    </>
  );
};

export default Supplies;
