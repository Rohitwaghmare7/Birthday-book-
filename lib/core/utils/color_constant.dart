import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color teal300 = fromHex('#48b2b2');

  static Color black900 = fromHex('#000000');

  static Color bluegray400 = fromHex('#888888');

  static Color pinkA700 = fromHex('#c3258d');

  static Color purpleA100 = fromHex('#ea78e6');

  static Color purple500 = fromHex('#a23d9e');

  static Color whiteA700 = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
