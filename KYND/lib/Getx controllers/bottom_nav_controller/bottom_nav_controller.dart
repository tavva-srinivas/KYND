import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:kynd/features/store/screens/plan_sceen.dart';

import '../../features/home/Screens/home_screen.dart';
import '../../features/personalisation/screens/account_settings.dart';

class Navigation_controller extends GetxController{
  // observes if the variable is changed or not
  // If we use set state everything rebuilds from scratch
  final Rx<int> selected_index = 0.obs;


  //  observed "obs"(observed)  has "obx"(observer) inside it so whenver the obs is changed the obx is also changed


  final screens = [const Home_Screen(),Store_screen(),Container(color: Colors.deepPurpleAccent,),const Settings_screen()];

}
