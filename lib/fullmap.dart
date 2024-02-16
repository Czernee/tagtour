import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class FullMap extends StatefulWidget {
  const FullMap();

  @override
  State createState() => FullMapState();
}

class FullMapState extends State<FullMap> {
  MapboxMap? mapboxMap;

  _onMapCreated(MapboxMap mapboxMap) {
    this.mapboxMap = mapboxMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MapWidget(
      key: ValueKey("mapWidget"),
      resourceOptions: ResourceOptions(accessToken: 'sk.eyJ1IjoiYnJ1aGRyZWRkMTIzIiwiYSI6ImNsc290a2l4dDBoMDgya3A5ZGVpaXk4bHcifQ.yL0JNi5ms28HUhjb0Pg25A'),
      onMapCreated: _onMapCreated,
    ));
  }
}