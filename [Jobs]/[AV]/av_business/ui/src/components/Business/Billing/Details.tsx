import { Modal, Stack, Text, Group, ActionIcon } from "@mantine/core";
import global from "../../../global.module.css";
import { BillingType } from "../../../types/types";
import { fetchNui } from "../../../hooks/useNuiEvents";
import { IconCopy } from "@tabler/icons-react";

interface Properties {
  data: BillingType;
  close: (data: null) => void;
  daLang: any;
}

export const Details = ({ data, close, daLang }: Properties) => {
  const lang = daLang.billing;
  return (
    <Modal
      opened
      onClose={() => {
        close(null);
      }}
      classNames={global}
      lockScroll={false}
      c="white"
      withinPortal={false}
      size="325"
      title={lang.details_header}
      centered
      styles={{
        root: {
          position: "relative",
          right: "10%",
        },
      }}
    >
      <Stack gap={4}>
        <Group gap="xs">
          <Text fz="sm" c="dimmed">
            {`${lang.invoiceid}:`}
          </Text>
          <Group gap="xs">
            <Text fz="sm" c="gray.3">
              {data.invoiceid}
            </Text>
            <ActionIcon
              size="xs"
              variant="transparent"
              onClick={() => {
                fetchNui("av_laptop", "copy", data.invoiceid);
              }}
            >
              <IconCopy
                color="var(--blue-200)"
                style={{ height: "14px", width: "14px" }}
                stroke={1.5}
              />
            </ActionIcon>
          </Group>
        </Group>
        <Group gap="xs">
          <Text fz="sm" c="dimmed">
            {`${lang.customer}:`}
          </Text>
          <Text fz="sm" c="gray.3">
            {data.customerName}
          </Text>
        </Group>
        <Group gap="xs">
          <Text fz="sm" c="dimmed">
            {`${lang.phone}:`}
          </Text>
          <Group gap="xs">
            <Text fz="sm" c="gray.3">
              {data.customerPhone}
            </Text>
            <ActionIcon
              size="xs"
              variant="transparent"
              onClick={() => {
                fetchNui("av_laptop", "copy", data.customerPhone);
              }}
            >
              <IconCopy
                color="var(--blue-200)"
                style={{ height: "14px", width: "14px" }}
                stroke={1.5}
              />
            </ActionIcon>
          </Group>
        </Group>
        <Group gap="xs">
          <Text fz="sm" c="dimmed">
            {`${lang.employee}:`}
          </Text>
          <Text fz="sm" c="gray.3">
            {data.senderName}
          </Text>
        </Group>
        <Group gap="xs">
          <Text fz="sm" c="dimmed">
            {`${lang.issued}:`}
          </Text>
          <Text fz="sm" c="gray.3">
            {data.issued}
          </Text>
        </Group>
        <Group gap="xs">
          <Text fz="sm" c="dimmed">
            {`${lang.status}:`}
          </Text>
          <Text fz="sm" c={data.paid ? `teal` : `orange`}>
            {`${data.paid ? lang.paid : lang.pending}`}
          </Text>
        </Group>
        <Text fz="sm" c="dimmed">
          {`${lang.details}:`}
        </Text>
        <Stack mt={4} mah={200} style={{ overflow: "auto" }} gap="xs" pr="xs">
          {data.description.map((item, index) => (
            <Group
              key={index}
              style={{
                borderBottom:
                  index == data.description.length
                    ? "unset"
                    : "solid 1px rgba(200,200,200,0.055)",
              }}
            >
              <Group>
                {item.amount && (
                  <Text fz="sm" c="var(--white-600)">
                    {`${item.amount}x`}
                  </Text>
                )}
                <Text fz="sm" c="white">
                  {item.item}
                </Text>
              </Group>
              <Text fz="sm" c="gray.2" ml="auto">{`${
                daLang.money_symbol
              }${item.price.toLocaleString("en-US")}`}</Text>
            </Group>
          ))}
        </Stack>
        <Group gap="xs" mt="sm" ml="auto">
          <Text fz="sm" c="dimmed">
            {`${lang.total}:`}
          </Text>
          <Text fz="sm" c="gray.3">
            {`${daLang.money_symbol}${data.amount.toLocaleString("en-US")}`}
          </Text>
        </Group>
      </Stack>
    </Modal>
  );
};
