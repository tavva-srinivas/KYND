// import 'package:flutter/material.dart';
//
// class Auth_Screen extends StatefulWidget {
//   static const String route_name = '/auth-screen';
//   const Auth_Screen({super.key});
//
//   @override
//   State<Auth_Screen> createState() => _Auth_ScreenState();
// }
//
// class _Auth_ScreenState extends State<Auth_Screen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        body: Center(child: Text("Hello")),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kynd/features/auth/Screens/Login_screen.dart';
import 'package:kynd/features/auth/services/auth_service.dart';
import 'package:kynd/bottom_nav.dart';
import 'package:kynd/utils/devices_utils/device_util.dart';

import '../../../Getx controllers/provider.dart';


// Splash_screen
class Splash_screen extends StatefulWidget {
  static const String route_name = '/Splash';
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screen();
}

class _Splash_screen extends State<Splash_screen> {

  @override
  void initState() {
    super.initState();


    Auth_service.get_user_data(context: context).then((value) {
      print("reching to splash screen");
      User_provider userProvider = Get.find<User_provider>();
      print("reching to splash screen ${userProvider.user.toJson()}");
    try {
      Future.delayed( const Duration(milliseconds: 10), () {

        print("the token is ${userProvider.user.token}");

        // Get the context in the initState method
        // Note: You can't directly call context in initState without a delay

        // WidgetsBinding.instance.addPostFrameCallback((_) {
          // exit full screen and set status bar color

          // bool dark = Device_util.is_dark_mode(this.context);
          // Device_util.set_full_screen(false);
          // // Device_util.set_status_bar_color(dark ? Custom_colors.dark : Custom_colors.light);
          // Device_util.set_status_bar_color(Custom_colors.dark);

          print("hello");
          if (userProvider.user.token!.isNotEmpty) {
            Navigator.pushNamed(context, Bottom_nav.route_name);
          } else {
            Navigator.pushNamed(context, Login_screen.route_name);
          }
        // };
      });
    }catch(error) {
      print("error in splash screen $error");
    }

    });


  //   API.get_self_info().then((value) {

    }
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.orange.shade200,
      body: Center(
            child: SizedBox(
              width: Device_util.mq(context).width*0.4,
              height: Device_util.mq(context).height*0.4,
              // decoration: const BoxDecoration(
              //   image: DecorationImage(
              //     fit: BoxFit.cover,
              //   ),
              // ),
              child: SvgPicture.asset('assets/svgs/logo.svg'),
            ),
      ),
      // )
    );
  }
}
