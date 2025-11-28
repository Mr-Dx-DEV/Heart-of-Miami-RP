import { useEffect, useState } from "react";
import { Box, Grid, Transition } from "@mantine/core";
import classes from "./style.module.css";
import { Navbar } from "./Navbar/Navbar";
import { Overview } from "./Content/Overview/Overview";
import { Menu } from "./Content/Menu/Menu";
import { Zones } from "./Content/Zones/Zones";
import { fetchNui, isEnvBrowser } from "../../hooks/useNuiEvents";
import { SelectType } from "../../types/types";
import { ApiJob } from "../../API/alljobs";
import { Header } from "./Header/Header";
import { Loading } from "../Loading";

export const AdminPanel = () => {
  const [job, setJob] = useState<string>("");
  const [loading, setLoading] = useState(true);
  const [loaded, setLoaded] = useState(false);
  const [allJobs, setAllJobs] = useState<SelectType[]>([]);
  const [tab, setTab] = useState("");
  useEffect(() => {
    const fetchData = async () => {
      const resp = await fetchNui("av_business", "getJobs");
      if (resp) {
        setAllJobs(resp);
      } else {
        if (isEnvBrowser()) {
          setAllJobs(ApiJob);
        }
      }
      setLoaded(true);
      setTimeout(() => {
        setLoading(false);
      }, 200);
    };
    const onKeyDown = (e: KeyboardEvent) => {
      if (e.code === "Escape") {
        setLoaded(false);
        setTimeout(() => {
          fetchNui("av_business", "closeAdmin");
        }, 500);
      }
    };
    fetchData();
    window.addEventListener("keydown", onKeyDown);
    return () => window.removeEventListener("keydown", onKeyDown);
  }, []);
  return (
    <Box className={classes.container}>
      <Transition
        mounted={loaded}
        transition="fade-down"
        duration={500}
        exitDuration={500}
        timingFunction="ease"
      >
        {(styles) => (
          <Box className={classes.panel} style={styles}>
            {!loading ? (
              <>
                <Header />
                <Grid gutter={0}>
                  <Grid.Col span={2} miw={190} maw={190}>
                    <Navbar
                      job={job}
                      setJob={setJob}
                      options={allJobs}
                      tab={tab}
                      setTab={setTab}
                    />
                  </Grid.Col>
                  <Grid.Col span="auto" bg="var(--dark-800)">
                    {loaded && (
                      <Box className={classes.content} p="sm">
                        {tab == "overview" && <Overview job={job} />}
                        {tab == "menu" && <Menu job={job} />}
                        {tab == "zones" && <Zones job={job} />}
                      </Box>
                    )}
                  </Grid.Col>
                </Grid>
              </>
            ) : (
              <Loading />
            )}
          </Box>
        )}
      </Transition>
    </Box>
  );
};
