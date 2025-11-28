import { useEffect, useState } from "react";
import { MantineProvider, Box } from "@mantine/core";
import { isEnvBrowser } from "./hooks/useNuiEvents";
import { Lang } from "./reducers/atoms";
import { useSetRecoilState } from "recoil";
import { getLang } from "./hooks/getLang";
import "./App.css";
import "@mantine/core/styles.css";
import { MainApp } from "./components/Business/MainApp";
import { BillMenu } from "./components/BillMenu/BillMenu";
import { Poster } from "./components/Poster/Poster";
import { AdminPanel } from "./components/Admin/Admin";
import { Cashiers } from "./components/Cashiers/Cashiers";
import { OrdersMenu } from "./components/Orders/OrdersMenu";
import { ApiOrder } from "./API/orders";
import { ActiveOrder } from "./components/Orders/ActiveOrder";

const App = () => {
  const setLang = useSetRecoilState(Lang);
  const [showApp, setShowApp] = useState(isEnvBrowser());
  const [showBills, setShowBills] = useState(false);
  const [showPoster, setShowPoster] = useState<null | string>(null);
  const [showAdmin, setShowAdmin] = useState(false);
  const [showOrders, setShowOrders] = useState(false);
  const [activeOrder, setActiveOrder] = useState({
    state: false,
    order: ApiOrder,
  });
  const [cashier, setCashier] = useState({
    state: false,
    isCustomer: true,
    cashierId: "av123",
    job: "uwucafe",
  });
  const [loaded, setLoaded] = useState(false);
  window.addEventListener("message", (event) => {
    switch (event.data.message) {
      case "loadApp":
        setShowApp(true);
        break;
      case "billmenu":
        setShowBills(event.data.state);
        break;
      case "poster":
        setShowPoster(event.data.url);
        break;
      case "adminMenu":
        setShowAdmin(event.data.state);
        break;
      case "cashiers":
        setCashier(event.data.cashier);
        break;
      case "orders":
        setShowOrders(event.data.state);
        break;
      case "activeOrder":
        setActiveOrder(event.data);
        break;
      default:
        break;
    }
  });
  useEffect(() => {
    const fetchLang = async () => {
      const resp = await getLang();
      setLang(resp);
      setLoaded(true);
    };
    fetchLang();
  }, []);
  return (
    <>
      {loaded && (
        <MantineProvider defaultColorScheme="dark">
          {showApp && (
            <>
              {isEnvBrowser() ? (
                <>
                  <Box
                    className="main-container"
                    style={{
                      backgroundColor: isEnvBrowser() ? "black" : "transparent",
                    }}
                  >
                    <Box
                      className="laptop-frame"
                      style={{
                        backgroundImage: `url(https://raw.githubusercontent.com/Renovamen/playground-macos/main/public/img/ui/wallpaper-night.jpg)`,
                        backgroundSize: "cover",
                      }}
                    >
                      <Box className="app-window">
                        <MainApp />
                      </Box>
                    </Box>
                  </Box>
                </>
              ) : (
                <MainApp />
              )}
            </>
          )}
          {showBills && <BillMenu />}
          {showPoster && <Poster url={showPoster} />}
          {showAdmin && <AdminPanel />}
          {cashier.state && (
            <Cashiers
              isCustomer={cashier.isCustomer}
              cashierId={cashier.cashierId}
              job={cashier.job}
            />
          )}
          {showOrders && <OrdersMenu />}
          {activeOrder.state && <ActiveOrder order={activeOrder.order} />}
        </MantineProvider>
      )}
    </>
  );
};
export default App;
