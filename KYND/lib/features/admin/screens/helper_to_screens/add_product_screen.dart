// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:kynd/features/personalisation/screens/widgets/section_heading.dart';
// import 'package:kynd/utils/appbar.dart';
// import 'package:kynd/utils/constants/colors.dart';
// import 'package:kynd/utils/devices_utils/device_util.dart';
//

// class DropdownController extends GetxController {
//   var selectedItem = 'Breakfast'.obs;
// }
//
// class Add_product_screen extends StatefulWidget {
//   static const String route_name = '/add-product';
//   const Add_product_screen({super.key});
//
//   @override
//   State<Add_product_screen> createState() => _Add_product_screenState();
// }
//
// class _Add_product_screenState extends State<Add_product_screen> {
//
//    final TextEditingController product_controller = TextEditingController();
//    final TextEditingController description_controller = TextEditingController();
//    final TextEditingController price_controller = TextEditingController();
//    final TextEditingController quantity_controller = TextEditingController();
//    final TextEditingController serving_controller = TextEditingController();
//    final TextEditingController cal_controller = TextEditingController();
//    final TextEditingController protein_controller = TextEditingController();
//    final TextEditingController fibre_controller = TextEditingController();
//    final TextEditingController carbs_controller = TextEditingController();
//    final TextEditingController from_time_controller = TextEditingController();
//    final TextEditingController to_time_controller = TextEditingController();
//
//
//
//    @override
//   void dispose() {
//     super.dispose();
//     product_controller.dispose();
//     description_controller.dispose();
//     price_controller.dispose();
//     serving_controller.dispose();
//     cal_controller.dispose();
//     protein_controller.dispose();
//     quantity_controller.dispose();
//     fibre_controller.dispose();
//     carbs_controller.dispose();
//   }
//
//
//   List<String> product_categories = ["Breakfast","Lunch","Dinner","Juice","Shake","Snack"];
//
//  /// getting the controller
//    final DropdownController controller = Get.put(DropdownController());
//
//
//
//    @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: Custom_Appbar(show_backarrow: true,back_color: Colors.pinkAccent.shade200, title:  Text("Add Product", style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.white),),has_center_title: true,arrow_color: Colors.white, ),
//       body: SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//         child: Form(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             child: Column(
//                mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 16,),
//
//                   Text("GENERAL" , style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.indigo,letterSpacingDelta: 1),),
//
//
//                 /// Dotted border to take the product
//                 Padding(
//                   padding: const EdgeInsets.symmetric( vertical:16),
//                   child: DottedBorder(
//                     borderType: BorderType.RRect,
//                       color: Custom_colors.dark_grey,
//                       radius: Radius.circular(12),
//                       dashPattern: [8,4],
//                       child: Container(
//                     width: double.infinity,
//                     height: Device_util.get_height(context)*0.18,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Icon(Icons.folder_open,size: 32,),
//                         SizedBox(height: 15),
//                         Text("Select Product Images" , style: Theme.of(context).textTheme.bodyMedium,)
//                       ],
//                     ),)),
//                 ),
//
//
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 3),
//                   child: SizedBox(
//                     height: Device_util.get_height(context)*0.08,
//                     child: TextFormField(
//                         maxLines: 1,
//                         controller: product_controller,
//                         decoration: InputDecoration(
//                           hintText: "Product Name",
//                           hintStyle: Theme.of(context).textTheme.bodyMedium,
//                         )),
//                   ),
//                 ),
//
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 3),
//                   child: SizedBox(
//                     height: Device_util.get_height(context)*0.2,
//                     child: TextFormField(
//                         maxLines: 10,
//                         controller: description_controller,
//                         decoration: InputDecoration(
//                           hintText: "Description",
//                           hintStyle: Theme.of(context).textTheme.bodyMedium,
//                         )),
//                   ),
//                 ),
//
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 3),
//                   child: SizedBox(
//                     height: Device_util.get_height(context)*0.08,
//                     child: TextFormField(
//                         maxLines: 1,
//                         controller: price_controller,
//                         decoration: InputDecoration(
//                           hintText: "Price",
//                           hintStyle: Theme.of(context).textTheme.bodyMedium,
//                         )),
//                   ),
//                 ),
//
//               /// quntity
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 3),
//                   child: SizedBox(
//                     height: Device_util.get_height(context)*0.08,
//                     child: TextFormField(
//                         maxLines: 1,
//                         controller: quantity_controller,
//                         decoration: InputDecoration(
//                           hintText: "Quantity",
//                           hintStyle: Theme.of(context).textTheme.bodyMedium,
//                         )),
//                   ),
//                 ),
//
//                 SizedBox(height: 16),
//                 Divider(indent: 24,endIndent: 24,),
//                 SizedBox(height: 16,),
//
//                 /// Nutrition
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: 8),
//                   child: Text("NUTRITION" , style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.indigo,letterSpacingDelta: 1),),
//                 ),
//
//
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 4),
//                   child: SizedBox(
//                     height: Device_util.get_height(context)*0.08,
//                     child: TextFormField(
//                         maxLines: 1,
//                         controller: quantity_controller,
//                         decoration: InputDecoration(
//                           hintText: "Serving",
//                           hintStyle: Theme.of(context).textTheme.bodyMedium,
//                         )),
//                   ),
//                 ),
//
//
//                 /// carbs and protein
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 4),
//                   child: Row(
//                     children: [
//                       Expanded(
//                           child: TextFormField(expands: false,
//                             decoration: InputDecoration(
//                               hintText: "Carbs",
//                               hintStyle: Theme.of(context).textTheme.bodyMedium,
//                             ),
//                             controller: carbs_controller,
//                         // validator: (stringText) => validator(stringText!,"First Name") ,
//                       )),
//                       const SizedBox(width: 12),
//                       Expanded(
//                           child: TextFormField(expands: false,
//                             decoration: InputDecoration(
//                               hintText: "Protein",
//                               hintStyle: Theme.of(context).textTheme.bodyMedium,
//                             ),
//                             controller: carbs_controller,
//                             // validator: (stringText) => validator(stringText!,"First Name") ,
//                           )),
//                     ],),
//                 ),
//
//
//                 /// Calcium and Fibre
//
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical:4),
//                   child: Row(
//                     children: [
//                       Expanded(
//                           child: TextFormField(expands: false,
//                             decoration: InputDecoration(
//                               hintText: "Calcium",
//                               hintStyle: Theme.of(context).textTheme.bodyMedium,
//                             ),
//                             controller: carbs_controller,
//                             // validator: (stringText) => validator(stringText!,"First Name") ,
//                           )),
//                       const SizedBox(width: 12),
//                       Expanded(
//                           child: TextFormField(expands: false,
//                             decoration: InputDecoration(
//                               hintText: "Fibre",
//                               hintStyle: Theme.of(context).textTheme.bodyMedium,
//                             ),
//                             controller: carbs_controller,
//                             // validator: (stringText) => validator(stringText!,"First Name") ,
//                           )),
//                     ],),
//                 ),
//
//
//                 SizedBox(height: 16),
//                 Divider(indent: 24,endIndent: 24,),
//                 SizedBox(height: 16,),
//
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: 8),
//                   child: Text("CATEGORY" , style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.indigo,letterSpacingDelta: 1),),
//                 ),
//
//                 SizedBox(
//                   child: DropdownButton(
//                     items: product_categories.map((String item) => DropdownMenuItem(child: Text(item))).toList(),
//                     onChanged: (value) { controller.selectedItem = value } ,
//
//                   ),
//                 ),
//
//
//
//
//
//                 SizedBox(height: 100,)
//
//
//               ],
//             ),
//           ) ,
//
//         ),
//       ),
//     );
//   }
// }
