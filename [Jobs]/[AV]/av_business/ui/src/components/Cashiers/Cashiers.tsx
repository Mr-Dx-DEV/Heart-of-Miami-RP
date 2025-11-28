import { useState, useEffect } from "react";
import { Box, Transition } from "@mantine/core";
import { fetchNui } from "../../hooks/useNuiEvents";
import { Loading } from "../Loading";
import { Panel } from "./Panel";
import { useRecoilValue } from "recoil";
import { Lang } from "../../reducers/atoms";
import classes from "./style.module.css";

interface Properties {
  isCustomer: boolean;
  cashierId: string;
  job: string;
}

export const Cashiers = ({ isCustomer, cashierId, job }: Properties) => {
  const daLang: any = useRecoilValue(Lang);
  const [loading, setLoading] = useState(true);
  const [loaded, setLoaded] = useState(false);
  useEffect(() => {
    const fetchData = async () => {
      setLoaded(true);
      setTimeout(() => {
        setLoading(false);
      }, 250);
    };
    const onKeyDown = (e: KeyboardEvent) => {
      if (e.code === "Escape") {
        setLoaded(false);
        setTimeout(() => {
          fetchNui("av_business", "closeCashier");
        }, 250);
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
        duration={250}
        exitDuration={250}
        timingFunction="ease"
      >
        {(styles) => (
          <Box className={classes.box} style={styles}>
            {loading ? (
              <Loading />
            ) : (
              <Panel
                cashierId={cashierId}
                daLang={daLang}
                job={job}
                isCustomer={isCustomer}
              />
            )}
          </Box>
        )}
      </Transition>
    </Box>
  );
};
