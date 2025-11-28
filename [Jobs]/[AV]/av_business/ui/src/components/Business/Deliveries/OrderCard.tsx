import { Card, Group, Tooltip, Text, ActionIcon, Flex } from "@mantine/core";
import { DeliveryType } from "../../../types/types";
import {
  IconFileDescription,
  IconMapPinShare,
  IconCheck,
  IconUserExclamation,
  IconTrash,
} from "@tabler/icons-react";
import classes from "./style.module.css";
import { fetchNui } from "../../../hooks/useNuiEvents";

interface Properties {
  data: DeliveryType;
  symbol: string;
  handleDetails: (order: DeliveryType) => void;
  handleOrder: (type: string, order: DeliveryType) => void;
  selected: boolean;
  isMine: boolean;
  daLang: any;
}

const iconStyle = { width: "15px", height: "15px" };

export const OrderCard = ({
  data,
  symbol,
  handleDetails,
  selected,
  handleOrder,
  isMine,
  daLang,
}: Properties) => {
  const lang = daLang.deliveries;
  return (
    <Card
      className={classes.card}
      bg={selected || isMine ? "var(--dark-400)" : "var(--dark-500)"}
    >
      <Group justify="space-between">
        <Flex direction="column">
          <Text fz="sm" c="gray.1">
            {data.name}
          </Text>
          <Text fz="xs" c="dimmed">
            {lang.order_id}
          </Text>
        </Flex>
        <Flex direction="column">
          <Text fz="sm" c="gray.1">
            {data.allProducts}
          </Text>
          <Text fz="xs" c="dimmed">
            {lang.products}
          </Text>
        </Flex>
        <Flex direction="column">
          <Text fz="sm" c="gray.1" maw={100} truncate>
            {data.claimed ? data.claimed : `N/A`}
          </Text>
          <Text fz="xs" c="dimmed">
            {lang.claimed_by}
          </Text>
        </Flex>
        <Flex direction="column">
          <Text fz="sm" c="gray.1">
            {`${symbol}${data.total.toLocaleString("en-US")}`}
          </Text>
          <Text fz="xs" c="dimmed">
            {lang.total}
          </Text>
        </Flex>
      </Group>
      <Group mt="sm" justify="center" gap="lg">
        <Tooltip label={lang.details} color="dark.4">
          <ActionIcon
            variant="transparent"
            size="sm"
            color="violet"
            onClick={() => {
              handleDetails(data);
            }}
          >
            <IconFileDescription style={iconStyle} stroke={1.5} />
          </ActionIcon>
        </Tooltip>
        <Tooltip label={lang.waypoing} color="dark.4">
          <ActionIcon
            variant="transparent"
            size="sm"
            color="cyan"
            onClick={() => {
              fetchNui("av_laptop", "setGPS", data.coords);
            }}
          >
            <IconMapPinShare style={iconStyle} stroke={1.5} />
          </ActionIcon>
        </Tooltip>
        <Tooltip label={lang.claim_order} color="dark.4">
          <ActionIcon
            variant="transparent"
            size="sm"
            color="orange"
            onClick={() => {
              handleOrder("claimOrder", data);
            }}
          >
            <IconUserExclamation style={iconStyle} stroke={1.5} />
          </ActionIcon>
        </Tooltip>
        <Tooltip label={lang.mark_as} color="dark.4">
          <ActionIcon
            variant="transparent"
            size="sm"
            color="teal"
            onClick={() => {
              handleOrder("delivered", data);
            }}
          >
            <IconCheck style={iconStyle} stroke={1.5} />
          </ActionIcon>
        </Tooltip>
        <Tooltip label={lang.decline} color="dark.4">
          <ActionIcon
            variant="transparent"
            size="sm"
            color="red"
            onDoubleClick={() => {
              handleOrder("deleteOrder", data);
            }}
          >
            <IconTrash style={iconStyle} stroke={1.5} />
          </ActionIcon>
        </Tooltip>
      </Group>
    </Card>
  );
};
