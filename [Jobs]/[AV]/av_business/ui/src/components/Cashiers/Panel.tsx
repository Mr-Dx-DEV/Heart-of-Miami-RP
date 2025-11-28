import { useEffect, useState } from "react";
import {
  Group,
  Text,
  Grid,
  ScrollArea,
  Button,
  Select,
  TextInput,
} from "@mantine/core";
import { IngredientsType, JobItem, SelectType } from "../../types/types";
import { Loading } from "../Loading";
import { fetchNui, isEnvBrowser } from "../../hooks/useNuiEvents";
import { ApiIngredients, ApiJobItems, ApiTypes } from "../../API/products";
import { ItemCard } from "./ItemCard";
import { Header } from "./Header";
import { Subheader } from "./Subheader";
import classes from "./style.module.css";
import global from "../../global.module.css";

interface Properties {
  daLang: any;
  cashierId: string;
  job: string;
  isCustomer: boolean;
}

interface ItemType extends JobItem {
  toUse: string[];
}

interface SharedProps {
  className: string;
  variant: "filled";
  onClick: () => void;
}

export const Panel = ({ daLang, cashierId, job, isCustomer }: Properties) => {
  const lang = daLang.cashier;
  const [loaded, setLoaded] = useState(false);
  const [isCart, setIsCart] = useState(isCustomer);
  const [total, setTotal] = useState(0);
  const [allIngredients, setAllIngredients] = useState<IngredientsType[]>([]);
  const [allTypes, setAllTypes] = useState<SelectType[]>([]);
  const [allItems, setAllItems] = useState<ItemType[] | JobItem[]>([]);
  const [filtered, setFiltered] = useState<ItemType[] | JobItem[]>([]);
  const [filter, setFilter] = useState<string | null>(null);
  const [inventory, setInventory] = useState("");
  const [cart, setCart] = useState<ItemType[] | JobItem[]>([]);
  const [filteredCart, setFilteredCart] = useState<ItemType[] | JobItem[]>([]);
  const [accounts, setAccounts] = useState<SelectType[]>([
    { value: "bank", label: "Bank" },
  ]);
  const [payment, setPayment] = useState("");
  const [customerName, setCustomerName] = useState("Avilchiis");

  const handleSearch = (input: string) => {
    const base = isCart ? cart : allItems;
    const res: any = base.filter(
      (item) =>
        item.label?.toLowerCase().includes(input) ||
        item.name?.toLowerCase().includes(input)
    );
    isCart ? setFilteredCart(res) : setFiltered(res);
  };
  const getIngredientLabel = (ingredient: string) => {
    const match = allIngredients.find((item) => item.value === ingredient);
    return match ? match.label : ingredient;
  };
  const usingIngredient = (name: string, ingredients: string[] | undefined) => {
    if (!ingredients) return false;
    return ingredients.find((item) => item === name);
  };
  const handleIngredient = (
    item: string,
    ingredient: string,
    index: number
  ) => {
    const toggleIngredient = (items: typeof allItems) =>
      items.map((i, idx) => {
        if (i.name !== item || idx !== index) return i;
        const toUse = i.toUse || [];
        const updatedToUse = toUse.includes(ingredient)
          ? toUse.filter((val) => val !== ingredient)
          : [...toUse, ingredient];
        return { ...i, toUse: updatedToUse };
      });

    if (isCart) {
      setCart((prev) => toggleIngredient(prev));
      setFilteredCart((prev) => toggleIngredient(prev));
    } else {
      setAllItems((prev) => toggleIngredient(prev));
      setFiltered((prev) => toggleIngredient(prev));
    }
  };
  const handleCart = (item: any, type: string, index: number) => {
    if (type === "add") {
      setCart([...cart, item]);
      setFilteredCart([...filteredCart, item]);
    } else {
      setCart((prev) => {
        const copy = [...prev];
        const targetIndex = copy.findIndex(
          (i, idx) => i.name === item.name && idx === index
        );
        if (targetIndex !== -1) copy.splice(targetIndex, 1);
        return copy;
      });

      setFilteredCart((prev) => {
        const copy = [...prev];
        const targetIndex = copy.findIndex(
          (i, idx) => i.name === item.name && idx === index
        );
        if (targetIndex !== -1) copy.splice(targetIndex, 1);
        return copy;
      });
    }
  };
  const handleFilter = (type: string | null) => {
    const source = isCart ? cart : allItems;
    setFilter(type);
    if (!type) {
      isCart ? setFilteredCart(source) : setFiltered(source);
      return;
    }
    const res = source.filter((item) => {
      if (!item.type) return false;
      const types = Array.isArray(item.type) ? item.type : [item.type];
      return types.some((t) => t.toLowerCase().includes(type));
    });
    isCart ? setFilteredCart(res) : setFiltered(res);
  };
  const handleToggleCart = () => {
    setIsCart(!isCart);
    setFilter(null);
  };
  const sharedProps: SharedProps = {
    className: classes.buttonHeader,
    variant: "filled",
    onClick: handleToggleCart,
  };
  const handleOrder = async () => {
    const payload = { cart, cashierId, job, total, payment, customerName };
    const clearCart = () => {
      setFilteredCart([]);
      setCart([]);
    };
    if (isCustomer) {
      const res = await fetchNui("av_business", "payOrder", payload);
      if (res) clearCart();
    } else {
      fetchNui("av_business", "sendOrder", payload);
      clearCart();
    }
  };
  useEffect(() => {
    const fetchData = async () => {
      const resp = await fetchNui("av_business", "getJobCashier", {
        job,
        isCustomer,
        cashierId,
      });
      if (resp) {
        setAllIngredients(resp.ingredients);
        if (isCustomer) {
          setCart(resp.items);
          setFilteredCart(resp.items);
          setAccounts(resp.accounts);
          setCustomerName(resp.customerName);
        } else {
          setAllItems(resp.items);
          setFiltered(resp.items);
        }
        setAllTypes(resp.types);
        setInventory(resp.inventory);
      } else {
        if (isEnvBrowser()) {
          setAllIngredients(ApiIngredients);
          setAllTypes(ApiTypes);
          setAllItems(ApiJobItems);
          setFiltered(ApiJobItems);
        }
      }
      setTimeout(() => {
        setLoaded(true);
      }, 200);
    };
    fetchData();
  }, []);
  useEffect(() => {
    const newTotal = cart.reduce((acc, item) => {
      const price = item.price ?? 1;
      return acc + price;
    }, 0);
    setTotal(newTotal);
  }, [cart]);
  useEffect(() => {
    if (isCart) {
      setFilteredCart(cart);
    } else {
      setFiltered(allItems);
    }
  }, [isCart]);
  if (!loaded) return <Loading />;
  return (
    <>
      <Header
        isCart={isCart}
        sharedProps={sharedProps}
        cashierId={cashierId}
        cartLength={cart.length}
        isCustomer={isCustomer}
        daLang={daLang}
      />
      <Subheader
        allTypes={allTypes}
        daLang={daLang}
        filter={filter}
        filtered={filtered.length}
        filteredCart={filteredCart.length}
        handleFilter={handleFilter}
        handleSearch={handleSearch}
        isCart={isCart}
      />
      <ScrollArea
        type="hover"
        scrollbars="y"
        scrollbarSize={3}
        h={`calc(60vh - 170px)`}
        offsetScrollbars
        bg="var(--dark-500)"
      >
        <Grid grow pl="sm" gutter="md" p="sm">
          {(isCart ? filteredCart : filtered).map((product, index: number) => (
            <Grid.Col
              key={`${product.name}-${index}`}
              span={3}
              miw={200}
              maw={230}
            >
              <ItemCard
                daLang={daLang}
                getIngredientLabel={getIngredientLabel}
                handleCart={handleCart}
                handleIngredient={handleIngredient}
                inventory={inventory}
                isCart={isCart}
                product={product}
                usingIngredient={usingIngredient}
                index={index}
              />
            </Grid.Col>
          ))}
        </Grid>
      </ScrollArea>
      <Group mt="md">
        {isCustomer && (
          <>
            <TextInput
              classNames={global}
              size="xs"
              ml="14px"
              placeholder={lang.customer_name}
              value={customerName}
              maxLength={50}
              onChange={(e) => {
                setCustomerName(e.currentTarget.value);
              }}
              styles={{
                input: {
                  fontFamily: "'Unbounded', sans-serif",
                  fontSize: "11px",
                },
              }}
            />
            <Select
              classNames={global}
              size="xs"
              placeholder={lang.payment_method}
              searchable
              data={accounts}
              value={payment}
              onChange={(e) => {
                if (!e) return;
                setPayment(e);
              }}
              w={160}
              allowDeselect={false}
              styles={{
                input: {
                  fontFamily: "'Unbounded', sans-serif",
                  fontSize: "11px",
                },
              }}
            />
          </>
        )}
        <Group ml="auto">
          <Text fz="13px" c="gray.4" fw={300}>{`${lang.total}: ${
            daLang.money_symbol
          }${total.toLocaleString("en-US")}`}</Text>
          <Button
            className={classes.button}
            mr="14px"
            size="xs"
            fw={400}
            disabled={filteredCart.length === 0 || (isCustomer && !payment)}
            onClick={handleOrder}
          >
            {daLang.cashier.complete_button}
          </Button>
        </Group>
      </Group>
    </>
  );
};
