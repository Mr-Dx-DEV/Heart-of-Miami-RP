import { Group, ThemeIcon, Text, Select, TextInput } from "@mantine/core";
import {
  IconBasketFilled,
  IconMugFilled,
  IconSearch,
} from "@tabler/icons-react";
import global from "../../global.module.css";
import { SelectType } from "../../types/types";

interface Properties {
  isCart: boolean;
  filtered: number;
  filteredCart: number;
  allTypes: SelectType[];
  filter: string | null;
  handleFilter: (input: string | null) => void;
  daLang: any;
  handleSearch: (input: string) => void;
}

export const Subheader = ({
  isCart,
  filtered,
  filteredCart,
  allTypes,
  filter,
  handleFilter,
  daLang,
  handleSearch,
}: Properties) => {
  const lang = daLang.cashier;
  return (
    <Group p="sm">
      <Group gap="xs">
        <ThemeIcon
          bg="var(--blue-500)"
          style={{
            cursor: "default",
          }}
          c="gray.1"
          radius={50}
        >
          {isCart ? (
            <IconBasketFilled
              style={{
                height: "16px",
                width: "16px",
              }}
            />
          ) : (
            <IconMugFilled
              style={{
                height: "16px",
                width: "16px",
                marginLeft: "1px",
              }}
            />
          )}
        </ThemeIcon>
        <Text fz="sm" c="gray.3" fw={500}>{`${
          isCart ? filteredCart : filtered
        } ${isCart ? lang.cart_subheader : lang.products_subheader}`}</Text>
      </Group>
      <Group ml="auto">
        <Select
          classNames={global}
          placeholder={lang.filter}
          size="xs"
          w={150}
          data={allTypes}
          searchable
          value={filter}
          styles={{
            input: {
              fontFamily: "'Unbounded', sans-serif",
              fontSize: "11px",
            },
          }}
          onChange={(e) => {
            handleFilter(e);
          }}
        />
        <TextInput
          classNames={global}
          styles={{
            input: {
              fontFamily: "'Unbounded', sans-serif",
              fontSize: "11px",
            },
          }}
          placeholder={daLang.search}
          leftSection={<IconSearch size={16} stroke={1.5} />}
          size="xs"
          w={155}
          onChange={(e) => {
            handleSearch(e.currentTarget.value);
          }}
        />
      </Group>
    </Group>
  );
};
