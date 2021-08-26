import 'package:flutter/material.dart';
import 'package:tako_app/app_pages.dart';
import 'package:tako_app/util/common/screen_util.dart';
import 'package:tako_app/util/theme/app_colors.dart';
import 'package:get/get.dart';
class EffectScreen extends StatefulWidget {
  EffectScreen({Key? key}) : super(key: key);

  @override
  _EffectScreenState createState() => _EffectScreenState();
}

class _EffectScreenState extends State<EffectScreen> {
  int i = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startEffect();
  }

  Future<void> startEffect() async {
    for(var index = i; index <= 8; index++){
      await Future.delayed(Duration(milliseconds: 500));
      setState(() {
        i = index;
      });
    }
    Get.offAllNamed(Routes.HOME);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: width(110),
              width: width(110),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Padding(
                padding:  EdgeInsets.all(width(30)),
                child: Image.asset("assets/images/effects/d$i.png"),
              ),
            ),
            SizedBox(height: height(250)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: width(8),
                  width: width(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: i%2 ==0 ? white : Colors.white24,
                  ),
                ),
                SizedBox(width: width(13)),
                Container(
                  height: width(8),
                  width: width(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: i%2 == 1 ? white : Colors.white24,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
