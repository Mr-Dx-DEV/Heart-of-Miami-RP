import { Group, Text, ScrollArea, Stack } from "@mantine/core";
import classes from "./style.module.css";
import { ZoneDataType } from "./types";

interface Properties {
  zoneData: ZoneDataType[];
  handleCurrent: (name: string) => void;
}

function sortZonesAlphabetically(zones: ZoneDataType[]): ZoneDataType[] {
  return zones.sort((a, b) => a.zoneLabel.localeCompare(b.zoneLabel));
}

export const Zones = ({ zoneData, handleCurrent }: Properties) => {
  const sorted = sortZonesAlphabetically(zoneData);
  return (
    <Stack>
      <ScrollArea
        h={530}
        offsetScrollbars
        type="hover"
        scrollbars="y"
        scrollbarSize={5}
      >
        <Stack gap="xs">
          {sorted.map((zone) => (
            <Group
              key={zone.zoneName}
              className={classes.group}
              onClick={() => {
                handleCurrent(zone.zoneName);
              }}
            >
              <Text fz="sm" truncate maw={200}>
                {zone.zoneLabel}
              </Text>
            </Group>
          ))}
        </Stack>
      </ScrollArea>
    </Stack>
  );
};
