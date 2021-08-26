import 'package:fluttertoast/fluttertoast.dart';
import 'package:tako_app/util/theme/app_colors.dart';
import 'package:flutter/material.dart';
  void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: lowOrange,
        textColor: Colors.black,
        fontSize: 16.0,
    );
  }
