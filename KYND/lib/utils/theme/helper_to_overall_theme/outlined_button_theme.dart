import 'package:flutter/material.dart';

class Custom_Outlined_theme{
  Custom_Outlined_theme._();

  static final OutlinedButtonThemeData light_outlined_theme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 1,
      foregroundColor: Colors.black.withOpacity(0.6),
      side: const BorderSide(color: Colors.indigoAccent),
      textStyle: TextStyle(fontSize: 14,color: Colors.black.withOpacity(0.6),fontWeight: FontWeight.w500),
      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
    )
  );

  static final OutlinedButtonThemeData dark_outlined_theme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          elevation: 1,
          foregroundColor: Colors.white,
          side: const BorderSide(color: Colors.blueAccent),
          textStyle: const TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w600),
          padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 18),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
      )
  );
}