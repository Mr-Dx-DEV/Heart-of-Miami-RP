import { Text, Grid, Card, Group, ActionIcon, Tooltip } from "@mantine/core";
import { IconCirclePlus, IconCircleMinus } from "@tabler/icons-react";
import classes from "./style.module.css";

interface Properties {
  symbol: string;
  lang: any;
  funds: number;
  revenue: number;
  handleFunds: (type: string) => void;
}

export const Header = ({
  symbol,
  lang,
  funds,
  revenue,
  handleFunds,
}: Properties) => {
  return (
    <Grid>
      <Grid.Col span={6} maw={300}>
        <Card className={classes.card} p="md">
          <Text
            fz="22px"
            c="white"
            fw={600}
            lh={1.15}
          >{`${symbol}${funds.toLocaleString("en-US")}`}</Text>
          <Group mt="xs" gap="xs">
            <Text fz="sm" c="dimmed" fw={500}>
              {lang.available_funds}
            </Text>
            <Group ml="auto" gap="sm">
              <Tooltip label={lang.remove_funds} color="dark.5">
                <ActionIcon
                  size="xs"
                  variant="transparent"
                  c="red.3"
                  onClick={() => {
                    handleFunds("remove");
                  }}
                >
                  <IconCircleMinus stroke={1.5} />
                </ActionIcon>
              </Tooltip>
              <Tooltip label={lang.add_funds} color="dark.5">
                <ActionIcon
                  size="xs"
                  variant="transparent"
                  c="teal.3"
                  onClick={() => {
                    handleFunds("add");
                  }}
                >
                  <IconCirclePlus stroke={1.5} />
                </ActionIcon>
              </Tooltip>
            </Group>
          </Group>
        </Card>
      </Grid.Col>
      <Grid.Col span={6} maw={300}>
        <Card className={classes.card} p="md">
          <Text
            fz="22px"
            c="white"
            fw={600}
            lh={1.15}
          >{`${symbol}${revenue.toLocaleString("en-US")}`}</Text>
          <Text mt="xs" fz="sm" c="dimmed" fw={500}>
            {lang.monthly_revenue}
          </Text>
        </Card>
      </Grid.Col>
    </Grid>
  );
};
