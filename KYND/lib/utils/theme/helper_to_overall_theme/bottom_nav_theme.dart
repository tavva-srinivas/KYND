import 'package:flutter/material.dart';
import 'package:kynd/utils/constants/colors.dart';

class Custom_bottomNav_theme {
  static final BottomNavigationBarThemeData light = BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Colors.blueAccent,
    unselectedItemColor: Colors.grey,
    selectedLabelStyle: TextStyle(
      fontSize: 8,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 8,
    ),
    showUnselectedLabels: true,
  );

  static final BottomNavigationBarThemeData dark = BottomNavigationBarThemeData(
    backgroundColor: Custom_colors.black,
    selectedItemColor: Custom_colors.white.withOpacity(0.7),
    unselectedItemColor: Colors.grey,
    selectedLabelStyle: TextStyle(
      fontSize: 8,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 8,
    ),
    showUnselectedLabels: true,
  );
}
