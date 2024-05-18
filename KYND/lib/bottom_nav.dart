import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kynd/utils/constants/colors.dart';
import 'package:kynd/utils/devices_utils/device_util.dart';

import 'Getx controllers/bottom_nav_controller/bottom_nav_controller.dart';




class Bottom_nav extends StatelessWidget {
  const Bottom_nav({super.key});
  static const String route_name = '/bottom_nav';


  @override
  Widget build(BuildContext context) {

    /// Getx controller for the bottom_tab management
     final controller = Get.put(Navigation_controller());
     // dealing with dark mode
     final darkMode = Device_util.is_dark_mode(context);


    return Scaffold(
       bottomNavigationBar: Obx(
         // this syntax is like Navigation bar is the child of Obx
             () => NavigationBar(
           height: 80,
           elevation: 0,
           // as selected integer is a ""Rx"" type so to get the integer value we are using "".value""
           selectedIndex: controller.selected_index.value,
           onDestinationSelected: (selectedTab) => controller.selected_index.value = selectedTab,
           backgroundColor: darkMode ? Custom_colors.black : Colors.white,
           indicatorColor: darkMode  ? Custom_colors.white.withOpacity(0.1) : Colors.blueAccent.withOpacity(0.25),

           destinations: const [
             NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
             NavigationDestination(icon: Icon(Iconsax.tag), label: 'Plan'),
             NavigationDestination(icon: Icon(Iconsax.chart), label: 'Tracking'),
             NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile')

           ],

         ),
       ),
      body: Obx(() => controller.screens[controller.selected_index.value]) ,
    );
  }
}





