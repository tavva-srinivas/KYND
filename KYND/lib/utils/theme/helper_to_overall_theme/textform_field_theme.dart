import 'package:flutter/material.dart';

class Custom_textform_field_theme{
  Custom_textform_field_theme._();

  static InputDecorationTheme light_input_decoration = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    labelStyle: const TextStyle().copyWith(fontSize: 14,color: Colors.black.withOpacity(0.6),fontWeight: FontWeight.bold),
    hintStyle: const TextStyle().copyWith(fontSize: 14,color: Colors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(width: 1.5,color: Colors.grey)
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 1,color: Colors.grey)
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 1,color: Colors.black12)
    ),
    errorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 1,color: Colors.red)
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 2,color: Colors.orange)
    ),
  );


  static InputDecorationTheme dark_input_decoration = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    labelStyle: const TextStyle().copyWith(fontSize: 14,color: Colors.white),
    hintStyle: const TextStyle().copyWith(fontSize: 14,color: Colors.white),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 1,color: Colors.grey)
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 1.5,color: Colors.grey)
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 1,color: Colors.black12)
    ),
    errorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 1,color: Colors.red)
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 2,color: Colors.orange)
    ),
  );
}