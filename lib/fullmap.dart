import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'utils.dart';
import 'siski.dart';

class FullMap extends StatefulWidget {
  const FullMap({super.key});

  @override
  State createState() => FullMapState();
}

class FullMapState extends State<FullMap> {
  MapboxMap? mapboxMap;
  PointAnnotation? pointAnnotation;
  PointAnnotationManager? pointAnnotationManager;

  _onMapCreated(MapboxMap mapboxMap) {
    this.mapboxMap = mapboxMap;

    mapboxMap.setCamera(CameraOptions(
      center: Point(coordinates: Position(38.936694, 47.208735)).toJson(),
      zoom: 14
    ));
    
    // mapboxMap.setBounds(CameraBoundsOptions(
    //   bounds: CoordinateBounds(
    //     southwest: Point(
    //       coordinates: Position(
    //         38.828945,
    //         47.157511,
    //       )
    //     ).toJson(),
    //     northeast: Point(
    //       coordinates: Position(
    //         38.956618,
    //         47.290974,
    //       )
    //     ).toJson(),
    //     infiniteBounds: false),
    //     maxZoom: 18,
    //     minZoom: 12,
    //   ));


    mapboxMap.annotations.createPointAnnotationManager().then((value) async {
      pointAnnotationManager = value;
      final ByteData bytes =
          await rootBundle.load('assets/marker1.jpg');
      final Uint8List list = bytes.buffer.asUint8List();
      createOneAnnotation(list);
      var options = <PointAnnotationOptions>[];
      for (var i = 0; i < 5; i++) {
        options.add(PointAnnotationOptions(
            geometry: createRandomPoint().toJson(), image: list));
      }
      options.add(PointAnnotationOptions(
            geometry: createOnePoint().toJson(), image: list));
      pointAnnotationManager?.createMulti(options);
    });
  }

  @override
  Widget build(BuildContext context) {
      final MapWidget mapWidget =
        MapWidget(
          key: const ValueKey("mapWidget"),
          resourceOptions: ResourceOptions(accessToken: accessToken),
          styleUri: MapboxStyles.DARK,
          onMapCreated: _onMapCreated,);

    return Scaffold(
        body: mapWidget,
    );
  }

  Point createOnePoint() {
    return Point(coordinates: Position(
      38.934849,
      47.203127
    ));
  }

  void createOneAnnotation(Uint8List list) {
    pointAnnotationManager
        ?.create(PointAnnotationOptions(
            geometry: Point(
                coordinates: Position(
              38.934849,
              47.203127
            )).toJson(),
            textField: "SISKI",
            textOffset: [0.0, -2.0],
            textColor: Colors.red.value,
            iconSize: 3,
            iconOffset: [0.0, -5.0],
            symbolSortKey: 10,
            image: list))
        .then((value) => pointAnnotation = value);
  }
}