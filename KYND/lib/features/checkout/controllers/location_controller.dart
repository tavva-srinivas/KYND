import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as Geo;

class LocationController extends GetxController {
  var currentAddress = ''.obs;
  var locationData = LocationData.fromMap({}).obs;
  var selectedChipIndex = 0.obs;

  Location location = Location();

  @override
  void onInit() {
    super.onInit();
    getLocation();
  }

  void selectChip(int index) {
    selectedChipIndex.value = index;
  }

  Future<void> getLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData.value = await location.getLocation();
    getAddressFromLatLng(locationData.value.latitude, locationData.value.longitude);
  }

  Future<void> getAddressFromLatLng(double? lat, double? lng) async {
    if (lat == null || lng == null) return;

    try {
      List<Geo.Placemark> placemarks = await Geo.placemarkFromCoordinates(lat, lng);
      Geo.Placemark place = placemarks[0];
      currentAddress.value = "${place.locality}, ${place.postalCode}, ${place.country}";
    } catch (e) {
      print(e);
    }
  }
}
