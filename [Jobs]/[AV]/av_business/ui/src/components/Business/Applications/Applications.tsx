import {
  Grid,
  Group,
  Button,
  TextInput,
  Text,
  Card,
  Stack,
  Textarea,
  Select,
  ScrollArea,
  NumberInput,
  Tooltip,
  Checkbox,
  Switch,
} from "@mantine/core";
import { useEffect, useState } from "react";
import { useRecoilValue } from "recoil";
import { Lang } from "../../../reducers/atoms";
import { ApiAppForm, ApiApplications } from "../../../API/applications";
import { useViewportSize } from "@mantine/hooks";
import { fetchNui } from "../../../hooks/useNuiEvents";
import { Loading } from "../../Loading";
import { formatTimestamp } from "../../../hooks/formatTime";
import classes from "./style.module.css";
import global from "../../../global.module.css";

const Applications = () => {
  const daLang: any = useRecoilValue(Lang);
  const lang = daLang.applications;
  const [loaded, setLoaded] = useState(false);
  const [allApplications, setAllApplications] = useState(ApiApplications);
  const [form, setForm] = useState(ApiAppForm);
  const [maxQuestions, setMaxQuestions] = useState(3);
  const [selected, setSelected] = useState<string[]>([]);
  const [isOpen, setIsOpen] = useState(false);
  const { height } = useViewportSize();

  const options = [
    { value: "input", label: lang.text_input },
    { value: "number", label: lang.number_input },
    { value: "textarea", label: lang.textarea },
  ];
  const handleUpdate = (
    index: number,
    field: "type" | "title",
    value: string | null
  ) => {
    setForm((prevForm) => {
      const updated = [...prevForm];
      if (updated[index]) {
        updated[index] = {
          ...updated[index],
          [field]: value ?? "",
        };
      } else {
        updated[index] = {
          type: field === "type" ? value ?? "input" : "input",
          title: field === "title" ? value ?? "" : "",
        };
      }
      return updated;
    });
  };
  const handleSelect = (identifier: string) => {
    setSelected((prev) =>
      prev.includes(identifier)
        ? prev.filter((id) => id !== identifier)
        : [...prev, identifier]
    );
  };
  const handleSave = () => {
    fetchNui("av_business", "saveForm", form);
  };
  const handleDelete = async () => {
    const resp = await fetchNui("av_business", "deleteApplications", selected);
    if (resp) {
      setAllApplications(resp);
    }
  };
  useEffect(() => {
    const fetchData = async () => {
      const resp = await fetchNui("av_business", "getApplications");
      if (resp) {
        setAllApplications(resp.applications);
        setForm(resp.form);
        setMaxQuestions(resp.maxQuestions);
        setIsOpen(resp.isOpen);
      }
      setTimeout(() => {
        setLoaded(true);
      }, 200);
    };
    fetchData();
  }, []);
  if (!loaded) return <Loading />;
  return (
    <>
      <Group
        bg="var(--dark-500)"
        p="sm"
        style={{
          borderRadius: "6px",
          border: "solid 1px rgba(255,255,255,0.1)",
        }}
      >
        <Text
          fz="lg"
          c="white"
          fw={500}
          lts={1}
        >{`${allApplications.length} ${lang.header}`}</Text>
        <Group ml="auto">
          <Switch
            checked={isOpen}
            defaultChecked
            labelPosition="left"
            label={lang.toggle_switch}
            color="var(--blue-400)"
            size="xs"
            onChange={(e) => {
              setIsOpen(e.currentTarget.checked);
              fetchNui(
                "av_business",
                "toggleApplications",
                e.currentTarget.checked
              );
            }}
          />
          <Button
            className={selected.length > 0 ? classes.button : undefined}
            size="xs"
            variant="filled"
            disabled={selected.length == 0}
            onClick={() => {
              handleDelete();
            }}
          >
            {lang.delete_selected}
          </Button>
        </Group>
      </Group>
      <Grid mt="md" grow>
        <Grid.Col span={4} maw={400}>
          <Card className={classes.card} bg="var(--dark-400)">
            <Text c="var(--blue-100)" fw={600}>
              {lang.application_form}
            </Text>
            <ScrollArea
              offsetScrollbars
              type="hover"
              scrollbars={"y"}
              scrollbarSize={6}
              mah={`${height / 2.55}px`}
              h={maxQuestions * 111}
              mt="md"
            >
              <Stack gap="sm">
                {[...Array(maxQuestions)].map((_, i) => {
                  const question = form[i];
                  return (
                    <Stack key={i} gap="xs">
                      <Text fz="sm" c="white">{`${lang.question} ${
                        i + 1
                      }`}</Text>
                      <TextInput
                        classNames={global}
                        placeholder={lang.question_title}
                        size="xs"
                        value={question?.title ?? ""}
                        onChange={(e) => {
                          handleUpdate(i, "title", e.currentTarget.value);
                        }}
                      />
                      <Select
                        classNames={global}
                        placeholder={lang.input_type}
                        data={options}
                        size="xs"
                        value={question?.type ?? undefined}
                        onChange={(e) => {
                          handleUpdate(i, "type", e);
                        }}
                      />
                    </Stack>
                  );
                })}
              </Stack>
            </ScrollArea>
            <Button
              className={classes.button}
              size="xs"
              mt="md"
              onClick={handleSave}
            >
              {lang.save_changes}
            </Button>
          </Card>
        </Grid.Col>
        <Grid.Col span={8}>
          {allApplications.length > 0 ? (
            <ScrollArea
              className={classes.scroll}
              offsetScrollbars
              type="hover"
              scrollbars={"y"}
              scrollbarSize={6}
            >
              <Grid>
                {allApplications.map((application) => (
                  <Grid.Col span={4} miw={250} key={application.identifier}>
                    <Card className={classes.card}>
                      <Checkbox
                        color={"var(--orange-500)"}
                        radius="xl"
                        size="xs"
                        ml="auto"
                        checked={selected.includes(application.identifier)}
                        onChange={() => {
                          handleSelect(application.identifier);
                        }}
                        styles={{
                          icon: {
                            color: "rgba(20,20,20,1)",
                          },
                        }}
                      />
                      <Stack gap="xs">
                        {application.form.map((field) => (
                          <>
                            {field.type == "input" && (
                              <TextInput
                                classNames={global}
                                size="xs"
                                label={field.title}
                                defaultValue={field.answer ?? ""}
                              />
                            )}
                            {field.type == "number" && (
                              <NumberInput
                                classNames={global}
                                size="xs"
                                label={field.title}
                                defaultValue={field.answer ?? ""}
                              />
                            )}
                            {field.type == "textarea" && (
                              <Textarea
                                classNames={global}
                                size="xs"
                                label={field.title}
                                defaultValue={field.answer ?? ""}
                                rows={5}
                              />
                            )}
                          </>
                        ))}
                        <Group>
                          <Text fz="xs" c="dimmed">
                            {formatTimestamp(application.date)}
                          </Text>
                          <Tooltip
                            label={lang.playerIdentifier}
                            color="dark.5"
                            fz="sm"
                          >
                            <Text
                              fz="xs"
                              c="dimmed"
                              ml="auto"
                              truncate
                              onClick={() => {
                                fetchNui(
                                  "av_laptop",
                                  "copy",
                                  application.playerIdentifier
                                );
                              }}
                              style={{ cursor: "pointer" }}
                            >
                              {application.playerIdentifier}
                            </Text>
                          </Tooltip>
                        </Group>
                      </Stack>
                    </Card>
                  </Grid.Col>
                ))}
              </Grid>
            </ScrollArea>
          ) : (
            <Text ta="center" mt="30%" c="dimmed" fz="sm">
              {lang.noApplications}
            </Text>
          )}
        </Grid.Col>
      </Grid>
    </>
  );
};

export default Applications;
