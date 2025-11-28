import { Flex, Text } from "@mantine/core";
import React from "react";

interface Properties {
  label: string;
  value: React.ReactNode;
  color?: string;
}

export const FlexColumn = ({ label, value, color = "gray.1" }: Properties) => (
  <Flex direction="column">
    <Text fz="xs" c={color} fw={500}>
      {value}
    </Text>
    <Text fz="xs" c="dimmed">
      {label}
    </Text>
  </Flex>
);
