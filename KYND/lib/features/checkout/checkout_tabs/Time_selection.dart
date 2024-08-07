import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kynd/features/checkout/controllers/checkout_controller.dart';
import 'package:kynd/utils/devices_utils/device_util.dart';

import '../../../utils/constants/colors.dart';
import '../controllers/timeSelection_controller.dart';

class Time_selection extends StatelessWidget {
  Time_selection({super.key});

  final TimeSelectionController controller = Get.put(TimeSelectionController());
  final CheckoutController checkoutController = Get.find<CheckoutController>();

  String getTomorrowDay() {
    final now = DateTime.now();
    final tomorrow = now.add(Duration(days: 1));
    return DateFormat.E().format(tomorrow); // Returns the abbreviated name of the day (e.g., Mon, Tue)
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:  Padding(
        padding: const EdgeInsets.all(12),
        child: FloatingActionButton(
          onPressed: () {
             if(controller.selectedDate.value != null && controller.selectedTime.value != null){
               checkoutController.checkoutDetails.update((val) {
                 val!.date = controller.dates[controller.selectedDate.value!];
                 val.time = controller.parseTime(controller.timeSlots[controller.selectedTime.value!]);
               });
               checkoutController.nextTab();
             }else{
               Device_util.showSnackbar(context, "Select all the feilds");
             }
          },
          backgroundColor: Colors.deepOrangeAccent,
          child: Icon(Icons.arrow_forward, color: Colors.white,), // Icon for the floating action button
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: Text("Pick the best day to start ?", style: Theme.of(context).textTheme.headlineSmall),
              ),


              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: Custom_colors.border_primary
                    )
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical:6),
                      decoration:BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(12),topLeft: Radius.circular(12)),
                          color: Colors.grey.shade100
                      ),

                      /// for showing the days
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(7, (index) {
                          return Expanded(
                            child: Text(
                                  controller.formatDay(controller.dates[index]),
                                  style: Theme.of(context).textTheme.labelMedium,
                                  textAlign: TextAlign.center,
                                ),
                          );
                        })

                      ),
                    ),

                    Container(
                      height: 1,
                      width: double.infinity,
                      color: Custom_colors.border_primary,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(7, (index) {

                        return Expanded(
                          child: Obx(
                            () => TextButton(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                backgroundColor: controller.selectedDate != index ?  Colors.white : Colors.indigoAccent,
                                padding: EdgeInsets.zero,
                                // minimumSize: Size(0, 0),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () {
                                if(controller.selectedDate.value != index)
                                 controller.selectedDate.value = index;
                                else{
                                  controller.selectedDate.value = null;
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical : 16 ),
                                child: Column(
                                  children: [
                                    Text(controller.formatDate(controller.dates[index]), style: TextStyle(color : controller.selectedDate == index ? Colors.white : null),),
                                    Text(
                                      controller.formatMonth(controller.dates[index]),
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: controller.selectedDate != index ? Colors.indigoAccent : Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),

              SizedBox(height: 32),


              Text("Select meal time", style: Theme.of(context).textTheme.headlineSmall),

              SizedBox(height: 12),

              SizedBox(
                height: Device_util.get_height(context) * 0.23,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1 / 0.4,
                  ),
                  shrinkWrap: true,
                  itemCount: controller.timeSlots.length,
                  itemBuilder: (context, index) {
                    return Obx(
                        () => GestureDetector(
                        onTap: () {
                          if(controller.selectedTime.value != index)
                             controller.selectedTime.value = index;
                          else{
                            controller.selectedTime.value = null;
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.zero,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                             color: controller.selectedTime != index ? Colors.white : Colors.blue.shade50,
                            // color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.blue, width: 1),
                          ),
                          child: Text(
                            controller.timeSlots[index],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              Text("Specific cooking instructions", style: Theme.of(context).textTheme.headlineSmall),

              SizedBox(height: 12,),

              TextField(
                controller: controller.textController.value,
                style: Theme.of(context).textTheme.labelMedium!.apply(heightDelta: 0.4),
                maxLines: null, // Allows multiline input
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.lightBlue.shade50,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              Wrap(
                spacing: 8,
                runSpacing: 0,
                children: [
                  buildChip("Less Spicy"),
                  buildChip("More Spicy"),
                  buildChip("Medium Spicy"),
                  buildChip("No Onion"),
                  buildChip("Garlic Free"),
                  buildChip("Other"),
                ],
              ),

              SizedBox(height: 60)



            ],
          ),
        ),
      ),
    );
  }

  Widget buildChip(String label) {
    return  GestureDetector(
      onTap: () => controller.addText(label),
      child: Chip(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // Increase the radius as needed
        ),
        label: Text(label,style: TextStyle(color: Custom_colors.darker_grey,fontSize: 11, fontWeight: FontWeight.normal)),
        backgroundColor: Colors.white,
      ),
    );
  }

}


// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     Row(
//       children: [
//         Text("-15 Min"),
//         SizedBox(width: 8),
//          ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.blue.shade50,
//             minimumSize: Size(90, 50),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(4),
//             ),
//           ),
//           onPressed: () => controller.selectTime(context),
//           child: Obx(
//                 () => Text(
//               '${controller.selectedTime.value.format(context)}',
//               textAlign: TextAlign.center,
//               style: TextStyle(color: Colors.grey), // replace Custom_colors.darker_grey with Colors.grey
//             ),
//           ),
//         ),
//         SizedBox(width: 8),
//         Text("+15 Min")
//       ],
//     ),
//   ],
// ),



