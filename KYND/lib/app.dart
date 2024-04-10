import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kynd/features/auth/services/auth_service.dart';
import 'package:kynd/router.dart';
import 'package:kynd/utils/theme/overall_theme.dart';

import 'features/auth/Screens/Splash_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {


  @override
  void initState() {
    super.initState();
    Auth_service.get_user_data(context: context);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        themeMode: ThemeMode.system,
        theme: Custom_App_Theme.light_theme,
        darkTheme: Custom_App_Theme.dark_theme,
        // ThemeData(
        //   scaffoldBackgroundColor: Colors.white,
        //   colorScheme: const ColorScheme.light(
        //       brightness: Brightness.dark,
        //       primary: Global_Variables.secondaryColor),
        //   appBarTheme: const AppBarTheme(),
        //   useMaterial3: true,
        // ),
        onGenerateRoute: (nextRoute) => got_to_route(nextRoute),
        home : const Splash_screen()
        // home:  Obx(() {
        //   if (user_provider.user.token!.isNotEmpty) {
        //     return Home_Screen();
        //   } else {
        //     return Login_screen();
        //   }
        // }),

    );
  }
}
