import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tako_app/modules/common/widgets/custom_button_design.dart';
import 'package:tako_app/util/common/screen_util.dart';
import 'package:tako_app/util/constants/app_image.dart';
import 'package:tako_app/util/theme/app_colors.dart';
import 'package:get/get.dart';
import '../../../../app_pages.dart';
class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Stack(
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: width(16)),
                  child: Column(
                    children: [
                      Container(
                        height: height(50),
                        color: Colors.transparent,
                      ),
                      Container(
                        height: height(335),
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(radius(5)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: height(132),),
                            Text(
                              'bạn đã đặt hàng\nthành công',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.bungee(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: size(25),
                                  color: orange,
                                ),
                              ),
                            ),
                            SizedBox(height: height(7),),
                            Text('Kiểm tra đơn hàng của bạn trong tài khoản !'),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: width(50), vertical: height(20)),
                              child: CustumButtonDesign(ontap: ()=> Get.back(), label: 'Quay lại'),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: height(157),
                    width: height(157),
                    child: Image.asset(
                      AppFileName.order_success,
                      fit: BoxFit.fill,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
