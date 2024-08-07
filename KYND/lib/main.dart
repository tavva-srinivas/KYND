import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kynd/utils/devices_utils/device_util.dart';
import 'app.dart';

void main() {
  // Ensure initialization
  WidgetsFlutterBinding.ensureInitialized();

  // Set status bar color and enable full screen
  Device_util.set_status_bar_color(Colors.white);
  Device_util.set_full_screen(true);

  // Set preferred orientations
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]).then((value){

    // Run the app (to avoid any weird glitches)
    runApp(const MyApp());
  });

}


// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//         title: 'Flutter Demo',
//         themeMode: ThemeMode.system,
//         theme: Custom_App_Theme.light_theme,
//         // ThemeData(
//         //   scaffoldBackgroundColor: Colors.white,
//         //   colorScheme: const ColorScheme.light(
//         //       brightness: Brightness.dark,
//         //       primary: Global_Variables.secondaryColor),
//         //   appBarTheme: const AppBarTheme(),
//         //   useMaterial3: true,
//         // ),
//         darkTheme: Custom_App_Theme.dark_theme,
//         onGenerateRoute: (next_route) => got_to_route(next_route),
//         home: Auth_Screen()
//     );
//   }
// }
