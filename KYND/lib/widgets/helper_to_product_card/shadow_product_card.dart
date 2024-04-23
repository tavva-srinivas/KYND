import 'package:flutter/material.dart';
import 'package:kynd/utils/constants/colors.dart';

class Custom_shadow_class {

  static final vertical_product_shadow = BoxShadow(
    color: Custom_colors.white.withOpacity(0.2),
    blurRadius: 20,
    spreadRadius: 2,
    offset: Offset(0,2)
  );


  static final horizontal_product_shadow = BoxShadow(
    color: Custom_colors.dark_grey.withOpacity(0.1),
    blurRadius: 40,
    spreadRadius: 6,
    offset: Offset(0,2)
  );

}