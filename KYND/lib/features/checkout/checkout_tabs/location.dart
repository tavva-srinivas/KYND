import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kynd/features/home/Screens/homescreen_widgets/home_appbar.dart';
import 'package:kynd/utils/devices_utils/device_util.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart' as GeoCoding;
import '../../../Getx controllers/User_controller.dart';
import '../../../utils/constants/colors.dart';
import '../controllers/checkout_controller.dart';
import '../controllers/location_controller.dart';

class Location_capture extends StatefulWidget {
  Location_capture({Key? key}) : super(key: key);

  @override
  _Location_captureState createState() => _Location_captureState();
}

class _Location_captureState extends State<Location_capture> {
  /// controllers
  final LocationController locationController = Get.put(LocationController());
  final CheckoutController checkoutController = Get.find<CheckoutController>();
  final User_provider user_provider = Get.find<User_provider>();

  bool showAdditionalDetails = false;

  // Add this variable
  late GoogleMapController mapController;
  bool isMapControllerInitialized = false;

  // controllers for taking the details
  TextEditingController name_controller = TextEditingController();
  TextEditingController contact_controller = TextEditingController();
  TextEditingController flat_controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    /// using this for the initialisation for
    name_controller.text = user_provider.user.name ?? "";

    _getCurrentLocation();
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  /// Define form key for the text fields
  final _formKey = GlobalKey<FormState>();

  // Validate name and address fields
  String? _validate_feild(String? value, String val_text) {
    if (value == null || value.isEmpty) {
      return 'Please enter your $val_text';
    }
    return null; // Return null when validation succeeds
  }

