import { Stack, Card, Flex, Group, Text, Image, Tooltip } from "@mantine/core";
import { useViewportSize } from "@mantine/hooks";
import { useRecoilValue } from "recoil";
import { IconHelpOctagon, IconStarFilled } from "@tabler/icons-react";
import { formatString } from "../../../../hooks/formatString";
import { Lang } from "../../../../reducers/atoms";
import classes from "./style.module.css";

interface Properties {
  label: string;
  name?: string;
  value: number | string;
  placeholder: string;
  avatar?: string;
  stars?: boolean;
  height?: number;
  permission?: string;
}

export const Tops = ({ business }: any) => {
  const { overview: lang }: any = useRecoilValue(Lang);
  const { topEmployee, stars, todayDish, permissions } = business;
  const getRatingComment = (stars: number): string => {
    if (stars >= 4.5) {
      return lang.ratedByCustomers["5"];
    } else if (stars >= 4.0) {
      return lang.ratedByCustomers["4"];
    } else if (stars >= 3.0) {
      return lang.ratedByCustomers["3"];
    } else if (stars >= 2.0) {
      return lang.ratedByCustomers["2"];
    } else if (stars >= 1.0) {
      return lang.ratedByCustomers["1"];
    } else {
      return lang.ratedByCustomers["0"];
    }
  };
  const cards: Properties[] = [
    {
      label: lang.employeeOfMonth.title,
      name: topEmployee.name ? topEmployee.name : `N/A`,
      value: 0,
      placeholder: formatString(
        lang.employeeOfMonth.description,
        String(topEmployee.activities)
      ),
      avatar: topEmployee?.image ? topEmployee.image : "none",
      height: 500,
    },
    {
      label: lang.customersFavorite.title,
      value: todayDish.label,
      placeholder: lang.customersFavorite.description,
      height: 500,
      permission: "isRestaurant",
    },
    {
      label: lang.ratedByCustomers.title,
      value: stars,
      placeholder: getRatingComment(stars),
      stars: true,
      height: 700,
    },
  ];
  const { height } = useViewportSize();
  const shouldShowImage = height > 900;
  if (!height) return null;
  return (
    <Stack>
      {cards.map((data, index) => {
        const hasPermission =
          !data.permission || permissions?.[data.permission] === true;

        return height >= (data.height ?? 0) && hasPermission ? (
          <Card key={index} className={classes.card} h={129}>
            <Group>
              <Text
                c="white"
                fw={600}
                fz={height > 700 ? "md" : "sm"}
                truncate
                maw={250}
              >
                {data.label}
              </Text>
              {data.avatar && height > 780 && (
                <Tooltip
                  multiline
                  label={
                    <Text fz="xs" c="gray.4">
                      {lang.employeeOfMonth.month_explanation}
                    </Text>
                  }
                  maw={300}
                  color="dark.5"
                >
                  <IconHelpOctagon
                    style={{
                      height: "14px",
                      width: "14px",
                      marginLeft: "auto",
                    }}
                  />
                </Tooltip>
              )}
            </Group>
            <Group mt="sm" gap="xs">
              {data.avatar && shouldShowImage && (
                <Image
                  src={data.avatar}
                  w={40}
                  fallbackSrc="./user_default.png"
                  radius={100}
                />
              )}
              <Flex direction="column" gap={3}>
                <Group gap="xs">
                  <Text c="gray" fw={500} fz={height > 700 ? "md" : "sm"}>
                    {data.name ? data.name : data.value}
                  </Text>
                  {data.stars && (
                    <IconStarFilled
                      style={{ width: "14px", height: "14px" }}
                      stroke={1.5}
                      color="var(--orange-600)"
                    />
                  )}
                </Group>
                <Text fz="xs" c="dimmed">
                  {data.placeholder}
                </Text>
              </Flex>
            </Group>
          </Card>
        ) : null;
      })}
    </Stack>
  );
};
