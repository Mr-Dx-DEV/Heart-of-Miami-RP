import { Grid } from "@mantine/core";
import { useEffect, useState } from "react";
import { Loading } from "../../Loading";
import { HeaderStats } from "./HeaderStats/HeaderStats";
import { Chart } from "./Chart/Chart";
import { Tops } from "./Tops/Tops";
import { fetchNui, isEnvBrowser } from "../../../hooks/useNuiEvents";
import { useViewportSize } from "@mantine/hooks";
import { ApiBusiness } from "../../../API/business";

const Overview = () => {
  const [loaded, setLoaded] = useState(false);
  const [business, setBusiness] = useState({});
  const { height } = useViewportSize();
  useEffect(() => {
    const fetchData = async () => {
      const resp = await fetchNui("av_business", "overview");
      if (resp) {
        setBusiness(resp);
      } else {
        if (isEnvBrowser()) {
          setBusiness(ApiBusiness);
        }
      }
      setLoaded(true);
    };
    fetchData();
  }, []);
  if (!loaded) return <Loading />;
  return (
    <>
      <HeaderStats business={business} />
      <Grid mt="xs">
        <Grid.Col span={height > 700 ? 9 : 8}>
          <Chart business={business} />
        </Grid.Col>
        <Grid.Col span={height > 700 ? 3 : 4}>
          <Tops business={business} />
        </Grid.Col>
      </Grid>
    </>
  );
};

export default Overview;
