import 'package:flutter/material.dart';
import 'package:shop_app/configs/theme/ui_parameters.dart';

class CustomTextStyles extends ThemeExtension<CustomTextStyles> {
  final TextStyle titleTextStyle;
  final TextStyle detailsTextStyle;
  final TextStyle secondaryTextStyle;
  final TextStyle subTitleTextStyle;

  CustomTextStyles({
    required this.titleTextStyle,
    required this.detailsTextStyle,
    required this.secondaryTextStyle,
    required this.subTitleTextStyle,
  });

  @override
  ThemeExtension<CustomTextStyles> copyWith(
      {TextStyle? titleTextStyle,
      TextStyle? detailsTextStyle,
      TextStyle? secondaryTextStyle,
      TextStyle? subTitleTextStyle,
      }) {
    return CustomTextStyles(
        titleTextStyle: titleTextStyle ?? this.titleTextStyle,
        detailsTextStyle: detailsTextStyle ?? this.detailsTextStyle,
        secondaryTextStyle: secondaryTextStyle ?? this.secondaryTextStyle,
        subTitleTextStyle: subTitleTextStyle ?? this.subTitleTextStyle
        );
  }

  @override
  ThemeExtension<CustomTextStyles> lerp(
      ThemeExtension<CustomTextStyles>? other, double t) {
    return this;
  }

  // get and define custom text styles for each themes
  static ThemeExtension<CustomTextStyles> getStyle([bool isDarkMode = false]) {
    final style = CustomTextStyles(
      titleTextStyle:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      detailsTextStyle: const TextStyle(),
      secondaryTextStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.blueGrey),
      subTitleTextStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.blueGrey),
    );

    final darkStyle = CustomTextStyles(
      titleTextStyle: style.titleTextStyle,
      detailsTextStyle: style.detailsTextStyle,
      secondaryTextStyle: style.secondaryTextStyle.apply(color: Colors.blueGrey[200]),
      subTitleTextStyle: style.subTitleTextStyle.apply(color: Colors.blueGrey[200]),
    );
    return isDarkMode ? darkStyle : style;
  }
}
