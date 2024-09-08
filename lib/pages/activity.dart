import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:learn_flutter/consts.dart';
import 'package:location/location.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_controller/google_maps_controller.dart';

import '../API/directionAPI.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 final Completer<GoogleMapController>_mapcontroller=Completer<GoogleMapController>();
  static  LatLng? currentPosition;
  static const LatLng toPosition=LatLng(22.996739, 72.621176);

  Future<void> getCurrentPosition() async{
    Location location = new Location();
    bool _serviceEnabled;
    _serviceEnabled = await location.serviceEnabled();
    PermissionStatus _permissionGranted;

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    location.onLocationChanged.listen((LocationData currentLocation){
      if(currentLocation.latitude!=null && currentLocation.longitude!=null){
        setState(() {
          currentPosition=LatLng(currentLocation.latitude!, currentLocation.longitude!);
        });

      }
    });
  }
 void fetchDirections() async {
   GoogleDirectionsService directionsService = GoogleDirectionsService();
   double originLat = 40.712776;  // Example: New York latitude
   double originLng = -74.005974; // Example: New York longitude
   double destLat = 34.052235;    // Example: Los Angeles latitude
   double destLng = -118.243683;  // Example: Los Angeles longitude

   try {
     final directions = await directionsService.getDirections(currentPosition!.latitude, currentPosition!.longitude, toPosition.latitude, toPosition.longitude);
     print('Directions: $directions');
   } catch (e) {
     print('Error: $e');
   }
 }


 @override
 void initState() {
   super.initState();
   getCurrentPosition();
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: (currentPosition==null)?Center(child: CircularProgressIndicator()):GoogleMap(
          onMapCreated: (GoogleMapController Controller)=>_mapcontroller.complete(Controller),
            initialCameraPosition: CameraPosition(target: currentPosition!,zoom: 13),
        markers: {
          Marker(markerId: MarkerId("toPosition"),
              icon: BitmapDescriptor.defaultMarker,
              position: toPosition),
          Marker(markerId: MarkerId("currentPosition"),
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
              position: currentPosition!),
        },
    ),
      ),
    );
  }
}
