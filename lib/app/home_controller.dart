import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

enum AppState {
  choosingLocation,
  confirmFare,
  waitingForPickup,
  riding,
  postRide,
}

class HomeController extends GetxController {
  LatLng? currentLocation;
  CameraPosition? initialPosition;
  late GoogleMapController mapController;
  bool mounted = false;
  @override
  void onInit() {
    super.onInit();
    checkLocationPermission();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> checkLocationPermission() async {
    final isLocationEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isLocationEnabled) {
      if (mounted) {
        Get.snackbar(
          'Location',
          'Please enable location services',
          snackPosition: SnackPosition.TOP,
        );
        return;
      }
    }
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        if (mounted) {
          Get.snackbar(
            'Location',
            'Please enable location services',
            snackPosition: SnackPosition.TOP,
          );
          return;
        }
      }
    }
    if (permission == LocationPermission.deniedForever) {
      if (mounted) {
        Get.snackbar(
          'Location',
          'Please enable location services',
          snackPosition: SnackPosition.TOP,
        );
        return;
      }
    }
    final position = await Geolocator.getCurrentPosition();
    print(position);

    currentLocation = LatLng(position.latitude, position.longitude);
    initialPosition = CameraPosition(
      target: currentLocation!,
      zoom: 14,
    );
    update();

    mapController.animateCamera(
      CameraUpdate.newCameraPosition(initialPosition!),
    );
  }
}
