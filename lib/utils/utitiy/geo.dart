import 'dart:math';

import 'package:geolocator/geolocator.dart';
import 'package:hnflutter_challenge/domain/entity/Bakery.dart';
import 'package:hnflutter_challenge/utils/mapper/mapper.dart';
import 'package:hnflutter_challenge/utils/some_data.dart';

Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }
  return await Geolocator.getCurrentPosition();
}

doFilterByProximity(Position position) {
  List<Bakery> list = [];
  listOfBakeries.forEach((element) {
    double distance = Geolocator.distanceBetween(
        position.latitude, position.longitude, element.lat!, element.lon);
    if (distance > 10) {
      // range 10
      list.add(element.toDomain());
    }
  });
}
