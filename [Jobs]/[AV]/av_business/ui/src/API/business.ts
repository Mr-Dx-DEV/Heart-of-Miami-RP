import { ApiGraph } from "./graph";

export const ApiBusiness = {
  monthlyGenerated: 0,
  stars: 0,
  inventory: "ox_inventory/web/images/",
  jobLabel: "UwU Cafe",
  todayOrders: 0,
  label: "UwU Cafe",
  funds: 0,
  blip: true,
  employees: 1,
  chart: ApiGraph,
  chartElements: [],
  topEmployee: {
    image: undefined,
    activities: 0,
    name: "N/A",
  },
  todayDish: {
    image: undefined,
    label: "N/A",
    amount: 0,
    name: "N/A",
  },
  todayIncome: 0,
  allPermissions: [
    {
      value: "employees",
      label: "Employees",
    },
    {
      value: "menu",
      label: "Menu",
    },
    {
      value: "bank",
      label: "Bank",
    },
    {
      value: "applications",
      label: "Applications",
    },
    {
      value: "stashes",
      label: "Stashes",
    },
    {
      value: "cameras",
      label: "Cameras",
    },
  ],
  applications: false,
  name: "uwucafe",
  currentMonth: "06",
  webhooks: [],
  permissions: {
    isRestaurant: true,
  },
};
