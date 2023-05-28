import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color blueGray700 = fromHex('#2e4b78');

  static Color blueGray900 = fromHex('#122541');

  static Color whiteA700 = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
