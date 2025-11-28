import {
  Card,
  Text,
  Image,
  Group,
  Tooltip,
  ScrollArea,
  Badge,
  Button,
} from "@mantine/core";
import classes from "./style.module.css";
import { JobItem } from "../../types/types";

interface ItemType extends JobItem {
  toUse: string[];
}

interface Properties {
  daLang: any;
  inventory: string;
  product: ItemType | JobItem;
  usingIngredient: (
    ingredient: string,
    toUse: string[] | undefined
  ) => string | boolean | undefined;
  handleIngredient: (name: string, ingredient: string, index: number) => void;
  getIngredientLabel: (ingredient: string) => string;
  handleCart: (
    product: ItemType | JobItem,
    type: string,
    index: number
  ) => void;
  isCart: boolean;
  index: number;
}

export const ItemCard = ({
  daLang,
  inventory,
  product,
  usingIngredient,
  handleIngredient,
  getIngredientLabel,
  handleCart,
  isCart,
  index,
}: Properties) => {
  const lang = daLang.cashier;
  console.log(`https://cfx-nui-${inventory}${product?.name}.png`);
  return (
    <Card className={classes.card} h={250}>
      <Card.Section className={classes.imageSection}>
        <Image
          src={`${`https://cfx-nui-${inventory}${product?.name}.png`}`}
          fallbackSrc="./item_default.png"
          w={60}
          mt={5}
        />
      </Card.Section>
      <Group mt="sm">
        <Tooltip label={product.label} color="dark.4" fz="xs">
          <Text fz="xs" truncate maw={100} c="white">
            {product.label}
          </Text>
        </Tooltip>
        <Text fz="xs" ml="auto" c="gray.3">{`${
          daLang.money_symbol
        }${product.price.toLocaleString("en-US")}`}</Text>
      </Group>
      <Text fz="xs" c="dimmed">
        {lang.ingredients}
      </Text>
      <ScrollArea h={65} type="hover" scrollbars="y" scrollbarSize={4}>
        <Group gap={7} mt="xs">
          {product.ingredients.map((ingredient) => (
            <Badge
              size="xs"
              fw={300}
              color={
                usingIngredient(ingredient, product.toUse)
                  ? `var(--blue-500)`
                  : `dark.4`
              }
              fz={8}
              onClick={() => {
                handleIngredient(product.name, ingredient, index);
              }}
            >
              {getIngredientLabel(ingredient)}
            </Badge>
          ))}
        </Group>
      </ScrollArea>
      <Button
        className={classes.button}
        mt="sm"
        size="xs"
        fw={300}
        fz="11px"
        radius={20}
        style={{
          justifyContent: "center",
          position: "absolute",
          bottom: 0,
          marginBottom: "10px",
          width: "180px",
        }}
        onClick={() => {
          handleCart(product, isCart ? "remove" : "add", index);
        }}
      >
        {isCart ? lang.remove : lang.add_cart}
      </Button>
    </Card>
  );
};
