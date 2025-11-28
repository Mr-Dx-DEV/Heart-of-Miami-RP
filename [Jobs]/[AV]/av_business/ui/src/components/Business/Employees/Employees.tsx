import { useEffect, useState } from "react";
import {
  Tooltip,
  ScrollArea,
  Table,
  Text,
  TextInput,
  Avatar,
  Group,
  ActionIcon,
  Button,
} from "@mantine/core";
import { IconEdit, IconSearch, IconTrash } from "@tabler/icons-react";
import { ApiEmployees } from "../../../API/employees";
import { TableHeader } from "../../TableHeader/TableHeader";
import { sortData } from "./helpers";
import { Employee, ModalType } from "../../../types/types";
import { fetchNui, isEnvBrowser } from "../../../hooks/useNuiEvents";
import { useRecoilValue } from "recoil";
import classes from "./style.module.css";
import global from "../../../global.module.css";
import { ModalMenu } from "../../ModalMenu/ModalMenu";
import { BusinessInfo, Lang } from "../../../reducers/atoms";
import { Loading } from "../../Loading";
import { useViewportSize } from "@mantine/hooks";

const keysToExclude = ["owner", "isBoss"];

type Grade = {
  value: string;
  label: string;
};

function getGradeLabel(
  gradeName: string | number,
  allGrades: Grade[] | Grade
): string {
  const gradesArray = Array.isArray(allGrades) ? allGrades : [allGrades];

  const match = gradesArray.find((grade) => grade.value === gradeName);
  return match ? match.label : "N/A";
}

