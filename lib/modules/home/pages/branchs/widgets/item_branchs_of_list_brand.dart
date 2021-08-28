

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemBranchOfList extends StatelessWidget {
  ItemBranchOfList({Key? key, this.label}) : super(key: key);
  String? label;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(label!),
    );
  }
}