  // Validate contact field
  String? _validate_contact(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your contact number';
    }
    if (value.length != 10) {
      return 'Contact number should be 10 digits';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Contact number should contain only digits';
    }
    return null;
  }

  /// for google maps
  void _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      if (isMapControllerInitialized) {
        print("Animating camera to new location");
        mapController.animateCamera(CameraUpdate.newLatLng(
          LatLng(position.latitude, position.longitude),
        ));
      } else {
        print("Map controller not initialized yet");
      }
    } catch (e) {
      print("Error fetching current location: $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    const LatLng _loc = LatLng(16.515, 80.632);

    return WillPopScope(
      onWillPop: () async {
        if (showAdditionalDetails) {
          setState(() {
            showAdditionalDetails = false;
          });
          return false; // Prevent default back button behavior
        } else {
          return true; // Allow default back button behavior (exit the screen)
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: showAdditionalDetails
                      ? Device_util.get_height(context) * 0.24
                      : Device_util.get_height(context) * 0.56,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      GoogleMap(
                        initialCameraPosition: CameraPosition(target: _loc, zoom: 18),
                        zoomControlsEnabled: false,
                        scrollGesturesEnabled: !showAdditionalDetails,
                        zoomGesturesEnabled: !showAdditionalDetails,
                        tiltGesturesEnabled: !showAdditionalDetails,
                        rotateGesturesEnabled: !showAdditionalDetails,
                        onCameraIdle: () async {
                          if (isMapControllerInitialized) {
                            LatLngBounds bounds =
                                await mapController.getVisibleRegion();
                            final lon = (bounds.northeast.longitude +
                                    bounds.southwest.longitude) /
                                2;
                            final lat = (bounds.northeast.latitude +
                                    bounds.southwest.latitude) /
                                2;
                            locationController.getAddressFromLatLng(lat, lon);
                          }
                        },
                        onMapCreated: (GoogleMapController controller) {
                          mapController = controller;
                          isMapControllerInitialized = true;
                          print("Map controller initialized");
                        },
                      ),
                      Positioned(
                        child: Icon(Icons.location_pin,
                            size: 40, color: Colors.redAccent),
                      ),
                      !showAdditionalDetails
                          ? Positioned(
                              bottom: 10,
                              child: GestureDetector(
                                onTap: () async {
                                  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

                                  if (isMapControllerInitialized) {
                                    print("Animating camera to new location");
                                    mapController.animateCamera(CameraUpdate.newLatLng(
                                      LatLng(
                                          position.latitude, position.longitude),
                                    ));
                                  } else {
                                    print(
                                        "Location data or map controller not available");
                                  }
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                        color: Colors.deepOrange, width: 1),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(width: 8),
                                      Icon(Icons.gps_fixed,
                                          color: Colors.redAccent),
                                      SizedBox(width: 8),
                                      Text(
                                        "Use current location",
                                        style: TextStyle(color: Colors.redAccent),
                                      ),
                                      SizedBox(width: 8),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
                if (!showAdditionalDetails)
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
                    child: Text(
                      "Location as per point",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                SizedBox(height: 16),
                Obx(
                  () => home_appbar(
                    heading: locationController.currentAddress.value?.address1 ?? "No address selected",
                    sub_heading: locationController.currentAddress.value?.address2 ?? "",
                    icons: [
                      TextButton(
                        onPressed: () {
                          // need to do
                        },
                        child: Text(
                          "Change",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .apply(color: Colors.redAccent),
                        ),
                      ),
                    ],
                    heading_color: Custom_colors.dark,
                    subHead_color: Custom_colors.dark_grey,
                    icon_color: Colors.redAccent,
                    icon_backgrund: Colors.red.shade50,
                  ),
                ),
                SizedBox(height: 20),
                Visibility(
                  visible: !showAdditionalDetails,
                  child: GestureDetector(
                    onTap: () {
                      checkoutController.checkoutDetails.update((val) {
                        val!.address = locationController.currentAddress.value;
                      });
                      setState(() {
                        showAdditionalDetails = true;
                      });
                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.redAccent,
                      ),
                      child: Center(
                        child: Text(
                          "Confirm location & proceed",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                if (showAdditionalDetails) ...[
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Text("Save address as",
                        style: Theme.of(context).textTheme.titleMedium),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Wrap(
                      spacing: 8.0, // gap between adjacent chips
                      children: [
                        buildCustomChip('Home', 0),
                        buildCustomChip('Work', 1),
                        buildCustomChip('Other', 2),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: TextFormField(
                      controller: name_controller,
                      style: Theme.of(context).textTheme.labelMedium,
                      decoration: InputDecoration(
                        floatingLabelStyle: Theme.of(context).textTheme.bodySmall,
                        labelText: "Name",
                        labelStyle: TextStyle(
                            fontSize: 16, color: Custom_colors.dark_grey),
                        border: UnderlineInputBorder(),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent),
                        ),
                      ),
                      validator: (string) => _validate_feild(string, "name"),
                    ),
                  ),
                  // Contact text field
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: TextFormField(
                      controller: contact_controller,
                      style: Theme.of(context).textTheme.labelLarge,
                      decoration: InputDecoration(
                        floatingLabelStyle: Theme.of(context).textTheme.bodySmall,
                        labelText: "Contact",
                        labelStyle: TextStyle(
                            fontSize: 16, color: Custom_colors.dark_grey),
                        border: UnderlineInputBorder(),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent),
                        ),
                      ),
                      validator: _validate_contact,
                    ),
                  ),
                  // House no text field
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: TextFormField(
                      controller: flat_controller,
                      style: Theme.of(context).textTheme.labelMedium,
                      decoration: InputDecoration(
                        floatingLabelStyle: Theme.of(context).textTheme.bodySmall,
                        labelText: "House no / Door no / Building",
                        labelStyle: TextStyle(
                            fontSize: 16, color: Custom_colors.dark_grey),
                        border: UnderlineInputBorder(),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent),
                        ),
                      ),
                      validator: (string) =>
                          _validate_feild(string, "complete address"),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      child: FloatingActionButton(
                        onPressed: () async {
                          // Validate the form
                          if (_formKey.currentState!.validate()) {
                            // Enter all the details from the text controller to the class in the checkout_controller
                            checkoutController.checkoutDetails.update((val) {
                              val!.receiverName = name_controller.text;
                              val.contactInfo = contact_controller.text;
                              val.house_details = flat_controller.text;
                            });
                            // All fields are correct, move to next tab
                            checkoutController.nextTab();
                          } else {
                            Device_util.showSnackbar(
                                context, "All fields are required");
                          }
                        },
                        backgroundColor: Colors.deepOrangeAccent,
                        child: Icon(Icons.arrow_forward, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper for chip widget
  Widget buildCustomChip(String label, int index) {
    return Obx(() => GestureDetector(
          onTap: () {
            locationController.selectChip(index);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 3),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: locationController.selectedChipIndex.value == index
                  ? Colors.red.shade50
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: locationController.selectedChipIndex.value == index
                    ? Colors.red
                    : Colors.grey,
                width: 1,
              ),
            ),
            child: Text(
              label,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ));
  }
}
