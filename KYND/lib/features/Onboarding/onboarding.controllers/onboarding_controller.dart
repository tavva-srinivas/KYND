import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kynd/features/home/Screens/home_screen.dart';

import '../../../bottom_nav.dart';

class Onboarding_controller extends GetxController {
 // from the onboard_screen (this controller is created in the onboard_screen)
  static Onboarding_controller get instance => Get.find();

  // Variables
   final page_controller = PageController();

   //here using "".obs()"" changes the page_index without a statful widget
   Rx<int> current_page_index = 0.obs;

  get carousel_current_index => null;


  // Update current index when page scroll
   void update_page_indicator(index) => current_page_index.value = index;


   // Jump to specific dot selected page
   void dotnavigation_click(index) {
     print("clicking $index");
     print(index.runtimeType);
    current_page_index.value = index;
    page_controller.jumpTo(index);
   }


   // update current index & jump to next page
   void next_page(){
     print("current_page_index  $current_page_index");
      if(current_page_index == 2){
        // Get.offAll(const Home_Screen());
        Get.offAll(Bottom_nav());
        // Navigator.pushNamedAndRemoveUntil(context, Bottom_nav.route_name,  (route) => false);

      }else{
        current_page_index.value++;
        page_controller.jumpToPage(current_page_index.value);
      }
   }


   // Update current index & jump to last page
   void skip_page(){
      current_page_index.value = 2;
      page_controller.jumpToPage(2);
   }
}