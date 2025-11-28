import { Text, Button, Group, Modal } from "@mantine/core";
import global from "../../../../global.module.css";
import { useRecoilValue } from "recoil";
import { Lang } from "../../../../reducers/atoms";

export const Confirmation = ({ title, message, cb, data }: any) => {
  const daLang: any = useRecoilValue(Lang);
  return (
    <Modal
      classNames={global}
      opened
      onClose={() => {
        cb(false, data);
      }}
      centered
      title={
        <Text fw={500} c="white">
          {title}
        </Text>
      }
      size={360}
    >
      <Text fz="sm" c="gray.4">
        {message}
      </Text>
      <Group grow mt="sm">
        <Button
          size="xs"
          variant="light"
          color="teal"
          onClick={() => {
            cb(true, data);
          }}
        >
          {daLang.confirm_button}
        </Button>
        <Button
          size="xs"
          variant="light"
          color="red"
          onClick={() => {
            cb(false, data);
          }}
        >
          {daLang.cancel_button}
        </Button>
      </Group>
    </Modal>
  );
};
