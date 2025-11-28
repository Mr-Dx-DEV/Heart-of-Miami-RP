import { useEffect, useState } from "react";
import {
  Group,
  Button,
  TextInput,
  Text,
  Select,
  ScrollArea,
  Image,
  ActionIcon,
  Tooltip,
  Table,
} from "@mantine/core";
import { IconSearch, IconEdit, IconTrash } from "@tabler/icons-react";
import global from "../../../global.module.css";
import { useRecoilValue } from "recoil";
import { Lang } from "../../../reducers/atoms";
import {
  ApiAnimations,
  ApiIngredients,
  ApiJobItems,
  ApiTypes,
} from "../../../API/products";
import { ItemProperties, JobItem, SelectType } from "../../../types/types";
import classes from "./style.module.css";
import { fetchNui, useNuiEvent } from "../../../hooks/useNuiEvents";
import { Loading } from "../../Loading";
import { parseIngredients } from "../../../hooks/parseIngredients";
import { TableHeader } from "../../TableHeader/TableHeader";
import { sortData } from "./helpers";
import { ModalMenu } from "./ModalMenu";
import { useViewportSize } from "@mantine/hooks";

function mapToValueLabel(items: JobItem[]): SelectType[] {
  return items.map((item) => ({
    value: item.name,
    label: item.label,
  }));
}

