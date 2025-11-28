import { Accordion, Text, Stack, ScrollArea } from "@mantine/core";
import { SelectType } from "../../../types/types";
import classes from "./style.module.css";
import { useRecoilValue } from "recoil";
import { Lang } from "../../../reducers/atoms";

interface Properties {
  job: string | null;
  setJob: (option: string) => void;
  options: SelectType[];
  tab: string;
  setTab: (option: string) => void;
}

function sortJobs<T extends { label: string }>(arr: T[]): T[] {
  return arr.sort((a, b) => a.label.localeCompare(b.label));
}

export const Navbar = ({ job, setJob, options, tab, setTab }: Properties) => {
  const daLang: any = useRecoilValue(Lang);
  const { admin: lang } = daLang;
  const allJobs = sortJobs(options);
  const items = allJobs.map((item) => (
    <Accordion.Item key={item.value} value={item.value}>
      <Accordion.Control
        bg={job == item.value ? `var(--blue-600)` : `transparent`}
      >
        <Text truncate maw={180} c="gray.4" fz="14px">
          {item.label}
        </Text>
      </Accordion.Control>
      <Accordion.Panel bg="var(--dark-400)">
        <Stack gap="xs" mt={3}>
          <Text
            fz="sm"
            fw={500}
            c={
              tab == "overview" && job == item.value
                ? `var(--blue-300)`
                : "gray.4"
            }
            onClick={() => {
              setJob(item.value);
              setTab("overview");
            }}
          >
            {lang.overview}
          </Text>
          <Text
            fz="sm"
            fw={500}
            c={
              tab == "menu" && job == item.value ? `var(--blue-300)` : "gray.4"
            }
            onClick={() => {
              setJob(item.value);
              setTab("menu");
            }}
          >
            {lang.products}
          </Text>
          <Text
            fz="sm"
            fw={500}
            c={
              tab == "zones" && job == item.value ? `var(--blue-300)` : "gray.4"
            }
            onClick={() => {
              setJob(item.value);
              setTab("zones");
            }}
          >
            {lang.zones}
          </Text>
        </Stack>
      </Accordion.Panel>
    </Accordion.Item>
  ));
  return (
    <ScrollArea type="hover" scrollbars="y" scrollbarSize={3} h={540}>
      <Accordion variant="unstyled">{items}</Accordion>
    </ScrollArea>
  );
};
