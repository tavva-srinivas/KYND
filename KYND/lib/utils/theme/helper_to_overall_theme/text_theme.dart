import 'package:flutter/material.dart';

import '../../constants/colors.dart';


class Custom_Text_Theme{

  Custom_Text_Theme._();

  static TextTheme light_text_theme = TextTheme(
    // Instead of writing from scratch we going to change the default parameters
    headlineLarge: const TextStyle().copyWith(fontSize: 26,fontWeight: FontWeight.w600,color: Custom_colors.dark),
    headlineMedium: const TextStyle().copyWith(fontSize: 21,fontWeight: FontWeight.w600,color: Custom_colors.dark),
    headlineSmall: const TextStyle().copyWith(fontSize: 19,fontWeight: FontWeight.bold,color: Custom_colors.dark),

    titleLarge: const TextStyle().copyWith(fontSize: 19,fontWeight: FontWeight.w600,color: Custom_colors.dark.withOpacity(0.8)),
    titleMedium: const TextStyle().copyWith(fontSize: 17,fontWeight: FontWeight.w600,color: Custom_colors.dark.withOpacity(0.8)),
    titleSmall: const TextStyle().copyWith(fontSize: 15,fontWeight: FontWeight.w600,color: Custom_colors.dark.withOpacity(0.8)),

      bodyLarge: const TextStyle().copyWith(fontSize: 17,fontWeight: FontWeight.w600,color: Custom_colors.dark.withOpacity(0.6)),
      bodyMedium: const TextStyle().copyWith(fontSize: 15,fontWeight: FontWeight.bold,color: Custom_colors.dark.withOpacity(0.6)),
      bodySmall: const TextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.bold,color: Custom_colors.dark.withOpacity(0.6)),

      labelLarge: const TextStyle().copyWith(fontSize: 18,fontWeight: FontWeight.normal,color: Custom_colors.dark,wordSpacing: 1.5),
      labelMedium: const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.normal,color: Custom_colors.dark.withOpacity(0.6)),
      labelSmall: const TextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.normal,color: Custom_colors.dark.withOpacity(0.6))


  );
  static TextTheme dark_text_theme = TextTheme(

    // Instead of writing from scratch we going to change the default parameters
      headlineLarge: const TextStyle().copyWith(fontSize: 26,fontWeight: FontWeight.w700,color: Custom_colors.light),
      headlineMedium: const TextStyle().copyWith(fontSize: 21,fontWeight: FontWeight.w700,color: Custom_colors.light),
      headlineSmall: const TextStyle().copyWith(fontSize: 19,fontWeight: FontWeight.bold,color: Custom_colors.light),

      titleLarge: const TextStyle().copyWith(fontSize: 19,fontWeight: FontWeight.w600,color: Custom_colors.light),
      titleMedium: const TextStyle().copyWith(fontSize: 17,fontWeight: FontWeight.w500,color: Custom_colors.light),
      titleSmall: const TextStyle().copyWith(fontSize: 15,fontWeight: FontWeight.w400,color: Custom_colors.light),

      bodyLarge: const TextStyle().copyWith(fontSize: 18,fontWeight: FontWeight.w500,color: Custom_colors.light.withOpacity(0.6)),
      bodyMedium: const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.normal,color: Custom_colors.light.withOpacity(0.6)),
      bodySmall: const TextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.normal,color: Custom_colors.light.withOpacity(0.6)),

      labelLarge: const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.normal,color: Custom_colors.light),
      labelMedium: const TextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.normal,color: Custom_colors.light.withOpacity(0.6)),
      labelSmall: const TextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.normal,color: Custom_colors.light.withOpacity(0.6))

  );
}