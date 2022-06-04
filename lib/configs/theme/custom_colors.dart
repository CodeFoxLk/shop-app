import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color favouritButtonColor;
  final Color cartButtonColors;
  final Color unSelectedColor;

  AppColors(
      {required this.favouritButtonColor,
      required this.cartButtonColors,
      required this.unSelectedColor});

  @override
  ThemeExtension<AppColors> copyWith({Color? favouritButtonColor, Color? cartButtonColors, Color? unSelectedColor}) {
    return AppColors(
      favouritButtonColor : favouritButtonColor ?? this.favouritButtonColor,
      cartButtonColors: cartButtonColors ?? this.cartButtonColors,
      unSelectedColor: unSelectedColor ?? this.unSelectedColor
    );
  }

  @override
  ThemeExtension<AppColors> lerp(ThemeExtension<AppColors>? other, double t) {
    return this;
  }

  static ThemeExtension<AppColors> getStyle([bool isDarkMode = false]){
    final colors = AppColors(favouritButtonColor: const Color.fromARGB(255, 200, 44, 33), cartButtonColors: Colors.blue, unSelectedColor: Colors.blueGrey);
    final darkThemeColors = colors.copyWith( unSelectedColor: const Color.fromARGB(255, 174, 194, 205));
    return isDarkMode ? darkThemeColors : colors;
  }
}


