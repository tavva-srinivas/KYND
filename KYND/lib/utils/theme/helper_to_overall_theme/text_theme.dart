import 'package:flutter/material.dart';


class Custom_Text_Theme{

  Custom_Text_Theme._();

  static TextTheme light_text_theme = TextTheme(
    // Instead of writing from scratch we going to change the default parameters
    headlineLarge: const TextStyle().copyWith(fontSize: 26,fontWeight: FontWeight.w700,color: Colors.black),
    headlineMedium: const TextStyle().copyWith(fontSize: 21,fontWeight: FontWeight.w700,color: Colors.black),
    headlineSmall: const TextStyle().copyWith(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.black),

    titleLarge: const TextStyle().copyWith(fontSize: 19,fontWeight: FontWeight.w600,color: Colors.black),
    titleMedium: const TextStyle().copyWith(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.black),
    titleSmall: const TextStyle().copyWith(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black),

      bodyLarge: const TextStyle().copyWith(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black.withOpacity(0.6)),
      bodyMedium: const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.black.withOpacity(0.6)),
      bodySmall: const TextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.black.withOpacity(0.6)),

      labelLarge: const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.black),
      labelMedium: const TextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.black.withOpacity(0.6)),
      labelSmall: const TextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black.withOpacity(0.6))


  );
  static TextTheme dark_text_theme = TextTheme(

    // Instead of writing from scratch we going to change the default parameters
      headlineLarge: const TextStyle().copyWith(fontSize: 26,fontWeight: FontWeight.w700,color: Colors.white),
      headlineMedium: const TextStyle().copyWith(fontSize: 21,fontWeight: FontWeight.w700,color: Colors.white),
      headlineSmall: const TextStyle().copyWith(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.white),

      titleLarge: const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white),
      titleMedium: const TextStyle().copyWith(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white),
      titleSmall: const TextStyle().copyWith(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white),

      bodyLarge: const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white.withOpacity(0.6)),
      bodyMedium: const TextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.white.withOpacity(0.6)),
      bodySmall: const TextStyle().copyWith(fontSize: 13,fontWeight: FontWeight.normal,color: Colors.white.withOpacity(0.6)),

      labelLarge: const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.white),
      labelMedium: const TextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.white.withOpacity(0.6)),
      labelSmall: const TextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.white.withOpacity(0.6))

  );
}