import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kynd/features/Product/controller/plan_days_controller.dart';
import 'package:kynd/features/checkout/checkout.dart';
import 'package:kynd/utils/constants/colors.dart';
import 'package:kynd/utils/devices_utils/device_util.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Plan_days_screen extends StatelessWidget {
  static const route_name = '/plan_screen';

  final Plan_days_controller planController = Get.put(Plan_days_controller());

  void loadPaymentPage(BuildContext context) async {
    var options = {
      'key': 'rzp_test_h70tr1XLYZkFoR',
      'amount': '200000',
      'name': 'User name',
      'prefix': 'Plan name',
      'prefill': {'contact': "+91 9491062860", 'email': "tavvasrivenkatasrinivas04@gmail.com"}
    };

    try {
      Razorpay().open(options);
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        // title: Text('Reorderable List'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildElevatedButton(context, 0, '2 Days'),
                _buildElevatedButton(context, 1, '1 Week'),
                _buildElevatedButton(context, 2, '2 Week'),
              ],
            ),
            SizedBox(height: 16,),
            Flexible(
              fit: FlexFit.loose,
              flex: 12,
              child: GestureDetector(
                /// for swipping into the next page
                onHorizontalDragEnd: (details) {
                  if (details.primaryVelocity! < 0) {
                    print('Left Swipe Detected');
                    if(planController.selectedIndex == 2 && planController.selected_week_dot < 2){
                      planController.selected_week_dot.value++;
                    }
                  }else if (details.primaryVelocity! > 0) {
                    // Right Swipe Detected
                    print('Right Swipe Detected');
                    if(planController.selectedIndex == 2 && planController.selected_week_dot > 1){
                      planController.selected_week_dot.value--;
                    }
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx( () {
                      return Column(
                        children: List.generate(
                          (planController.selectedIndex == 0) ? 2 : 7,
                              (index) =>
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15.4),
                                child: Text('Day ${(planController.selected_week_dot.value-1) * 7 + index + 1}',
                                    style: TextStyle(fontSize: 14)),
                              ),
                        ),
                      );
                    }
                    ),
                    SizedBox(width: 16),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Obx(
                          () => ReorderableListView(
                          onReorder: (oldIndex, newIndex) {
                            planController.reorderMenu(oldIndex, newIndex);
                          },
                          children: List.generate(
                            (planController.selectedIndex == 0) ? 2 : 7,
                                (index) => Padding(
                              key: ValueKey('menuItem_$index'),
                              padding: const EdgeInsets.symmetric(vertical: 7.4,horizontal: 8),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 7),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  border: Border.all(
                                    color: Colors.black38,
                                    width: 0.5,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          planController.menu[(planController.selected_week_dot.value-1) * 7 + index],
                                          style: Theme.of(context).textTheme.titleSmall,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Icon(Icons.change_circle_outlined,size: 20,),
                                      SizedBox(width: 30),
                                      Icon(Icons.add, size: 18),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),


            // dots for sliding to right page
            Center(
              child: Obx( () {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  List.generate((planController.selectedIndex.value == 2) ? 2 : 1 , (index) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(24),
                      onTap:  () {
                        print("before ${planController.selected_week_dot.value}");
                        planController.selected_week_dot.value = index + 1;
                        print("after ${planController.selected_week_dot.value}");
                        },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width: 14,
                        height: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: planController.selected_week_dot.value ==
                              index + 1
                              ? Colors.blue
                              : Colors.grey,
                        ),
                      ),
                    );
                  }

                  ),
                );
              },
            ),
            ),

            Spacer(flex: 1,),
            Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text("Appetite level", style: Theme.of(context).textTheme.headlineSmall),
            ),
            Obx(
              () => Slider(
                activeColor: Colors.redAccent,
                value: planController.appetite_level.value.toDouble(),
                min: 1,
                max: 3,
                divisions: 2,
                label: planController.appetite_level.value.toString(),
                onChanged: (double value) {
                  print('Selected value: $value');
                  planController.appetite_level.value = value.toInt();
                },
              ),
            ),
            Spacer(flex: 2,),
            GestureDetector(
              onTap: () {
                loadPaymentPage(context);
              },
              child: SizedBox(
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text("Total", style: TextStyle(fontSize: 13, color: Colors.white)),
                          ),
                          SizedBox(height: 2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16, top: 2),
                                child: Text('\u20B9', style: TextStyle(fontSize: 18, color: Colors.white)),
                              ),
                              SizedBox(width: 3),
                              Text("1,800", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                            ],
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Text("CHECK OUT", style: Theme.of(context).textTheme.bodySmall!.apply(color: Colors.black87)),
                              SizedBox(width: 12,),
                              Icon(Icons.near_me_outlined,color: Colors.black87,)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutScreen()));
                },
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  side: BorderSide(color: Colors.deepOrangeAccent, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text('ADD TO CART', style: Theme.of(context).textTheme.titleMedium),
              ),
            ),
            Spacer(flex: 1,)
          ],
        ),
      ),
    );
  }

  Widget _buildElevatedButton(BuildContext context, int index, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx ((){
         return ElevatedButton(
          onPressed: () {
            print("comming to pressed");
            planController.updateSelectedIndex(index);
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black87,
            backgroundColor: planController.selectedIndex.value == index ? Colors.blue.shade100 : Colors.white,
            side: BorderSide(color: Colors.indigoAccent),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Text(text),
        );
    })
    );
  }
}



