import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kynd/features/home/Screens/homescreen_widgets/home_appbar.dart';
import 'package:kynd/utils/devices_utils/device_util.dart';
import 'package:location/location.dart';
import '../../../Getx controllers/User_controller.dart';
import '../../../utils/constants/colors.dart';
import '../controllers/checkout_controller.dart';
import '../controllers/location_controller.dart';


class Location_capture extends StatefulWidget {
  Location_capture({super.key});

  @override
  _Location_captureState createState() => _Location_captureState();
}

class _Location_captureState extends State<Location_capture> {
  /// controllers
  final LocationController locationController = Get.put(LocationController());
  final CheckoutController checkoutController = Get.find<CheckoutController>();

  final User_provider user_provider = Get.find<User_provider>();
  bool showAdditionalDetails = false;

  // controllers for taking the details
  TextEditingController name_controller = TextEditingController();
  TextEditingController contact_controller = TextEditingController();
  TextEditingController flat_controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    Location location = Location();
    const LatLng _loc = LatLng(16.515, 80.632);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: showAdditionalDetails
                  ? Device_util.get_height(context) * 0.2
                  : Device_util.get_height(context) * 0.56,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(target: _loc, zoom: 18),
                    zoomControlsEnabled: false,
                  ),
                  !showAdditionalDetails ? Positioned(
                    bottom: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.deepOrange, width: 1),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 8),
                          Icon(Icons.gps_fixed, color: Colors.redAccent),
                          SizedBox(width: 8),
                          Text(
                            "Use current location",
                            style: TextStyle(color: Colors.redAccent),
                          ),
                          SizedBox(width: 8),
                        ],
                      ),
                    )
                  ) : SizedBox()
                ],
              ),
            ),
        
            !showAdditionalDetails  ? Padding(
              padding: const EdgeInsets.only(left: 16,top: 16,bottom: 16),
              child: Text(
                "Location as per point",
                style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.normal),
              ),
            ) : SizedBox(),
            SizedBox(height: 8),

            home_appbar(
              icons: [
                TextButton(
                  onPressed: () {
                  // need to do
                  },
                    child: Text("Change",style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.redAccent),)
                )
              ],
              heading_color: Custom_colors.dark,
              subHead_color: Custom_colors.dark_grey,
              icon_color: Colors.redAccent,
              icon_backgrund: Colors.red.shade50,
            ),
        
            SizedBox(height: 8),
        
            Visibility(
              visible: !showAdditionalDetails,
              child: GestureDetector(
                onTap: () {
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
                      style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            if (showAdditionalDetails) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                child: Text("Save address as",style: Theme.of(context).textTheme.titleMedium,),
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
         )),
            SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: TextField(
                  controller: name_controller,
                  decoration: InputDecoration(
                    labelText: "Name",
                    border: UnderlineInputBorder(), // Use UnderlineInputBorder
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: TextField(
                  controller: contact_controller,
                  decoration: InputDecoration(
                    labelText: "Contact",
                    border: UnderlineInputBorder(), // Use UnderlineInputBorder
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: TextField(
                  controller: flat_controller,
                  decoration: InputDecoration(
                    labelText: "House No / Building / Flat No",
                    border: UnderlineInputBorder(), // Use UnderlineInputBorder
                  ),
                ),
              ),
              showAdditionalDetails  ? Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
                  child: FloatingActionButton(
                    onPressed: () {
                      if (name_controller.text.isEmpty || contact_controller.text.isEmpty || flat_controller.text.isEmpty) {
                        // Show an error message
                        Get.snackbar(
                          'Error',
                          'All fields are required.',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      } else {

                      }

                    },
                    backgroundColor: Colors.deepOrangeAccent,
                    child: Icon(Icons.arrow_forward, color: Colors.white,), // Icon for the floating action button
                  ),
                ),
              ) : SizedBox()
            ],
          ],
        ),
      ),
    );
  }

// helper for chip widget
  Widget buildCustomChip(String label, int index) {
    return Obx(() => GestureDetector(
      onTap: () {
        locationController.selectChip(index);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 3),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: locationController.selectedChipIndex.value == index ? Colors.red.shade50 : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: locationController.selectedChipIndex.value == index ? Colors.red : Colors.grey,
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.normal
          ),
        ),
      ),
    ));
  }

}


