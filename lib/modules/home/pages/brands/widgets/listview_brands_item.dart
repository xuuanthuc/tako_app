import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tako_app/util/common/screen_util.dart';
import 'package:tako_app/util/theme/app_colors.dart';

class BrandItem extends StatelessWidget {
  BrandItem({Key? key, this.label, this.image, this.ontap}) : super(key: key);
  String? label;
  String? image;
  VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(height(16)),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: height(222),
          child: Stack(
            children: [
              Container(
                height: height(222),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      radius(5),
                    ),
                    child: Image.network(
                      image!,
                      fit: BoxFit.fitHeight,
                    )),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(radius(5)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(height(12)),
                    child: Text(label!, textAlign: TextAlign.center ,style: GoogleFonts.bungee(
                    textStyle: TextStyle(fontSize: 16, color: white),
                ),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
