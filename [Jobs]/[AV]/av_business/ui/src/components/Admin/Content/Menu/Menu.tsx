import { useEffect, useState } from "react";
import {
  Group,
  Paper,
  Stack,
  Text,
  Image,
  Table,
  ScrollArea,
  ActionIcon,
  Box,
} from "@mantine/core";
import { IconEraser } from "@tabler/icons-react";
import { fetchNui, isEnvBrowser } from "../../../../hooks/useNuiEvents";
import { useRecoilValue } from "recoil";
import { Lang } from "../../../../reducers/atoms";
import classes from "./style.module.css";
import { ApiJobItems } from "../../../../API/products";
import { Loading } from "../../../Loading";
import { JobItem } from "../../../../types/types";

function joinIngredients(ingredients: string[]): string {
  if (ingredients.length === 0) {
    return "N/A";
  }
  return ingredients.join(" ");
}

interface Property {
  job: string;
}

export const Menu = ({ job }: Property) => {
  const daLang: any = useRecoilValue(Lang);
  const { admin: lang } = daLang;
  const [loaded, setLoaded] = useState(false);
  const [inventory, setInventory] = useState("");
  const [allItems, setAllItems] = useState<JobItem[]>([]);

  const deleteItem = async (name: string) => {
    const resp = await fetchNui("av_business", "deleteItemAdmin", {
      name,
      job,
    });
    if (resp) {
      setAllItems(resp);
    }
  };
  useEffect(() => {
    const fetchData = async () => {
      const resp = await fetchNui("av_business", "admin", {
        job,
        type: "menu",
      });
      if (resp) {
        setAllItems(resp.items);
        setInventory(resp.inventory);
      } else {
        if (isEnvBrowser()) {
          setAllItems(ApiJobItems);
        }
      }
      setTimeout(() => {
        setLoaded(true);
      }, 200);
    };
    fetchData();
  }, [job]);
  if (!loaded) return <Loading />;
  return (
    <ScrollArea type="hover" scrollbars="y" scrollbarSize={3} h={520}>
      <Table
        classNames={classes}
        stickyHeader
        striped
        stripedColor="var(--dark-900)"
        withColumnBorders={false}
        withRowBorders={false}
        layout="fixed"
      >
        <Table.Thead>
          <Table.Tr>
            <Table.Th w={50} />
            <Table.Th>{lang.item}</Table.Th>
            <Table.Th>{lang.price}</Table.Th>
            <Table.Th>{lang.ingredients}</Table.Th>
            <Table.Th>{lang.prop}</Table.Th>
            <Table.Th>{lang.type}</Table.Th>
            <Table.Th>{lang.actions}</Table.Th>
          </Table.Tr>
        </Table.Thead>
        <Table.Tbody>
          {allItems.map((item) => (
            <Table.Tr key={item.name}>
              <Table.Td w={40}>
                <Image
                  src={
                    item.image
                      ? item.image
                      : `${`https://cfx-nui-${inventory}${item?.name}.png`}`
                  }
                  fallbackSrc="./item_default.png"
                  w={40}
                />
              </Table.Td>
              <Table.Td>{item.label}</Table.Td>
              <Table.Td>{`${daLang.money_symbol}${
                item.price ? item.price.toLocaleString("en-US") : `N/A`
              }`}</Table.Td>
              <Table.Td>{item.ingredients.length}</Table.Td>
              <Table.Td>{item.prop}</Table.Td>
              <Table.Td>{item.type}</Table.Td>
              <Table.Td>
                <ActionIcon
                  size="sm"
                  variant="transparent"
                  color="var(--red-400)"
                  onDoubleClick={() => {
                    deleteItem(item.name);
                  }}
                >
                  <IconEraser style={{ height: "16px", width: "16px" }} />
                </ActionIcon>
              </Table.Td>
            </Table.Tr>
          ))}
        </Table.Tbody>
      </Table>
    </ScrollArea>
  );
};