const Employees = () => {
  const mainLang: any = useRecoilValue(Lang);
  const lang = mainLang.employees;
  const [loaded, setLoaded] = useState(false);
  const [search, setSearch] = useState("");
  const { name } = useRecoilValue(BusinessInfo);
  const { height } = useViewportSize();
  const [allEmployees, setAllEmployees] = useState(
    isEnvBrowser() ? ApiEmployees : []
  );
  const [allGrades, setAllGrades] = useState([]);
  const [allPermissions, setAllPermissions] = useState([]);
  const [sortedData, setSortedData] = useState(allEmployees);
  const [sortBy, setSortBy] = useState<keyof Employee | null>(null);
  const [reverseSortDirection, setReverseSortDirection] = useState(false);
  const [modal, setModal] = useState<ModalType>({
    state: false,
    info: {
      title: "",
      options: [],
    },
  });

  const handleEdit = (employee: any) => {
    const identifier = employee.identifier;
    const permissions = { ...employee.permissions };
    const currentPermissions: string[] = Object.keys(permissions).filter(
      (key) => {
        return permissions[key] === true && !keysToExclude.includes(key);
      }
    );
    setModal({
      ...modal,
      state: true,
      info: {
        title: employee.name,
        options: [
          {
            type: "image",
            image: employee.image,
            height: 100,
            title: employee.name,
            style: { marginTop: "10px" },
            default: "./user_default.png",
          },
          {
            name: "photo",
            title: lang.photo,
            type: "text",
            default: employee.image,
          },
          {
            name: "grade",
            title: lang.grade,
            type: "select",
            default: String(employee.grade.level),
            options: allGrades,
          },
          {
            name: "permissions",
            title: lang.permissions,
            type: "multiselect",
            default: currentPermissions,
            options: allPermissions,
          },
        ],
        extraData: { event: "updateEmployee", identifier, name },
        button: lang.confirm,
      },
    });
  };
  const modalCallback = async (data?: any) => {
    setModal({ ...modal, state: false });
    if (!data) {
      return;
    }
    if (data?.extraData) {
      const { event } = data.extraData;
      const resp = await fetchNui("av_business", event, data);
      if (resp) {
        setAllEmployees(resp);
        setSortedData(resp);
      }
    }
  };
  const setSorting = (field: keyof Employee) => {
    const reversed = field === sortBy ? !reverseSortDirection : false;
    setReverseSortDirection(reversed);
    setSortBy(field);
    setSortedData(sortData(allEmployees, { sortBy: field, reversed, search }));
  };

  const handleSearchChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    const value = event.currentTarget.value;
    setSearch(value);
    setSortedData(
      sortData(allEmployees, {
        sortBy,
        reversed: reverseSortDirection,
        search: value,
      })
    );
  };

  const fireEmployee = (employee: any) => {
    const identifier = employee.identifier;
    setModal({
      ...modal,
      state: true,
      info: {
        title: `${employee.name}`,
        options: [
          {
            type: "info",
            description: lang.fireText,
            size: "sm",
          },
        ],
        button: lang.confirm,
        extraData: { event: "fireEmployee", identifier, name },
      },
    });
  };

  const handleHire = async () => {
    setLoaded(false);
    const resp = await fetchNui("av_business", "hireEmployee");
    if (resp) {
      setAllEmployees(resp);
      setSortedData(resp);
    }
    setLoaded(true);
  };
  useEffect(() => {
    const fetchData = async () => {
      const resp = await fetchNui("av_business", "getEmployees");
      if (resp) {
        setAllEmployees(resp.employees);
        setSortedData(resp.employees);
        setAllGrades(resp.grades);
        setAllPermissions(resp.allPermissions);
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
      {modal.state && (
        <div
          style={{
            position: "relative",
            backgroundColor: "red",
            overflow: "hidden",
          }}
        >
          <ModalMenu data={modal} callback={modalCallback} />
        </div>
      )}
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
        >{`${sortedData.length} ${lang.employees}`}</Text>
        <TextInput
          classNames={global}
          placeholder={lang.search}
          leftSection={<IconSearch size={16} stroke={1.5} />}
          value={search}
          onChange={handleSearchChange}
          size="xs"
          ml="auto"
          w={200}
        />
        <Button
          className={classes.button}
          size="xs"
          onClick={handleHire}
          variant="filled"
        >
          {lang.hire}
        </Button>
      </Group>
      <ScrollArea
        type="hover"
        scrollbars={"y"}
        scrollbarSize={6}
        className={classes.scroll}
        mt="sm"
      >
        <Table
          classNames={classes}
          horizontalSpacing="md"
          verticalSpacing="xs"
          stickyHeader
          borderColor={"var(--dark-400)"}
          layout="auto"
        >
          <Table.Thead>
            <Table.Tr>
              <Table.Thead />
              <TableHeader
                sorted={sortBy === "name"}
                reversed={reverseSortDirection}
                onSort={() => setSorting("name")}
              >
                {lang.name}
              </TableHeader>
              <TableHeader
                sorted={sortBy === "grade"}
                reversed={reverseSortDirection}
                onSort={() => setSorting("grade")}
              >
                {lang.grade}
              </TableHeader>
              {height > 700 && (
                <TableHeader
                  sorted={sortBy === "activities"}
                  reversed={reverseSortDirection}
                  onSort={() => setSorting("activities")}
                >
                  {lang.activities}
                </TableHeader>
              )}
              {height > 700 && (
                <TableHeader
                  sorted={sortBy === "hours"}
                  reversed={reverseSortDirection}
                  onSort={() => setSorting("hours")}
                >
                  {lang.hours}
                </TableHeader>
              )}
              <TableHeader
                sorted={sortBy === "generated"}
                reversed={reverseSortDirection}
                onSort={() => setSorting("generated")}
              >
                {lang.monthlyGenerated}
              </TableHeader>
              <TableHeader
                sorted={sortBy === "lastSeen"}
                reversed={reverseSortDirection}
                onSort={() => setSorting("lastSeen")}
              >
                {lang.lastSeen}
              </TableHeader>
              <Table.Th className={classes.th}>
                <Text fw={500} fz="sm">
                  {lang.actions}
                </Text>
              </Table.Th>
            </Table.Tr>
          </Table.Thead>
          <Table.Tbody>
            {sortedData.length > 0 &&
              sortedData.map((row) => (
                <Table.Tr key={row.name}>
                  <Table.Td w={40}>
                    <Avatar src={row.image} />
                  </Table.Td>
                  <Table.Td>{row.name}</Table.Td>
                  <Table.Td>
                    {getGradeLabel(String(row.grade.level), allGrades)}
                  </Table.Td>
                  {height > 700 && <Table.Td>{row.activities}</Table.Td>}
                  {height > 700 && <Table.Td>{row.hours}</Table.Td>}
                  <Table.Td>{`${mainLang.money_symbol}${
                    row.generated ? row.generated.toLocaleString("en-US") : 0
                  }`}</Table.Td>
                  <Table.Td>{row.lastSeen}</Table.Td>
                  <Table.Td>
                    <Group>
                      <Tooltip label={lang.edit_employee} color="dark.5">
                        <ActionIcon
                          size="xs"
                          variant="transparent"
                          onClick={() => {
                            handleEdit(row);
                          }}
                        >
                          <IconEdit />
                        </ActionIcon>
                      </Tooltip>
                      <Tooltip label={lang.terminate_contract} color="dark.5">
                        <ActionIcon
                          size="xs"
                          variant="transparent"
                          c="red"
                          onDoubleClick={() => {
                            fireEmployee(row);
                          }}
                        >
                          <IconTrash />
                        </ActionIcon>
                      </Tooltip>
                    </Group>
                  </Table.Td>
                </Table.Tr>
              ))}
          </Table.Tbody>
        </Table>
      </ScrollArea>
    </>
  );
};

export default Employees;
