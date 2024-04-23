import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:kynd/features/home/Screens/homescreen_widgets/circular_container.dart';

import '../../../../utils/appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/devices_utils/device_util.dart';


/// Getx controller
class DropdownController extends GetxController {
  final selected_item = "Breakfast".obs;
  RxList<File> selectedImages = <File>[].obs;


  void set_selected(String value){
    selected_item.value = value;
  }

  void add_images(List<File> imgs){
    selectedImages.addAll(imgs);
  }
}



class Add_product_screen extends StatelessWidget {
  static const String route_name = '/add-product';
  const Add_product_screen({super.key});



  @override
  Widget build(BuildContext context) {

    final TextEditingController product_controller = TextEditingController();
    final TextEditingController description_controller = TextEditingController();
    final TextEditingController price_controller = TextEditingController();
    final TextEditingController quantity_controller = TextEditingController();
    final TextEditingController serving_controller = TextEditingController();
    final TextEditingController cal_controller = TextEditingController();
    final TextEditingController protein_controller = TextEditingController();
    final TextEditingController fibre_controller = TextEditingController();
    final TextEditingController carbs_controller = TextEditingController();
    final TextEditingController from_time_controller = TextEditingController();
    final TextEditingController to_time_controller = TextEditingController();

    List<String> product_categories = ["Breakfast","Lunch","Dinner","Juice","Shake","Snack"];

    final DropdownController dropdownController = Get.put(DropdownController());

    /// for selecting the selected files and sending them
    void select_product_images() async{
      var selected_img = await Device_util.pick_image();
       dropdownController.add_images(selected_img) ;
    }


    // final DropdownController dropdownController = DropdownController();

    return Scaffold(
      appBar: Custom_Appbar(show_backarrow: true,back_color: Colors.pinkAccent.shade200, title:  Text("Add Product", style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.white),),has_center_title: true,arrow_color: Colors.white, ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16,),

                Text("GENERAL" , style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.indigo,letterSpacingDelta: 1),),


