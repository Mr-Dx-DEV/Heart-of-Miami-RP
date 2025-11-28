import { useEffect, useState } from "react";
import {
  Group,
  Paper,
  Text,
  Flex,
  ActionIcon,
  ScrollArea,
  Tooltip,
  Stack,
} from "@mantine/core";
import { IconMapPinShare, IconEdit, IconEraser } from "@tabler/icons-react";
import { fetchNui, isEnvBrowser } from "../../../../hooks/useNuiEvents";
import { Confirmation } from "../Confirmation/Confirmation";
import { useRecoilValue } from "recoil";
import { Lang } from "../../../../reducers/atoms";
import { Loading } from "../../../Loading";
import { ApiZones } from "../../../../API/admin";

interface Property {
  job: string;
}

const createData = (
  info: any,
  teleport: any,
  editItem: any,
  deleteItem: any,
  daLang: any
) => {
  const { admin: lang } = daLang;
  const data = info.map((item: any, index: number) => {
    return (
      <Paper
        key={index}
        p="xs"
        bg="var(--dark-500)"
        style={{ border: "solid 1px rgba(255,255,255,0.1)" }}
      >
        <Group grow justify="space-between" w={"100%"}>
          <Flex
            justify="center"
            align="flex-start"
            direction="column"
            wrap="wrap"
            w={100}
            style={{ overflow: "hidden", textOverflow: "ellipsis" }}
          >
            <Text fz="sm" c="dimmed">
              {lang.identifier}
            </Text>
            <Text fz="sm" truncate maw={"65%"}>
              {item.name}
            </Text>
          </Flex>
          <Flex
            justify="center"
            align="flex-start"
            direction="column"
            wrap="wrap"
            w={100}
          >
            <Text fz="sm" c="dimmed">
              {lang.job}
            </Text>
            <Text fz="sm" truncate w={"100%"}>
              {item.job}
            </Text>
          </Flex>
          <Flex
            justify="center"
            align="flex-start"
            direction="column"
            wrap="wrap"
          >
            <Text fz="sm" c="dimmed">
              {daLang.job}
            </Text>
            <Text fz="sm" tt={"capitalize"}>
              {item.type}
            </Text>
          </Flex>
          <Group justify="center">
            <Tooltip label={lang.teleport} color="dark.4">
              <ActionIcon
                size="sm"
                variant="light"
                color="orange.4"
                onClick={() => {
                  teleport(item.data);
                }}
              >
                <IconMapPinShare style={{ width: "70%", height: "70%" }} />
              </ActionIcon>
            </Tooltip>
            <Tooltip label={lang.edit} color="dark.4">
              <ActionIcon
                size="sm"
                variant="light"
                color="cyan.4"
                onClick={() => {
                  editItem(item);
                }}
              >
                <IconEdit style={{ width: "70%", height: "70%" }} />
              </ActionIcon>
            </Tooltip>
            <Tooltip label={lang.delete} color="dark.4">
              <ActionIcon
                size="sm"
                variant="light"
                color="red.4"
                onClick={() => {
                  deleteItem(item);
                }}
              >
                <IconEraser style={{ width: "70%", height: "70%" }} />
              </ActionIcon>
            </Tooltip>
          </Group>
        </Group>
      </Paper>
    );
  });
  return data;
};

export const Zones = ({ job }: Property) => {
  const daLang: any = useRecoilValue(Lang);
  const { admin: lang } = daLang;
  const [stats, setStats] = useState([]);
  const [loaded, setLoaded] = useState(false);
  const [showConfirm, setShowConfirm] = useState<boolean>(false);
  const [tempData, setTempData] = useState<any>([]);

  const editItem = (item: any) => {
    fetchNui("av_business", "editZone", item);
  };
  const deleteItem = (item: any) => {
    setTempData(item);
    setShowConfirm(true);
  };
  const teleport = (data: any) => {
    const { coords } = data;
    fetchNui("av_laptop", "teleport", coords);
  };
  const callback = async (res: boolean, data: any) => {
    setShowConfirm(false);
    if (!res) return;
    setLoaded(false);
    const name = data.name;
    const resp = await fetchNui("av_business", "deleteZone", { name, job });
    if (resp) {
      const data = createData(resp, teleport, editItem, deleteItem, daLang);
      setStats(data);
    }
    setTimeout(() => {
      setLoaded(true);
    }, 200);
  };
  useEffect(() => {
    const fetchData = async () => {
      const resp = await fetchNui("av_business", "admin", {
        job,
        type: "zones",
      });
      if (resp) {
        const data = createData(resp, teleport, editItem, deleteItem, daLang);
        setStats(data);
      } else {
        if (isEnvBrowser()) {
          const data = createData(
            ApiZones,
            teleport,
            editItem,
            deleteItem,
            daLang
          );
          setStats(data);
        }
      }
      setTimeout(() => {
        setLoaded(true);
      }, 200);
    };
    fetchData();
  }, [job]);
  if (!loaded) return <Loading />;
  return (
    <>
      {showConfirm && (
        <Confirmation
          title={lang.deleteHeader}
          message={lang.deleteText}
          cb={callback}
          data={tempData}
        />
      )}
      <ScrollArea type="hover" scrollbars="y" scrollbarSize={3} h={520}>
        <Stack gap="sm">{stats}</Stack>
      </ScrollArea>
    </>
  );
};
