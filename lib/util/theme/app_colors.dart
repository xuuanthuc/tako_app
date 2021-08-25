import 'package:flutter/material.dart';

final Color white = Colors.white;
final HexColor deepIndigo = HexColor("#240066");
final HexColor azure = HexColor("#03A9F4");
final HexColor blue = HexColor("#4D7FF8");
final HexColor darkBlue = HexColor("#152764");
final HexColor white_1 = HexColor("#ECECEC");
final HexColor primaryColor = HexColor("#3FDDFE");
final HexColor purple = HexColor("#651FFF");
final HexColor lightBlue = HexColor("#1DE9B6");
final HexColor yellow = HexColor("#FFC400");
final HexColor orange = HexColor("#FF6D00");
final HexColor red = HexColor("#FF3D00");
final HexColor green = HexColor("#1AC62B");
final HexColor black = HexColor("#121212");
final HexColor grey_2 = HexColor("#454545");
final HexColor grey_3 = HexColor("#6B6B6B");
final HexColor grey_4 = HexColor("#A0A0A0");
final HexColor grey_5 = HexColor("#DDDDDD");
final HexColor grey_6 = HexColor("#F2F2F2");
final HexColor grey_7 = HexColor("#D9D9D9");
final HexColor grey_8 = HexColor("#9C9C9C");
final HexColor grey_9 = HexColor("#EAEEF2");
final HexColor darGrey = HexColor("#575757");
final HexColor greySubText = HexColor("#757575");

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
