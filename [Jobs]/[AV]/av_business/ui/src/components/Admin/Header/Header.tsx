import { Group, Button, Text } from "@mantine/core";
import { useRecoilValue } from "recoil";
import { Lang } from "../../../reducers/atoms";
import classes from "./style.module.css";
import global from "../../../global.module.css";
import { fetchNui } from "../../../hooks/useNuiEvents";

export const Header = () => {
  const { admin: lang }: any = useRecoilValue(Lang);
  return (
    <Group className={classes.header} p="xs">
      <Text fw={600}>{lang.header}</Text>
      <Button
        ml="auto"
        size="xs"
        className={global.button}
        variant="filled"
        c="var(--white-500)"
        onClick={() => {
          fetchNui("av_business", "newZone");
        }}
      >
        New zone
      </Button>
    </Group>
  );
};
