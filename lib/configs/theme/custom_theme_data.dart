import 'package:flutter/material.dart';
import 'package:shop_app/configs/theme/custom_colors.dart';
import 'package:shop_app/configs/theme/ui_parameters.dart';

import 'custom_text_styles.dart';

class CustomThemeExtension {

  //singleton theme extension
  factory CustomThemeExtension(BuildContext context) {
    if(_themeExtentions == null){
      _themeExtentions = CustomThemeExtension._initialize(context);
      return _themeExtentions!;
    }
    return _themeExtentions!;
  }

  static CustomThemeExtension? _themeExtentions;

  late UIParameters uiParameters;
  late CustomTextStyles customTextStyle;
  late AppColors appColors;

  CustomThemeExtension._initialize(BuildContext context) {
    uiParameters = Theme.of(context).extension<UIParameters>()!;
    customTextStyle = Theme.of(context).extension<CustomTextStyles>()!;
    appColors = Theme.of(context).extension<AppColors>()!;
  }
}

AppBarTheme get appBarTheme => const AppBarTheme(
  elevation: 0,
  color: Colors.transparent
);
