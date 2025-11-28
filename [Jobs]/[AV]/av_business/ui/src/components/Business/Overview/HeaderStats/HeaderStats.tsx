import { Text, Grid, Card, Group } from "@mantine/core";
import {
  IconBellDollar,
  IconBuildingBank,
  IconUsers,
  IconBox,
} from "@tabler/icons-react";
import { useViewportSize } from "@mantine/hooks";
import { useRecoilValue } from "recoil";
import { Lang, MyPermissions } from "../../../../reducers/atoms";
import classes from "./style.module.css";

export const HeaderStats = ({ business }: any) => {
  const daLang: any = useRecoilValue(Lang);
  const lang = daLang.overview;
  const myPermissions = useRecoilValue(MyPermissions);
  const { todayOrders, todayIncome, funds, employees, permissions } = business;
  const { height } = useViewportSize();
  const iconStyle = { height: "16px", width: "16px" };
  const cards = [
    {
      field: "todayOrders",
      label: lang.todayOrders,
      color: "var(--blue-200)",
      value: todayOrders ?? `N/A`,
      icon: IconBox,
      permission: "bank",
      extra: "isRestaurant",
    },
    {
      field: "todayIncome",
      label: lang.todayIncome,
      color: "var(--green-200)",
      value: todayIncome ?? 0,
      money: true,
      icon: IconBellDollar,
      permission: "bank",
    },
    {
      field: "employees",
      label: lang.activeEmployees,
      color: "var(--orange-200)",
      value: employees ?? `N/A`,
      icon: IconUsers,
    },
    {
      field: "funds",
      label: lang.availableFunds,
      color: "#4dabf7",
      value: funds ?? 0,
      icon: IconBuildingBank,
      permission: "bank",
      money: true,
    },
  ];
  const { width } = useViewportSize();
  return (
    <Grid>
      {cards
        .filter((option) => {
          if (option.extra && !permissions?.[option.extra]) return false;
          if (!option.permission) return true;
          if (myPermissions.isBoss) return true;
          if (typeof option.permission === "string") {
            return myPermissions[option.permission] === true;
          }
          return false;
        })
        .map((data, key) => (
          <Grid.Col key={key} span={3}>
            <Card className={classes.card} p="md">
              <Text
                fz={height > 700 ? "22px" : "sm"}
                c="white"
                fw={600}
                lh={1.15}
              >
                {data.money
                  ? `${daLang.money_symbol}${(data.value ?? 0).toLocaleString(
                      "en-US"
                    )}`
                  : `${(data.value ?? 0).toLocaleString("en-US")}`}
              </Text>
              <Group mt="xs" gap="xs">
                {width > 1080 && (
                  <data.icon style={iconStyle} color={data.color} />
                )}
                <Text fz={height > 700 ? "sm" : "xs"} c="dimmed" fw={500}>
                  {data.label}
                </Text>
              </Group>
            </Card>
          </Grid.Col>
        ))}
    </Grid>
  );
};
