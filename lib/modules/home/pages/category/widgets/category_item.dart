import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tako_app/util/common/screen_util.dart';
import 'package:tako_app/util/theme/app_colors.dart';

class ItemCategory extends StatelessWidget {
  ItemCategory(
      {Key? key,
      required this.title,
      required this.ontap,
      required this.description,
      required this.address,
      required this.price,
      required this.imageUrl})
      : super(key: key);
  String title;
  String imageUrl;
  String description;
  String price;
  String address;
  VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width(16)),
        child: Container(
            height: height(88),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius(5)),
              color: HexColor('#F0F0F0'),
            ),
            child: Row(
              children: [
                Container(
                  height: height(88),
                  width: height(88),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(radius(5)),
                      bottomLeft: Radius.circular(
                        radius(5),
                      ),
                    ),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: width(10),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${title}',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                            fontSize: size(14),
                            color: lowBlack,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: height(7),),
                      Text(
                        '${description == "" ? '${price} đ' : description}',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                            fontSize: size(12),
                            color: lowBlack,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: height(10),),

                      Text(
                        '${address}',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                            fontSize: size(12),
                            color: lowBlack,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: width(15),),
                Container(
                  height: height(25),
                  width: height(25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: white,
                  ),
                  child: IconButton(icon: Icon(Icons.arrow_forward_ios_rounded),iconSize: 10, color: lowBlack, onPressed: ontap,),
                ),
                SizedBox(width: width(15),),
              ],
            )),
      ),
    );
  }
}
