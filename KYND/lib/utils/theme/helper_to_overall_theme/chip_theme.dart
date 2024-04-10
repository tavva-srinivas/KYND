import 'package:flutter/material.dart';

class Custom_chip_theme{
  Custom_chip_theme._();
  
  static ChipThemeData light_chip_theme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: Colors.indigoAccent,
    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
    checkmarkColor: Colors.white
  );


  static ChipThemeData dark_chip_theme = const ChipThemeData(
      disabledColor: Colors.grey,
      labelStyle: TextStyle(color: Colors.white),
      selectedColor: Colors.blue,
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      checkmarkColor: Colors.white,
  );
}