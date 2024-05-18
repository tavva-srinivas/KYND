import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kynd/utils/constants/colors.dart';
import 'package:kynd/utils/devices_utils/device_util.dart';

import 'Getx controllers/bottom_nav_controller/admin_nav_controller.dart';

class Admin_bottom_nav extends StatelessWidget {
  static const route_name = "/admin_nav";
  const Admin_bottom_nav({super.key});

  @override
  Widget build(BuildContext context) {

    /// Getx controller for the bottom_tab management
    final controller = Get.put(Admin_nav_controller());
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
                // indicatorColor: darkMode  ? Custom_colors.white.withOpacity(0.1) : Custom_colors.black.withOpacity(0.1),
              indicatorColor: darkMode  ? Custom_colors.white.withOpacity(0.1) : Colors.blueAccent.withOpacity(0.25),

                destinations: const [
                  NavigationDestination(icon: Icon(Iconsax.home), label: 'My products'),
                  NavigationDestination(icon: Icon(Iconsax.tag), label: 'Orders'),
                  NavigationDestination(icon: Icon(Iconsax.chart), label: 'Analytics'),
                  // NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile')

          ],

        ),
      ),
      body: Obx(() => controller.screens[controller.selected_index.value]) ,
    );
  }
}





