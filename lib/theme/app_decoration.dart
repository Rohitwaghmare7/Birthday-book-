import 'package:flutter/material.dart';
import 'package:rohit_s_application2/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get fillPurpleA100 => BoxDecoration(
        color: ColorConstant.purpleA100,
      );
}

class BorderRadiusStyle {
  static BorderRadius customBorderBL67 = BorderRadius.only(
    topRight: Radius.circular(
      getHorizontalSize(
        6.00,
      ),
    ),
    bottomLeft: Radius.circular(
      getHorizontalSize(
        67.00,
      ),
    ),
    bottomRight: Radius.circular(
      getHorizontalSize(
        67.00,
      ),
    ),
  );
}
