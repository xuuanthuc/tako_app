import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tako_app/app_pages.dart';
import 'package:tako_app/modules/common/widgets/custom_button_design.dart';
import 'package:tako_app/util/common/screen_util.dart';
import 'package:tako_app/util/constants/app_image.dart';
import 'package:tako_app/util/theme/app_colors.dart';

class FirstIntroScreen extends StatefulWidget {
  const FirstIntroScreen({Key? key}) : super(key: key);

  @override
  _FirstIntroScreenState createState() => _FirstIntroScreenState();
}

class _FirstIntroScreenState extends State<FirstIntroScreen> {
  double paddingLeftprogressSlider = 30; //+70.5
  double progressSliderWidth = 70.5;
  String label = 'đặc biệt\ntrên tako';
  String labelButton = "khám phá thêm";
  String description = 'Thưởng thức hàng nghìn món ngon với nhiều ưu đãi khủng chỉ có trên TAKO';
  String image = AppFileName.intro_1;

  int flag = 1;


  Future<void> nextIntro() async {
    if(flag == 1){
      flag = 2;
      print(flag);
      for (double i = paddingLeftprogressSlider; i <= 70; i = i + 2){
        await Future.delayed(Duration(milliseconds: 5));
        setState(() {
          paddingLeftprogressSlider = i;
          progressSliderWidth = i + 80;
          if(paddingLeftprogressSlider == 70){
            image = AppFileName.intro_2;
            label = 'Ân uống\nmọi lúc';
            labelButton =  "Tiếp theo";
            description = 'Cập nhật thông tin khuyến mãi khủng cùng nhiều món ngon hấp dẫn';
          }
        });
      }
    } else if(flag == 2){
      flag = 3;
      for (double i = paddingLeftprogressSlider; i <= 140; i = i + 2){
        await Future.delayed(Duration(milliseconds: 5));
        setState(() {
          paddingLeftprogressSlider = i;
          progressSliderWidth = i + 80;
          if(paddingLeftprogressSlider == 130){
            image = AppFileName.intro_3;
            label = 'Đặt hàng\nmọi nơi';
            labelButton =  "Tiếp theo";
            description = 'Đặt hàng món ăn, đồ uống... với các chương trình ưu đãi diễn ra thường xuyên';
          }
        });
      }
    } else if(flag == 3){
      flag = 4;
      for (double i = paddingLeftprogressSlider; i <= 205; i = i + 2){
        await Future.delayed(Duration(milliseconds: 5));
        setState(() {
          paddingLeftprogressSlider = i;
          progressSliderWidth = i + 80;
          if(paddingLeftprogressSlider == 170){
            image = AppFileName.intro_4;
            label = 'Sẵn sàng\nkhởi hành';
            labelButton =  "Đăng kí/đăng nhập";
            description = 'Cùng khám phá nhé!\nĐăng kí ngay thôi nào!';
          }
        });
      }
    }  else if (flag == 4) {
      Get.offAllNamed(Routes.AUTH);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: height(20)),
            contentImage(image: image),
            SizedBox(height: height(40)),
            labelContent(label: label),
            SizedBox(height: height(10)),
            labelContentDescription(
                description: description),
            SizedBox(height: height(80)),
            progressSliderCustom(),
            SizedBox(height: height(50)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width(65)),
              child: CustumButtonDesign(
                ontap: () => nextIntro(),
                label: labelButton,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget progressSliderCustom() {
    return Container(
      height: 65,
      width: width(282),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: height(20),
              width: width(282),
              decoration: BoxDecoration(
                  color: greySmall, borderRadius: BorderRadius.circular(50)),
            ),
          ),
          Positioned(
            left: width(0),
            bottom: height(0),
            child: Container(
              height: height(20),
              width: width(progressSliderWidth),
              decoration: BoxDecoration(
                  color: lowOrange, borderRadius: BorderRadius.circular(50)),
            ),
          ),
          Positioned(
            left: width(paddingLeftprogressSlider),
            bottom: height(10),
            child: Container(
              height: height(49),
              width: width(68),
              child: Image.asset(AppFileName.rider),
            ),
          ),
        ],
      ),
    );
  }

  Widget contentImage({required String image}) {
    return Container(
      padding:
          EdgeInsets.only(left: width(30), right: width(30), bottom: width(35)),
      height: width(246),
      width: width(246),
      decoration: BoxDecoration(
        color: lowOrange,
        borderRadius: BorderRadius.circular(1000),
      ),
      child: Image.asset(image),
    );
  }

  Widget labelContent({required String label}) {
    return Text(
      label,
      textAlign: TextAlign.center,
      style: GoogleFonts.bungee(
        textStyle: TextStyle(
          height: 1.4,
          fontSize: size(40),
          color: lowBlack,
        ),
      ),
    );
  }

  Widget labelContentDescription({required String description}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width(65)),
      child: Text(
        description,
        textAlign: TextAlign.center,
        style: GoogleFonts.roboto(
          textStyle: TextStyle(
            height: 1.4,
            fontSize: size(14),
            color: lowBlack,
          ),
        ),
      ),
    );
  }
}
