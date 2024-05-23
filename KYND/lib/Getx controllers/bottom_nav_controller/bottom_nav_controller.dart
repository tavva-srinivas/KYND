import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:kynd/features/Plan/Screens/Plan_screen.dart';
import 'package:kynd/features/product/screens/plan_days_screen.dart';

import '../../features/home/Screens/home_screen.dart';
import '../../features/personalisation/screens/account_settings.dart';
import '../../features/tracking/screens/tracking_screen.dart';

class Navigation_controller extends GetxController{
  // observes if the variable is changed or not
  // If we use set state everything rebuilds from scratch
  final Rx<int> selected_index = 0.obs;


  //  observed "obs"(observed)  has "obx"(observer) inside it so whenver the obs is changed the obx is also changed


  final screens = [const Home_Screen(),Plan_screen(),Plan_days_screen(),const Settings_screen()];

}


// Tracking_screen(meal_time: "Snacks", id: '',
//     images: ["assets/images/breakfast.jpg"],
//      name: 'Software Breakfast', rating: 4.3, price: '1200',)