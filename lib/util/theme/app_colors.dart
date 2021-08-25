import 'package:flutter/material.dart';

final Color white = Colors.white;
final HexColor deepIndigo = HexColor("#240066");
final HexColor orange = HexColor("#FFAA00");
final HexColor lowOrange = HexColor("#FFF5E1");
final HexColor lowBlack = HexColor("#616161");
final HexColor greySmall = HexColor("#F0F0F0");
final HexColor lowGrey = HexColor("#ABABAB");


class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
