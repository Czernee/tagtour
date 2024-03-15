import 'dart:math';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

Point createRandomPoint() {
  return Point(coordinates: createRandomPosition());
}

Position createRandomPosition() {
  var random = Random();
  return Position(random.nextDouble() * -360.0 + 180.0,
      random.nextDouble() * -180.0 + 90.0);
}