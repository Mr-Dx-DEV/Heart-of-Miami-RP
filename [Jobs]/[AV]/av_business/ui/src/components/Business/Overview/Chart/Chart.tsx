import "@mantine/charts/styles.css";
import { Text, Box } from "@mantine/core";
import { AreaChart } from "@mantine/charts";
import { useRecoilValue } from "recoil";
import { Lang } from "../../../../reducers/atoms";
import { useViewportSize } from "@mantine/hooks";
import classes from "./style.module.css";

export const Chart = ({ business }: any) => {
  const { chart, chartElements } = business;
  const daLang: any = useRecoilValue(Lang);
  const { overview: lang } = daLang;
  const { height } = useViewportSize();
  return (
    <Box className={classes.card} p="xs">
      <Text fz="lg" c="gray.3" pl="24px">
        {lang.weekOverview}
      </Text>
      <AreaChart
        mt="lg"
        h={height > 700 ? 350 : 250}
        data={chart}
        dataKey="date"
        withDots={false}
        series={chartElements}
        curveType="linear"
        tickLine="none"
        gridAxis="x"
        pr="lg"
        fillOpacity={0.055}
      />
    </Box>
  );
};
