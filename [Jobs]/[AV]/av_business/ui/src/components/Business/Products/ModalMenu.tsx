import {
  Stack,
  Modal,
  TextInput,
  Select,
  MultiSelect,
  NumberInput,
  Button,
} from "@mantine/core";
import global from "../../../global.module.css";
import { useRecoilValue } from "recoil";
import { Lang } from "../../../reducers/atoms";
import { useEffect, useState } from "react";
import { ComboInput } from "./Combobox";
import { ItemProperties, SelectType } from "../../../types/types";
import { fetchNui } from "../../../hooks/useNuiEvents";
import classes from "./style.module.css";

interface Properties {
  showModal: (state: boolean) => void;
  min: number;
  max: number;
  whitelisted: SelectType[];
  ingredients: any;
  animations: any;
  itemTypes: SelectType[];
  existing?: ItemProperties;
}
export const ModalMenu = ({
  showModal,
  whitelisted,
  min,
  max,
  ingredients,
  animations,
  itemTypes,
  existing,
}: Properties) => {
  const daLang: any = useRecoilValue(Lang);
  const lang = daLang.menu;
  const [filteredAnimations, setFilteredAnimations] = useState<SelectType[]>(
    []
  );
  const [filteredIngredients, setFilteredIngredients] = useState<SelectType[]>(
    []
  );
  const [item, setItem] = useState(
    existing || {
      name: "",
      description: "",
      image: "",
      type: null,
      ingredients: [],
      price: 0,
      isNew: true,
      prop: "",
    }
  );
  const handleUpdate = (field: string, value: any) => {
    setItem((prev) => {
      const updated = { ...prev, [field]: value };
      return updated;
    });
  };
  const handleSave = () => {
    if (filteredIngredients.length > 0) {
      if (item.ingredients.length < min) {
        fetchNui("av_laptop", "notification", {
          title: lang.error_title,
          message: lang.not_enough_ingredients,
          type: "error",
        });
        return;
      }
    }
    if (existing) {
      fetchNui("av_business", "editItem", item);
    } else {
      fetchNui("av_business", "addItem", item);
    }
    showModal(false);
  };

  useEffect(() => {
    const type = item.type;
    const filterIngredients = ingredients
      .filter((item: any) => item.type.includes(type))
      .map((item: any) => ({
        value: item.value,
        label: item.label,
      }));
    const filterAnimations = animations
      .filter((item: any) => item.type.includes(type))
      .map((item: any) => ({
        value: item.value,
        label: item.label,
      }));
    setFilteredAnimations(filterAnimations);
    setFilteredIngredients(filterIngredients);
  }, [item.type]);

  return (
    <Modal
      classNames={global}
      lockScroll={false}
      opened={true}
      c="white"
      withinPortal={false}
      size="325"
      title="New Product"
      centered
      styles={{
        root: {
          position: "relative",
          right: "10%",
        },
      }}
      onClose={() => {
        showModal(false);
      }}
    >
      <Stack gap="xs">
        <ComboInput
          handleField={handleUpdate}
          items={whitelisted}
          disabled={existing ? true : false}
          name={existing?.name ? existing.name : ""}
        />
        <TextInput
          classNames={global}
          label={lang.productDescription}
          placeholder={lang.descriptionPlaceholder}
          value={item.description}
          size="xs"
          maxLength={50}
          onChange={(e) => {
            handleUpdate("description", e.target.value);
          }}
        />
        {item.isNew && (
          <TextInput
            classNames={global}
            label={lang.productImage}
            placeholder={lang.imagePlaceholder}
            value={item.image}
            size="xs"
            maxLength={150}
            onChange={(e) => {
              handleUpdate("image", e.target.value);
            }}
          />
        )}
        <Select
          classNames={global}
          size="xs"
          label={lang.productType}
          searchable
          value={item.type}
          data={itemTypes}
          onChange={(e) => {
            handleUpdate("type", e);
            handleUpdate("prop", undefined);
            handleUpdate("ingredients", []);
          }}
        />
        {filteredAnimations.length > 0 && (
          <Select
            classNames={global}
            size="xs"
            label={lang.animation}
            searchable
            data={filteredAnimations}
            value={item.prop ?? undefined}
            onChange={(e) => {
              handleUpdate("prop", e);
            }}
          />
        )}
        {filteredIngredients.length > 0 && (
          <MultiSelect
            classNames={global}
            size="xs"
            label={daLang.products.ingredients}
            searchable
            data={filteredIngredients}
            value={item.ingredients}
            onChange={(e) => {
              handleUpdate("ingredients", e);
            }}
            maxValues={max}
            min={3}
          />
        )}
        <NumberInput
          classNames={global}
          label={lang.price}
          allowDecimal={false}
          allowLeadingZeros={false}
          allowNegative={false}
          prefix={daLang.money_symbol}
          thousandSeparator
          size="xs"
          max={1000000}
          value={item.price}
          onChange={(e) => {
            handleUpdate("price", e);
          }}
        />
        <Button
          className={classes.button}
          mt="sm"
          onClick={handleSave}
          disabled={!item.type}
          c={!item.type ? `var(--blue-300)` : undefined}
        >
          Confirm
        </Button>
      </Stack>
    </Modal>
  );
};
