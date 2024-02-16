import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class FullMap extends StatefulWidget {
  const FullMap({super.key});

  @override
  State createState() => FullMapState();
}

class FullMapState extends State<FullMap> {
  MapboxMap? mapboxMap;

  _onMapCreated(MapboxMap mapboxMap) {
    this.mapboxMap = mapboxMap;
    this.mapboxMap?.setCamera(CameraOptions(
      center: Point(coordinates: Position(38.936694, 47.208735)).toJson(),
      zoom: 14
    ));
    this.mapboxMap?.setBounds(CameraBoundsOptions(
      bounds: CoordinateBounds(
        //Юга запад-47.157511,38.828945
        //Северо-восток-47.290974,38.956618
        southwest: Point(
          coordinates: Position(
            38.828945,
            47.157511,
          )
        ).toJson(),
        northeast: Point(
          coordinates: Position(
            38.956618,
            47.290974,
          )
        ).toJson(),
        infiniteBounds: false),
        maxZoom: 18,
        minZoom: 12,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MapWidget(
      key: const ValueKey("mapWidget"),
      resourceOptions: ResourceOptions(accessToken: 'sk.eyJ1IjoiYnJ1aGRyZWRkMTIzIiwiYSI6ImNsc290a2l4dDBoMDgya3A5ZGVpaXk4bHcifQ.yL0JNi5ms28HUhjb0Pg25A'),
      onMapCreated: _onMapCreated,
    ));
  }
}