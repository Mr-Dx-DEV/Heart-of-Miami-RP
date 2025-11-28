import { useState, useEffect } from "react";
import {
  Stack,
  Card,
  Text,
  Group,
  Flex,
  Select,
  ScrollArea,
} from "@mantine/core";
import { useRecoilValue } from "recoil";
import classes from "./style.module.css";
import global from "../../../../global.module.css";
import { Lang } from "../../../../reducers/atoms";
import { formatTimestamp } from "../../../../hooks/formatTime";

export const Transactions = ({ myLogs }: any) => {
  const daLang: any = useRecoilValue(Lang);
  const [loaded, setLoaded] = useState(false);
  const [currentLogs, setCurrentLogs] = useState(myLogs);
  const lang: any = daLang.bank;
  const filterLogs = (type: string | null) => {
    setLoaded(false);
    let filteredLogs = myLogs;

    if (type) {
      filteredLogs = myLogs.filter((log: any) => log.type === type);
    }
    const sortedLogs = [...filteredLogs].sort(
      (a, b) => Number(b.date) - Number(a.date)
    );
    setCurrentLogs(sortedLogs);
    setLoaded(true);
  };

  useEffect(() => {
    const sorted = [...myLogs].sort((a, b) => Number(b.date) - Number(a.date));
    setCurrentLogs(sorted);
    setLoaded(true);
  }, [myLogs]);

  return (
    <>
      <Group
        justify="space-between"
        mt="xs"
        align="center"
        display={"flex"}
        p={"xs"}
      >
        <Text fz={"sm"} fw={500}>
          {lang.latest}
        </Text>
        <Select
          placeholder={lang.filter}
          data={[
            { value: "deposit", label: lang.deposits },
            { value: "withdraw", label: lang.withdrawals },
          ]}
          classNames={global}
          size="xs"
          onChange={(value) => {
            filterLogs(value ?? null);
          }}
        />
      </Group>
      <ScrollArea
        className={classes.scroll}
        offsetScrollbars
        type="hover"
        scrollbars={"y"}
        scrollbarSize={6}
        // h={height > 900 ? "calc(100vh - 260px)" : "calc(75vh - 260px)"}
      >
        <Stack gap="xs">
          {loaded &&
            currentLogs.slice(0, 30).map((log: any, index: number) => (
              <Card
                className={classes.card}
                key={`${log.date}-${log.amount}-${index}`}
                p={"sm"}
                style={{
                  border: "solid 1px rgba(255,255,255,0.1)",
                  borderRadius: "6px",
                  overflow: "hidden",
                }}
              >
                <Group justify="space-between" w={"100%"} grow>
                  <Flex
                    justify="flex-start"
                    align="flex-start"
                    direction="column"
                    mah={100}
                  >
                    <Text fz="xs" c="dimmed">
                      {lang.description}
                    </Text>
                    <Text
                      fz="xs"
                      style={{
                        overflow: "auto",
                        wordWrap: "break-word",
                        overflowWrap: "break-word",
                      }}
                      maw={"100%"}
                    >
                      {log.description}
                    </Text>
                  </Flex>
                  <Flex
                    justify="flex-start"
                    align="flex-start"
                    direction="column"
                    wrap="wrap"
                  >
                    <Text fz="xs" c="dimmed">
                      {lang.employee}
                    </Text>
                    <Text fz="xs">{log.employee}</Text>
                  </Flex>
                  <Flex
                    justify="flex-start"
                    align="flex-start"
                    direction="column"
                    wrap="wrap"
                  >
                    <Text fz="xs" c="dimmed">
                      {lang.date}
                    </Text>
                    <Text fz="xs">{formatTimestamp(log.date)}</Text>
                  </Flex>
                  <Flex
                    justify="flex-start"
                    align="flex-start"
                    direction="column"
                    wrap="wrap"
                  >
                    <Text fz="xs" c="dimmed">
                      {lang.amount}
                    </Text>
                    <Text fz="xs">{`${
                      daLang.money_symbol
                    }${log.amount.toLocaleString("en-US")}`}</Text>
                  </Flex>
                  <Flex
                    justify="flex-start"
                    align="flex-start"
                    direction="column"
                    wrap="wrap"
                  >
                    <Text fz="xs" c="dimmed">
                      {lang.type}
                    </Text>
                    <Text fz="xs" c={log.type == "deposit" ? `teal` : `red`}>
                      {log.type == "deposit" ? lang.deposit : lang.withdraw}
                    </Text>
                  </Flex>
                </Group>
              </Card>
            ))}
        </Stack>
      </ScrollArea>
    </>
  );
};
