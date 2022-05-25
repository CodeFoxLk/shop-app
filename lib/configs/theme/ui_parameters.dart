import 'package:flutter/material.dart';


class UIParameters extends ThemeExtension<UIParameters> {
  final BorderRadius cardBorderRadius;
  final EdgeInsets cardPadding;
  final EdgeInsets screenPadding;
  final double contentGap;

  UIParameters({
    BorderRadius? borderRadius,
    EdgeInsets? screenPadding,
    EdgeInsets? cardPadding,
    this.contentGap = 15,
  })  : cardBorderRadius = borderRadius ?? BorderRadius.circular(15),
        cardPadding = cardPadding ?? const EdgeInsets.all(10),
        screenPadding = screenPadding ?? const EdgeInsets.all(20);

  @override
  ThemeExtension<UIParameters> copyWith({
    BorderRadius? cardBorderRadius,
    EdgeInsets? screenPadding,
    EdgeInsets? cardPadding,
    double? contentGap,
  }) {
    
     return UIParameters(
      borderRadius: cardBorderRadius ?? this.cardBorderRadius,
      cardPadding: cardPadding ?? this.cardPadding,
      screenPadding: screenPadding ?? this.screenPadding,
      contentGap: contentGap ?? this.contentGap
    );
  }

  @override
  ThemeExtension<UIParameters> lerp(
      ThemeExtension<UIParameters>? other, double t) {
    return this;
  }
}

bool isDarkMode(BuildContext context) {
  return true;
  var brightness = MediaQuery.of(context).platformBrightness;
  return brightness == Brightness.dark;
}