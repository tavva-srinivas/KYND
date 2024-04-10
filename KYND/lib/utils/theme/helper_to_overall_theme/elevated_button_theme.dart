import 'package:flutter/material.dart';

// Light and dark elevated button themes

class Custom_elevated_button_theme{
  Custom_elevated_button_theme._();


  static ElevatedButtonThemeData light_elevated_button = ElevatedButtonThemeData(

    style: ElevatedButton.styleFrom(
      elevation: 1,
      foregroundColor: Colors.white,
      backgroundColor: Colors.indigoAccent,
      disabledBackgroundColor: Colors.grey,
      disabledForegroundColor: Colors.grey,
      side: const BorderSide(color: Colors.indigoAccent),
      padding: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      textStyle: const TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w600),
    )
  );


  static ElevatedButtonThemeData dark_elevated_button = ElevatedButtonThemeData(

  style: ElevatedButton.styleFrom(
  elevation: 1,
  foregroundColor: Colors.white,
  backgroundColor: Colors.indigoAccent,
  disabledBackgroundColor: Colors.grey,
  disabledForegroundColor: Colors.grey,
  side: const BorderSide(color: Colors.indigoAccent),
  padding: const EdgeInsets.symmetric(vertical: 12),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
  textStyle: const TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w600)
  ));
}