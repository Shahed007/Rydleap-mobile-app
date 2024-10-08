



import 'dart:math';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController{


  Stream<Position>? positionStream;
  Rx<LatLng> currentpos = LatLng(31.119318, -99.245435).obs;


  @override
  void onInit() {
    super.onInit();
    //getCurrentPos();


  }





  double randLat(double lat){

    Random rnd = new Random();
// Define min and max value
    int min = 1, max = 10;
    int mult=-1;
//Getting range
    int num = min + rnd.nextInt(max - min);
    if(num%2==0){

      mult=1;

    }else{
      mult=-1;
    }

    return (((num/10000)*mult)+lat);

  }


  double randLong(double long){

    Random rnd = new Random();
// Define min and max value
    int min = 1, max = 10;
    int mult=-1;
//Getting range
    int num = min + rnd.nextInt(max - min);
    if(num%2==0){

      mult=1;

    }else{
      mult=-1;
    }

    return (((num/10000)*mult)+long);

  }






  Future<void> getCurrentPos(GoogleMapController mapController) async {





    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    // Check location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // Get the position stream
    positionStream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high, // High accuracy
        distanceFilter: 10, // Update if user moves 10 meters
      ),
    );

    positionStream!.listen((Position position) {

        // currentPosition = position;
        currentpos.value=LatLng(position.latitude, position.longitude);

        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: currentpos.value,
              zoom: 14, // You can change the zoom level here
            ),
          ),
        );





    });


  }

  @override
  void onReady() {

  }

  @override
  void onClose() {

  }
}