// import 'dart:collection';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:kynd/features/checkout/checkout.dart';
// import 'dart:ui';
// import 'package:kynd/utils/constants/colors.dart';
// import 'package:kynd/utils/devices_utils/device_util.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
//
//
// class Plan_days_screen extends StatefulWidget {
//   static const route_name = '/plan_screen';
//
//   const Plan_days_screen({Key? key}) : super(key: key);
//
//   @override
//   State<Plan_days_screen> createState() => _Plan_days_screenState();
// }
//
// class _Plan_days_screenState extends State<Plan_days_screen> {
//
//
//   /// for payment
//   // instance of razorpay
//   void _handle_payment_success(PaymentSuccessResponse response){
//     Device_util.showSnackbar(context, "Payment Successful: ${response.paymentId}");
//   }
//
//   void _handle_payment_error(PaymentFailureResponse response){
//     Device_util.showSnackbar(context, "Error: ${response.code} - ${response.message}");
//   }
//
//   void _handle_external_wallet(ExternalWalletResponse response){
//     Device_util.showSnackbar(context, "External Wallet is: ${response.walletName}");
//   }
//
//   Razorpay? _razorpay;
//
//   @override
//   void initState() {
//     super.initState();
//
//     /// for razorpay init
//     _razorpay = Razorpay();
//     _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handle_payment_success);
//     _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handle_payment_error);
//     _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handle_external_wallet);
//   }
//
//   void load_payment_page() async {
//     var options = {
//       'key':'rzp_test_h70tr1XLYZkFoR',
//       'amount':'200000',
//       'name':'User name',
//       'prefix':'Plan name',
//       'prefill':{'contact':"+91 9491062860",'email':"tavvasrivenkatasrinivas04@gmail.com"}
//     };
//
//     try{
//       _razorpay?.open(options);
//     }catch(error){
//       debugPrint(error.toString());
//     }
//   }
//
//
//
//
//
//   ///for plan section
//   int selectedIndex = 1; // Initially, the center button (1 week) is selected
//   final List menu = [
//     'Paneer Paratha',
//     'Oats with Fruits',
//     'Chicken',
//     'Millets Idly',
//     'Paneer Paratha',
//     'Oats with Fruits',
//     'Chicken',
//   ];
//
//
//   /// for dots section
//   bool isFirstDotActive = true; // Initially, the first dot is active
//
//   void toggleDot() {
//     setState(() {
//       isFirstDotActive = !isFirstDotActive; // Toggle the active dot
//     });
//   }
//
//   /// for time selection
//   TimeOfDay selectedTime = TimeOfDay(hour: 8, minute: 15);
//
//   _selectTime(BuildContext context) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: selectedTime,
//     );
//     if (picked != null && picked != selectedTime) {
//       setState(() {
//         selectedTime = picked;
//       });
//     }
//   }
//
//
//   /// for date selection
//   DateTime selectedDate = DateTime.now();
//
//   _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null && picked != selectedDate) {
//       setState(() {
//         selectedDate = picked;
//       });
//     }
//   }
//
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.redAccent,
//         // title: Text('Reorderable List'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 _buildElevatedButton(0, '2 Days'),
//                 _buildElevatedButton(1, '1 Week'),
//                 _buildElevatedButton(2, '2 Week'),
//               ],
//             ),
//
//             SizedBox(
//               height: 16,
//             ),
//
//             Flexible(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Column(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.symmetric(vertical: 16,),
//                         child: Text('Day 1',style: TextStyle(fontSize: 14),),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(vertical: 16),
//                         child: Text('Day 2',style: TextStyle(fontSize: 14)),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(vertical: 16),
//                         child: Text('Day 3',style: TextStyle(fontSize: 14)),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(vertical: 16),
//                         child: Text('Day 4',style: TextStyle(fontSize: 14)),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(vertical: 16),
//                         child: Text('Day 5',style: TextStyle(fontSize: 14)),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(vertical: 16),
//                         child: Text('Day 6',style: TextStyle(fontSize: 14)),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(vertical: 16),
//                         child: Text('Day 7',style: TextStyle(fontSize: 14)),
//                       ),
//                     ],
//                   ),
//
//                   SizedBox(width: 16),
//
//
//                   Flexible(
//                     child: ReorderableListView(
//                       onReorder: (int oldIndex, int newIndex) {
//                         setState(() {
//                           if (oldIndex < newIndex) {
//                             newIndex -= 1;
//                           }
//
//                           // Remove the item from the old position and insert it at the new position
//                           final tile = menu.removeAt(oldIndex);
//                           menu.insert(newIndex, tile);
//                         });
//                       },
//                       children:  List.generate(menu.length, (index) {
//                         return Padding(
//                           key: ValueKey('menuItem_$index'),
//                           padding: const EdgeInsets.symmetric(vertical: 7.4),
//                           child: Container(
//                             padding: const EdgeInsets.symmetric(vertical: 7),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(2),
//                               border: Border.all(
//                                 color: Colors.black38,
//                                 // Change this color as needed
//                                 width: 0.5, // Specify the width of the border
//                               ),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 8),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     menu[index],
//                                     style: Theme
//                                         .of(context)
//                                         .textTheme
//                                         .titleSmall!,
//                                   ),
//                                   Icon(Icons.edit,size: 18)
//                                 ],
//                               ),
//                             ),),);}),),)
//                 ],
//               ),
//             ),
//
//             SizedBox(height: 12,),  // height between menu and dots
//
//             /// Dots for indicating different weeks
//             Center(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       if (!isFirstDotActive) {
//                         toggleDot();
//                       }
//                     },
//                     child: Container(
//                       width: 12,
//                       height: 8,
//                       decoration: BoxDecoration(
//                         // shape: BoxShape.circle,
//                         borderRadius: BorderRadius.circular(100),
//                         color: isFirstDotActive ? Colors.indigoAccent.shade200 : Colors.grey, // Active dot is blue, inactive dot is grey
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 8), // Space between the dots
//                   GestureDetector(
//                     onTap: () {
//                       if (isFirstDotActive) {
//                         toggleDot();
//                       }
//                     },
//                     child: Container(
//                       width: 12,
//                       height: 8,
//                       decoration: BoxDecoration(
//                         // shape: BoxShape.circle,
//                         borderRadius: BorderRadius.circular(100),
//                         color: !isFirstDotActive ? Colors.indigoAccent.shade200 : Colors.grey, // Active dot is blue, inactive dot is grey
//                       ),
//                     ),
//                   ),
//
//                 ],
//               ),
//             ),
//
//             SizedBox(height: 16,),
//
//             Padding(
//               padding: EdgeInsets.only(bottom: 8),
//               child: Text("Appetite level",style: Theme.of(context).textTheme.headlineMedium),
//             ),
//
//             Slider(
//               value: 2,
//               min: 1,
//               max: 4,
//               divisions: 3,
//               label: ,
//               onChanged: (double value) {
//                 print('Selected value: $value');
//               },
//             ),
//
//             // Row(
//             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //   children: [
//             //     Row(
//             //       children: [
//             //         Text("-15 Min"),
//             //
//             //         SizedBox(width: 8),
//             //
//             //         ElevatedButton(
//             //           style: ElevatedButton.styleFrom(
//             //             backgroundColor: Colors.blue.shade50,
//             //             minimumSize: Size(90, 50),
//             //             shape: RoundedRectangleBorder(
//             //               borderRadius: BorderRadius.circular(4),
//             //             ),
//             //           ),
//             //           onPressed: () => _selectTime(context),
//             //           child: Text(
//             //             '${selectedTime.format(context)}',
//             //             textAlign: TextAlign.center,
//             //             style: TextStyle(color: Custom_colors.darker_grey)),
//             //           ),
//             //
//             //         SizedBox(width: 8),
//             //
//             //         Text("+15 Min")
//             //       ],
//             //     ),
//             //
//             //
//             //     /// for selcting date
//             //     ElevatedButton(
//             //       style: ElevatedButton.styleFrom(
//             //         backgroundColor: Colors.blue.shade50,
//             //         minimumSize: Size(120,50),
//             //         shape: RoundedRectangleBorder(
//             //           borderRadius: BorderRadius.circular(4),
//             //         ),
//             //       ),
//             //       onPressed: () => _selectDate(context),
//             //       child: Text(
//             //         '${selectedDate.toLocal().toString().split(' ')[0]}',
//             //         textAlign: TextAlign.center,
//             //         style: TextStyle(color: Custom_colors.darker_grey),
//             //       ),
//             //     ),
//             //
//             //   ],
//             // ),
//             //
//
//
//
//             SizedBox(height: 24),
//
//             /// buy now button
//             GestureDetector(
//               onTap: () {
//                 load_payment_page();
//               },
//               child: SizedBox(
//                 width: double.infinity,
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: Colors.deepOrangeAccent,
//                       borderRadius: BorderRadius.circular(8)
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment:  CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal:8),
//                             child: Text("Total",style: TextStyle(fontSize: 13,color: Colors.white)),
//                           ),
//
//                           SizedBox(height: 2),
//
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 16,top: 2),
//                                     child: Text('\u20B9',style: TextStyle(fontSize: 18,color: Colors.white),),
//                                   ),
//
//                                   SizedBox(width: 3),
//
//                                   Text("1,800",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),)
//                                 ],
//                               )
//
//                             ],
//                           ),
//
//                           SizedBox(height: 5,)
//
//                         ],
//                       ),
//
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
//                         child: Container(
//                           padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8),
//                               color: Colors.white
//                           ),
//                           child: Text("CHECK OUT",style: Theme.of(context).textTheme.bodyMedium,),
//                         ),
//                       )
//                     ],
//                   ),
//                   // ElevatedButton(
//                   //   onPressed: () {
//                   //     // Add your onPressed code here!
//                   //   },
//                   //   style: ElevatedButton.styleFrom(
//                   //     backgroundColor: Colors.deepOrangeAccent.shade200, // Background color
//                   //     padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                   //     shape: RoundedRectangleBorder(
//                   //       borderRadius: BorderRadius.circular(8.0),
//                   //       side: BorderSide.none
//                   //     ),
//                   //
//                   //   ),
//                   //   child: Column(
//                   //     crossAxisAlignment: CrossAxisAlignment.start,
//                   //     mainAxisAlignment: MainAxisAlignment.start,
//                   //     children: [
//                   //       Text("Total")
//                   //
//                   //     ],
//                   //   )
//                   // Text(
//                   //   'Buy Now',
//                   //   style: TextStyle(
//                   //     color: Colors.white, // Text color
//                   //     fontSize: 16,
//                   //   ),
//                   // ),
//                 ),
//               ),
//             ),
//
//
//             SizedBox(height: 8), // Space between the buttons
//
//             /// add to cart button
//             SizedBox(
//               width: double.infinity,
//               child: OutlinedButton(
//                 onPressed: () {
//                   // Add your onPressed code here!
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutScreen() ));
//                 },
//                 style: OutlinedButton.styleFrom(
//                   padding: EdgeInsets.symmetric(horizontal: 24, vertical:8),
//                   side: BorderSide(color: Colors.deepOrangeAccent, width: 2), // Border color and width
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                 ),
//                 child: Text(
//                     'ADD TO CART',
//                     style: Theme.of(context).textTheme.titleMedium
//                 ),
//               ),
//             ),
//
//             SizedBox(height: 16,)
//
//
//
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// helper to elevated button
//   Widget _buildElevatedButton(int index, String text) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: ElevatedButton(
//         onPressed: () {
//           setState(() {
//             selectedIndex = index;
//           });
//         },
//         style: ElevatedButton.styleFrom(
//           foregroundColor: Colors.black87,
//           backgroundColor: selectedIndex == index ? Colors.blue.shade100 : Colors.white,
//           side: BorderSide(color: Colors.indigoAccent),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//         ),
//         child: Text(text),
//       ),
//     );
//   }
// }
//