                /// Dotted border to take the product
                dropdownController.selectedImages.isNotEmpty ?
                CarouselSlider(
                  items: dropdownController.selectedImages.map((image) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Image.file(image);
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: false, // Disable auto-play
                    scrollDirection: Axis.horizontal,
                  ),
                ) :  GestureDetector(
                  onTap: () => select_product_images(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric( vertical:16),
                    child: DottedBorder(
                        borderType: BorderType.RRect,
                        color: Custom_colors.dark_grey,
                        radius: Radius.circular(12),
                        dashPattern: [8,4],
                        child: Container(
                          width: double.infinity,
                          height: Device_util.get_height(context)*0.18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.folder_open,size: 32,),
                              SizedBox(height: 15),
                              Text("Select Product Images" , style: Theme.of(context).textTheme.bodyMedium,)
                            ],
                          ),)),
                  ),
                ),

                SizedBox(height: 8),


                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: SizedBox(
                    height: Device_util.get_height(context)*0.08,
                    child: TextFormField(
                        maxLines: 1,
                        controller: product_controller,
                        decoration: InputDecoration(
                          hintText: "Product Name",
                          hintStyle: Theme.of(context).textTheme.bodyMedium,
                        )),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: SizedBox(
                    height: Device_util.get_height(context)*0.2,
                    child: TextFormField(
                        maxLines: 10,
                        controller: description_controller,
                        decoration: InputDecoration(
                          hintText: "Description",
                          hintStyle: Theme.of(context).textTheme.bodyMedium,
                        )),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: SizedBox(
                    height: Device_util.get_height(context)*0.08,
                    child: TextFormField(
                        maxLines: 1,
                        controller: price_controller,
                        decoration: InputDecoration(
                          hintText: "Price",
                          hintStyle: Theme.of(context).textTheme.bodyMedium,
                        )),
                  ),
                ),

                /// quntity
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: SizedBox(
                    height: Device_util.get_height(context)*0.08,
                    child: TextFormField(
                        maxLines: 1,
                        controller: quantity_controller,
                        decoration: InputDecoration(
                          hintText: "Quantity",
                          hintStyle: Theme.of(context).textTheme.bodyMedium,
                        )),
                  ),
                ),

                SizedBox(height: 16),
                Divider(indent: 24,endIndent: 24,),
                SizedBox(height: 16,),

                /// Nutrition
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text("NUTRITION" , style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.indigo,letterSpacingDelta: 1),),
                ),


                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: SizedBox(
                    height: Device_util.get_height(context)*0.08,
                    child: TextFormField(
                        maxLines: 1,
                        controller: quantity_controller,
                        decoration: InputDecoration(
                          hintText: "Serving",
                          hintStyle: Theme.of(context).textTheme.bodyMedium,
                        )),
                  ),
                ),


                /// carbs and protein
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextFormField(expands: false,
                            decoration: InputDecoration(
                              hintText: "Carbs",
                              hintStyle: Theme.of(context).textTheme.bodyMedium,
                            ),
                            controller: carbs_controller,
                            // validator: (stringText) => validator(stringText!,"First Name") ,
                          )),
                      const SizedBox(width: 12),
                      Expanded(
                          child: TextFormField(expands: false,
                            decoration: InputDecoration(
                              hintText: "Protein",
                              hintStyle: Theme.of(context).textTheme.bodyMedium,
                            ),
                            controller: carbs_controller,
                            // validator: (stringText) => validator(stringText!,"First Name") ,
                          )),
                    ],),
                ),


                /// Calcium and Fibre

                Padding(
                  padding: const EdgeInsets.symmetric(vertical:4),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextFormField(expands: false,
                            decoration: InputDecoration(
                              hintText: "Calcium",
                              hintStyle: Theme.of(context).textTheme.bodyMedium,
                            ),
                            controller: carbs_controller,
                            // validator: (stringText) => validator(stringText!,"First Name") ,
                          )),
                      const SizedBox(width: 12),
                      Expanded(
                          child: TextFormField(expands: false,
                            decoration: InputDecoration(
                              hintText: "Fibre",
                              hintStyle: Theme.of(context).textTheme.bodyMedium,
                            ),
                            controller: carbs_controller,
                            // validator: (stringText) => validator(stringText!,"First Name") ,
                          )),
                    ],),
                ),


                SizedBox(height: 16),
                Divider(indent: 24,endIndent: 24,),
                SizedBox(height: 16,),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text("CATEGORY" , style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.indigo,letterSpacingDelta: 1),),
                ),

                SizedBox(
                  width: Device_util.get_width(context)*0.5,
                  child: Obx(
                        () => Container(
                          padding: EdgeInsets.all(6),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1,color: Colors.grey),
                            borderRadius: BorderRadius.circular(4)
                          ),
                          child: DropdownButton(
                            items: product_categories.map((String item) => DropdownMenuItem(
                              value: item, // Specify unique values for each DropdownMenuItem
                              child: Text(item),
                            )).toList(),
                            onChanged: (new_str) {
                              dropdownController.set_selected(new_str!);
                            },
                            value: dropdownController.selected_item.value,
                            // for removing a small line in the dropdown
                            underline: Container(),
                            icon: Padding( // Add padding to the icon
                              padding: EdgeInsets.only(left: Device_util.get_width(context)*0.2),
                              child: Icon(Icons.arrow_drop_down), // Use the default dropdown arrow icon
                            ),
                          ),
                        ),

                  ),
                ),

                SizedBox(height: 24),

                Custom_container(radius : 4,child: Center(child :Text("Sell",style: Theme.of(context).textTheme.titleLarge!.apply(color: Colors.white),)),background_color: Colors.pinkAccent,width: double.infinity,height: Device_util.get_height(context)*0.06,),





                SizedBox(height: 100,)


              ],
            ),
          ) ,

        ),
      ),
    );
  }
}
