import 'package:flutter/material.dart';
import 'package:kynd/admin_bottom_nav.dart';
import 'package:kynd/features/admin/screens/helper_to_screens/add_product_screen.dart';
import 'package:kynd/features/auth/Screens/Login_screen.dart';
import 'package:kynd/features/auth/Screens/Splash_screen.dart';
import 'package:kynd/features/Onboarding/screens/Onboard_screen.dart';
import 'package:kynd/features/auth/Screens/signup.dart';
import 'package:kynd/features/home/Screens/home_screen.dart';
import 'package:kynd/features/personalisation/screens/account_settings.dart';
import 'package:kynd/features/personalisation/screens/profile_screen.dart';
import 'package:kynd/features/store/screens/plan_sceen.dart';

import 'bottom_nav.dart';
import 'features/admin/screens/helper_to_screens/add_products_screen.dart';

Route<dynamic> got_to_route(RouteSettings newRoute){
  switch(newRoute.name){


    case Onboarding_screen.route_name: return MaterialPageRoute(builder: (newContext) => const Onboarding_screen());

    case Splash_screen.route_name: return MaterialPageRoute(builder: (newContext) => const Splash_screen());

    case SignUp_screen.route_name : return MaterialPageRoute(builder: (newContext) => const SignUp_screen());

    case Login_screen.route_name : return MaterialPageRoute(builder: (newContext) => const Login_screen());

    case Home_Screen.route_name : return MaterialPageRoute(builder: (newContext) => const Home_Screen());

    case Bottom_nav.route_name : return MaterialPageRoute(builder: (newContext) => const Bottom_nav());

    case Settings_screen.route_name  : return MaterialPageRoute(builder: (newContext) => const Settings_screen());

    case Profile_screen.route_name : return MaterialPageRoute(builder: (newContext) => Profile_screen());

    case Store_screen.route_name : return MaterialPageRoute(builder: (new_content) => Store_screen());

    case Admin_bottom_nav.route_name : return MaterialPageRoute(builder: (new_context) => Admin_bottom_nav());

    case Add_product_screen.route_name : return MaterialPageRoute(builder: (new_context) => Add_product_screen());

    default: return MaterialPageRoute(builder: (newContext){
      return const Scaffold(
        body: Center(
          child: Text("This shouldnt exsist"),
        ),
      );
    });
  }
}