const Products = () => {
  const [loaded, setLoaded] = useState(false);
  const daLang: any = useRecoilValue(Lang);
  const { products: lang }: any = daLang;
  const [search, setSearch] = useState("");
  const [itemTypes, setItemTypes] = useState(ApiTypes);
  const [allItems, setAllItems] = useState(ApiJobItems);
  const [currentItems, setCurrentItems] = useState(ApiJobItems);
  const [whitelisted, setWhitelisted] = useState<SelectType[]>([]);
  const [ingredients, setIngredients] = useState(ApiIngredients);
  const [animations, setAnimations] = useState(ApiAnimations);
  const [inventory, setInventory] = useState("");
  const [maxIngredients, setMaxIngredients] = useState(5);
  const [minIngredients, setMinIngredients] = useState(3);
  const [sortBy, setSortBy] = useState<keyof JobItem | null>(null);
  const [reverseSortDirection, setReverseSortDirection] = useState(false);
  const [showModal, setShowModal] = useState(false);
  const [currentItem, setCurrentItem] = useState<ItemProperties | undefined>();
  const { height } = useViewportSize();

  useNuiEvent("products", (items: JobItem[]) => {
    setAllItems(items);
    setCurrentItems(items);
  });
  const handleSearchChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    const value = event.currentTarget.value;
    setSearch(value);
    const search = value.toLowerCase();
    const res = allItems.filter(
      (item) =>
        (item.label ? item.label.toLowerCase().includes(search) : false) ||
        (item.name ? item.name.toLowerCase().includes(search) : false)
    );
    setCurrentItems(res);
  };
  const handleEdit = (item: JobItem) => {
    const newItem = {
      name: item.name,
      description: item.description,
      image: item.image,
      type: item.type,
      ingredients: item.ingredients,
      price: item.price,
      isNew: false,
      prop: item.prop,
    };
    setCurrentItem(newItem);
    setShowModal(true);
  };
  const handleDelete = (name: string) => {
    const filtered = allItems.filter((item) => item.name !== name);
    setAllItems(filtered);
    setCurrentItems(filtered);
    fetchNui("av_business", "deleteItem", name);
  };
  const setSorting = (field: keyof JobItem) => {
    const reversed = field === sortBy ? !reverseSortDirection : false;
    setReverseSortDirection(reversed);
    setSortBy(field);
    setCurrentItems(sortData(allItems, { sortBy: field, reversed, search }));
  };
  const handleFilter = (type: string | null) => {
    if (!type) {
      setCurrentItems(allItems);
    } else {
      const res = allItems.filter((item) =>
        item.type ? item.type.toLowerCase().includes(type) : false
      );
      setCurrentItems(res);
    }
  };
  useEffect(() => {
    const fetchData = async () => {
      const resp = await fetchNui("av_business", "getMenu");
      if (resp) {
        setAllItems(resp.items);
        setCurrentItems(resp.items);
        setItemTypes(resp.types);
        setIngredients(resp.ingredients);
        setAnimations(resp.animations);
        setInventory(resp.inventory);
        setMaxIngredients(resp.maxIngredients);
        setMinIngredients(resp.minIngredients);
        setWhitelisted(resp.whitelisted);
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
      {showModal && (
        <ModalMenu
          showModal={setShowModal}
          whitelisted={whitelisted}
          max={maxIngredients}
          ingredients={ingredients}
          animations={animations}
          itemTypes={itemTypes}
          min={minIngredients}
          existing={currentItem}
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
        >{`${currentItems.length} ${lang.products}`}</Text>
        <TextInput
          classNames={global}
          placeholder={lang.search}
          leftSection={<IconSearch size={16} stroke={1.5} />}
          value={search}
          onChange={handleSearchChange}
          size="xs"
          ml="auto"
          maw={200}
        />
        <Select
          classNames={global}
          data={itemTypes}
          placeholder={lang.filter}
          size="xs"
          w={150}
          onChange={handleFilter}
        />
        <Button
          className={classes.button}
          size="xs"
          variant="filled"
          onClick={() => {
            setCurrentItem(undefined);
            setShowModal(true);
          }}
        >
          {lang.new_product}
        </Button>
      </Group>
      <ScrollArea
        className={classes.scroll}
        type="hover"
        scrollbars={"y"}
        scrollbarSize={6}
        mt="sm"
      >
        <Table
          classNames={classes}
          horizontalSpacing="md"
          verticalSpacing="xs"
          stickyHeader
          borderColor={"var(--dark-400)"}
          layout="auto"
        >
          <Table.Thead>
            <Table.Tr>
              <Table.Thead maw={45} />
              <TableHeader
                sorted={sortBy === "label"}
                reversed={reverseSortDirection}
                onSort={() => setSorting("label")}
              >
                {lang.product}
              </TableHeader>
              {height > 700 && (
                <TableHeader
                  sorted={sortBy === "description"}
                  reversed={reverseSortDirection}
                  onSort={() => setSorting("description")}
                  width={250}
                >
                  {lang.description}
                </TableHeader>
              )}

              <TableHeader
                sorted={sortBy === "ingredients"}
                reversed={reverseSortDirection}
                onSort={() => setSorting("ingredients")}
              >
                {lang.ingredients}
              </TableHeader>
              <TableHeader
                sorted={sortBy === "price"}
                reversed={reverseSortDirection}
                onSort={() => setSorting("price")}
                width={height > 700 ? 150 : 100}
              >
                {lang.price}
              </TableHeader>
              <TableHeader
                sorted={sortBy === "type"}
                reversed={reverseSortDirection}
                onSort={() => setSorting("type")}
              >
                {lang.type}
              </TableHeader>

              <Table.Th className={classes.th}>
                <Text fw={500} fz="sm">
                  {lang.actions}
                </Text>
              </Table.Th>
            </Table.Tr>
          </Table.Thead>
          <Table.Tbody>
            {currentItems.length > 0 &&
              currentItems.map((row) => (
                <Table.Tr key={row.name}>
                  <Table.Td w={40}>
                    <Image
                      src={
                        row.image
                          ? row.image
                          : `${`https://cfx-nui-${inventory}${row?.name}.png`}`
                      }
                      fallbackSrc="./item_default.png"
                      w={40}
                    />
                  </Table.Td>
                  <Table.Td fz="xs">{row.label}</Table.Td>
                  {height > 700 && (
                    <Table.Td fz="xs">{row.description}</Table.Td>
                  )}
                  <Table.Td fz="xs">
                    {parseIngredients(row.ingredients, ingredients)}
                  </Table.Td>
                  <Table.Td fz="xs">{`${
                    daLang.money_symbol
                  }${row.price.toLocaleString("en-US")}`}</Table.Td>
                  <Table.Td fz="xs">{row.type}</Table.Td>
                  <Table.Td>
                    <Group gap="xs">
                      <Tooltip label={lang.edit} color="dark.5">
                        <ActionIcon
                          size="xs"
                          variant="transparent"
                          onClick={() => {
                            handleEdit(row);
                          }}
                        >
                          <IconEdit />
                        </ActionIcon>
                      </Tooltip>
                      <Tooltip label={lang.delete} color="dark.5">
                        <ActionIcon
                          size="xs"
                          variant="transparent"
                          c="red"
                          onDoubleClick={() => {
                            handleDelete(row.name);
                          }}
                        >
                          <IconTrash />
                        </ActionIcon>
                      </Tooltip>
                    </Group>
                  </Table.Td>
                </Table.Tr>
              ))}
          </Table.Tbody>
        </Table>
      </ScrollArea>
    </>
  );
};

export default Products;
