import 'package:flutter/material.dart';
import 'package:flutter_uber_clone_supabase/app/home_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          myLocationEnabled: true,
          initialCameraPosition: const CameraPosition(
            target: LatLng(37.7749, -122.4194),
            zoom: 14.4746,
          ),
          onMapCreated: (controller) {
            homeController.mapController = controller;
          }),
    );
  }
}
