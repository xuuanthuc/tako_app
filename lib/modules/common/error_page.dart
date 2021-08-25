import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/common/error_model.dart';
import '../../util/constants/locale_keys.dart';

class ErrorPage extends StatelessWidget{

  final ErrorModel error;

  ErrorPage({required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.error.tr)),
      body: Form(
        child: Column(
          children: <Widget>[
            Text(error.code.toString()),
            Text(error.message.toString()),
          ],
        ),
      ),
    );
  }
}