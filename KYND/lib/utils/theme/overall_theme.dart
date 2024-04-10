import 'package:flutter/material.dart';
import 'package:kynd/utils/theme/helper_to_overall_theme/app_bar_theme.dart';
import 'package:kynd/utils/theme/helper_to_overall_theme/bottom_sheet_theme.dart';
import 'package:kynd/utils/theme/helper_to_overall_theme/check_box_theme.dart';
import 'package:kynd/utils/theme/helper_to_overall_theme/elevated_button_theme.dart';
import 'package:kynd/utils/theme/helper_to_overall_theme/outlined_button_theme.dart';
import 'package:kynd/utils/theme/helper_to_overall_theme/text_theme.dart';
import 'package:kynd/utils/theme/helper_to_overall_theme/textform_field_theme.dart';

class Custom_App_Theme{

  // ""_"" indicates that it is a private constructor which cannot be instantiated outside the library(overall_theme.dart)

  // Main goal --> prohibiting instantiation of class (ie, from other dart file) just use the static method
  Custom_App_Theme._();

  static ThemeData light_theme = ThemeData(

    // for using updated styles in Material three guidlines
    useMaterial3: true,
    fontFamily: 'Nunito',
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    primaryColor: Colors.indigoAccent,
    textTheme: Custom_Text_Theme.light_text_theme,
    elevatedButtonTheme: Custom_elevated_button_theme.light_elevated_button,
    outlinedButtonTheme: Custom_Outlined_theme.light_outlined_theme,
    inputDecorationTheme: Custom_textform_field_theme.light_input_decoration,
    bottomSheetTheme: Custom_bottom_theme.light_bottom_sheet,
    checkboxTheme: Custom_checkbox_theme.light_checkbox,
    appBarTheme: Custom_app_bar_theme.light_app_bar,

  );
  static ThemeData dark_theme  = ThemeData(

      useMaterial3: true,
      fontFamily: 'Nunito',
      scaffoldBackgroundColor: Colors.black,
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      textTheme: Custom_Text_Theme.dark_text_theme,
      elevatedButtonTheme: Custom_elevated_button_theme.dark_elevated_button,
    outlinedButtonTheme: Custom_Outlined_theme.dark_outlined_theme,
    inputDecorationTheme: Custom_textform_field_theme.dark_input_decoration,
    bottomSheetTheme: Custom_bottom_theme.dark_bottom_sheet,
    checkboxTheme: Custom_checkbox_theme.dark_checkbox,
    appBarTheme: Custom_app_bar_theme.dark_app_bar,
  );
}