import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kynd/features/home/Screens/homescreen_widgets/home_searchbar.dart';
import 'package:kynd/utils/appbar.dart';
import 'package:kynd/utils/constants/colors.dart';
import 'package:kynd/utils/devices_utils/device_util.dart';

import '../../home/Screens/homescreen_widgets/circular_container.dart';
import '../../personalisation/screens/widgets/section_heading.dart';

class Store_screen extends StatefulWidget {
  static const String route_name = '/store';
  const Store_screen({super.key});

  @override
  State<Store_screen> createState() => _Store_screenState();
}

class _Store_screenState extends State<Store_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_Appbar(
        title: Padding(
          padding: const EdgeInsets.only(left: 16,top: 0),
          child: Text("Plan",style: Theme.of(context).textTheme.headlineLarge,),
        ),
      ),

      body:Container()
    );
  }
}
