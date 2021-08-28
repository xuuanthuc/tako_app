import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tako_app/util/common/screen_util.dart';
import 'package:tako_app/util/theme/app_colors.dart';

class ItemBranchOfList extends StatelessWidget {
  ItemBranchOfList(
      {Key? key, this.label, this.image, this.address, this.district, this.ontap})
      : super(key: key);
  String? label;
  String? image;
  String? address;
  String? district;
  VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: width(16), vertical: height(10)),
        child: Container(
          height: height(282),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height(222),
                child: Stack(
                  children: [
                    Container(
                      height: height(222),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(radius(5)),
                          child: Image.network(
                            image!,
                            fit: BoxFit.fitHeight,
                          )),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: height(40),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(radius(5)),
                          color: Colors.black38,

                        ),
                        child: Padding(
                          padding: EdgeInsets.all(height(10)),
                          child: Text('Giờ mở cửa: 8:00 - 22:00',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: size(14),
                              fontWeight: FontWeight.w500,
                              color: white ,
                            ),
                          ),),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: height(10)),
              Text(
                label!,
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: size(16),
                    fontWeight: FontWeight.w700,
                    color: lowBlack,
                  ),
                ),
              ),
              SizedBox(height: height(5)),
              Text(
                '$address, $district',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: size(12),
                    color: lowBlack,
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
