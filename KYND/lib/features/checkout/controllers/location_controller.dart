import 'dart:convert';

import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart' as Geo;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/address.dart';
import 'package:http/http.dart' as http;

class LocationController extends GetxController {
  var currentAddress = Rxn<Address>();
  var selectedChipIndex = 0.obs;


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
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await Geolocator.openLocationSettings();
      if (!serviceEnabled) {
        return;
      }
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
        return;
      }
    }

    Position currentPosition = await Geolocator.getCurrentPosition();
    getAddressFromLatLng(currentPosition.latitude, currentPosition.longitude);
  }

  Future<void> getAddressFromLatLng(double lat, double lng) async {
    try {
      List<Geo.Placemark> placemarks = await Geo.placemarkFromCoordinates(lat, lng);
      if (placemarks.isNotEmpty) {
        Geo.Placemark place = placemarks[0];

        String address1 = "";
        String address2 = "";

        if (place.thoroughfare != null && place.thoroughfare!.isNotEmpty) {
          address1 = place.thoroughfare!;
          address2 = (place.subLocality != null && place.subLocality!.isNotEmpty)
              ? '${place.subLocality}, ${place.locality}'
              : place.locality ?? 'Unknown';

        } else if(place.subLocality != null && place.subLocality!.isNotEmpty){
          address1 = place.subLocality!;
          address2 = place.locality ?? 'Unknown';
        }
        // if both thoroughfare and sublocality is emptu lets try to do google
        // geodecoder for having the location
        else{
          print("comming");
          String apiKey = 'AIzaSyDoHT2KBdY8UHnb4BsJLqqrRP62BVeymkU';
          String apiUrl =
              'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$apiKey';
          try {
            final response = await http.get(Uri.parse(apiUrl));

            print("google api call ${response.statusCode} status code, ${response.body}");

            if (response.statusCode == 200) {
              // Parse JSON response
              Map<String, dynamic> data = jsonDecode(response.body);

              // Iterate through address components to find route, locality, and administrative_area_level_1
              List<dynamic> addressComponents = data['results'][0]['address_components'];
              for (var component in addressComponents) {
                List<dynamic> types = component['types'];
                String shortName = component['short_name'];


                if (types.contains('route')) {
                  address1 = shortName;
                } else if (types.contains('locality') && types.contains('political')) {
                  address2 = shortName;
                } else if (types.contains('administrative_area_level_1') && types.contains('political')) {
                  if (address2 == null) {
                    address2 = shortName;
                  } else {
                    address2 += ', $shortName';
                  }
                }
              }
              // Display extracted addresses
              print('Address1 (Route): $address1');
              print('Address2 (Locality + Administrative Area Level 1): $address2');
            } else {
              throw Exception('Failed to fetch data');
            }
          } catch (e) {
            print("error ${e}");
            address1 = place.locality ?? "Unknown";
            address2 = "";
          }
        }


        currentAddress.value = Address(
          address1: address1,
          address2: address2,
          latitude: lat,
          longitude: lng,
          postalCode: place.postalCode,
        );




        print("The address is ${currentAddress.value!.address1}");
      } else {
        currentAddress.value = null;
        print("Address not found");
      }
    } catch (e) {
      print("Error fetching address: $e");
      currentAddress.value = null;
    }
  }

  Future<void> updateAddressFromCameraPosition(double lat, double lng) async {
    await getAddressFromLatLng(lat, lng);
    print("The updated address is ${currentAddress.value}");
  }
}
