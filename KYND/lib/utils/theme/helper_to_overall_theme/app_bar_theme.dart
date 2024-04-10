import 'package:flutter/material.dart';

class Custom_app_bar_theme{
  Custom_app_bar_theme._();

  static AppBarTheme light_app_bar = const AppBarTheme(
    elevation: 1,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black,size: 24),
    actionsIconTheme: IconThemeData(color: Colors.black, size : 24),
    titleTextStyle: TextStyle(fontSize:18,fontWeight: FontWeight.w600,color: Colors.black),
  );


  static AppBarTheme dark_app_bar = const AppBarTheme(
    elevation: 1,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black,size: 24),
    actionsIconTheme: IconThemeData(color: Colors.white, size : 24),
    titleTextStyle: TextStyle(fontSize:18,fontWeight: FontWeight.w600,color: Colors.white),
  );
}