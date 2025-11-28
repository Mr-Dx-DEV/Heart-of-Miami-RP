import "leaflet/dist/leaflet.css";
import { MapContainer, Polygon, Tooltip, useMap } from "react-leaflet";
import L from "leaflet";
import { Text, Flex, Group } from "@mantine/core";
import { useEffect, useState } from "react";
import { ZoneType } from "../../../types/types";
import "./map.css";

interface Properties {
  daLang: any;
  zones: ZoneType[];
  handleCurrent: (name: string) => void;
}

export const Map = ({ daLang, zones, handleCurrent }: Properties) => {
  const [loaded, setLoaded] = useState(false);
  const eventHandlers = (name: string) => ({
    click: () => {
      handleCurrent(name);
    },
  });
  const MapComponent = () => {
    const map = useMap();
    const customcrs = L.extend({}, L.CRS.Simple, {
      projection: L.Projection.LonLat,
      scale: function (zoom: number) {
        return Math.pow(2, zoom);
      },
      zoom: function (sc: number) {
        return Math.log(sc) / 0.6931471805599453;
      },
      distance: function (pos1: any, pos2: any) {
        var x_difference = pos2.lng - pos1.lng;
        var y_difference = pos2.lat - pos1.lat;
        return Math.sqrt(
          x_difference * x_difference + y_difference * y_difference
        );
      },
      transformation: new L.Transformation(0.02072, 117.3, -0.0205, 172.8),
      infinite: false,
    });
    map.options.minZoom = 1.5;
    map.options.maxZoom = 5.5;
    map.options.touchZoom = false;
    map.options.zoom = 3;
    map.options.preferCanvas = true;
    map.options.center = [0, -1024];
    map.options.scrollWheelZoom = true;
    map.options.crs = customcrs;
    map.attributionControl.setPrefix("");
    map.options.doubleClickZoom = false;
    map.options.dragging = false;
    if (!loaded) {
      setLoaded(true);
      map.setView([-60, -5], 3);
    }
    useEffect(() => {
      const sw = map.unproject([0, 1024], 3 - 1);
      const ne = map.unproject([1024, 0], 3 - 1);
      const mapbounds = new L.LatLngBounds(sw, ne);
      map.setMaxBounds(mapbounds);
      L.imageOverlay(
        "https://r2.fivemanage.com/QmVAYSlqeAlD4IxVbdvu5/map.jpeg",
        //"https://r2.fivemanage.com/QmVAYSlqeAlD4IxVbdvu5/images/zones.jpg",
        mapbounds
      ).addTo(map);
    }, [map]);

    return null;
  };
  return (
    <>
      <MapContainer
        style={{
          height: "530px",
        }}
      >
        <MapComponent />
        {zones.map((zone) => (
          <Polygon
            key={zone.name}
            positions={zone.polygon}
            pathOptions={{
              color: "rgba(255,255,255,0.25)",
              fillColor: zone.color,
              fillOpacity: zone.color == "gray" ? 0.3 : 0.5,
              weight: 10,
            }}
            eventHandlers={eventHandlers(zone.name)}
          >
            <Tooltip
              className="tooltip"
              direction="top"
              offset={[0, -10]}
              opacity={1}
              permanent={false}
              sticky
            >
              <Flex direction="column" ta="center">
                <Text fz="sm" fw={600} truncate>
                  {zone.label}
                </Text>
                <Text fz="xs">{`${zone.gang}`}</Text>
              </Flex>
            </Tooltip>
          </Polygon>
        ))}
      </MapContainer>
    </>
  );
};
