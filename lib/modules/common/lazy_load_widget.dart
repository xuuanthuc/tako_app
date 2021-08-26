

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tako_app/util/theme/app_colors.dart';

Widget LazyLoad() {
  return Center(
    child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(orange),
    ),
  );
}