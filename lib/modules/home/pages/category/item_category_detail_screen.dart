import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tako_app/app_pages.dart';
import 'package:tako_app/modules/common/empty_page.dart';
import 'package:tako_app/modules/home/home_controller.dart';
import 'package:tako_app/modules/order/pay_controller.dart';
import 'package:tako_app/util/common/screen_util.dart';
import 'package:tako_app/util/theme/app_colors.dart';

class ItemDetailCategory extends StatelessWidget {
  ItemDetailCategory({Key? key}) : super(key: key);
  final HomeController _homeController = Get.find();
  final PayController _payController = Get.find();

  @override
  Widget build(BuildContext context) {
    var item = _homeController.categoryItem.value;
    _payController.price.value = int.tryParse(item.price!)!;
    _payController.total.value = int.tryParse(item.price!)!;
    _payController.itemImage.value = item.imageUrl!;
    _payController.itemName.value = item.item!;
    _payController.sizeNote.value = '';
    _payController.sugarNote.value = '';
    _payController.toppingNote.value = '';
    _payController.iceNote.value = '';
    return Obx(
      () => Scaffold(
        backgroundColor: white,
        // appBar: appbarDesign('${item.item}'),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: width(414),
                    width: width(414),
                    child: Stack(
                      children: [
                        Container(
                          height: width(414),
                          width: width(414),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30)),
                            child: Image.network(
                              item.imageUrl ?? "",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.all(width(16)),
                            child: Container(
                              decoration: BoxDecoration(
                                color: orange,
                                borderRadius: BorderRadius.circular(size(30)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(width(10)),
                                child: Text(
                                  '${_payController.total.value} đ',
                                  style: GoogleFonts.roboto(
                                      fontSize: size(18),
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: white,
                    height: 10,
                    width: width(414),
                  ),
                  ItemCountWidget(),
                  Container(
                    color: white,
                    width: width(414),
                    padding: EdgeInsets.symmetric(
                        horizontal: width(20), vertical: height(10)),
                    child: Text(
                      '${item.item}',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.roboto(
                          fontSize: size(22),
                          color: lowBlack,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Mô tả:',
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.roboto(
                          fontSize: size(18),
                          color: lowBlack,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  SizedBox(height: height(15)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '${item.description}',
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.roboto(
                          fontSize: size(16),
                          color: lowBlack,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(height: height(15)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Địa chỉ: ',
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.roboto(
                          fontSize: size(18),
                          color: lowBlack,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  SizedBox(height: height(15)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '${item.address}',
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.roboto(
                          fontSize: size(16),
                          color: lowBlack,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(height: height(15)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Lời nhắn cho cửa hàng: ',
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.roboto(
                          fontSize: size(18),
                          color: lowBlack,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  SizedBox(height: height(10)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width(16)),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      onChanged: (value) {
                        _payController.note.value = value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Nhập lời nhắn',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                radius(5),
                              ),
                            ),
                            borderSide:
                                BorderSide(color: greySmall, width: width(1))),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: orange),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height(100)),
                ],
              ),
            ),
            BackButton(),
            OrderButton(),
          ],
        ),
      ),
    );
  }

  Align OrderButton() {
    return Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(width(16)),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                ),
                width: width(414),
                height: height(50),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                  child: ElevatedButton(
                    onPressed: ()=> Get.toNamed(Routes.ORDER),
                    child: Text('Đặt hàng ngay!'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(orange),
                    ),
                  ),
                ),
              ),
            ),
          );
  }

  Positioned BackButton() {
    return Positioned(
      left: width(16),
      top: height(50),
      child: Container(
        height: width(40),
        width: width(40),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: orange),
        child: IconButton(
          onPressed: () => Get.back(),
          padding: EdgeInsets.symmetric(horizontal: 13),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
    );
  }

  Container ItemCountWidget() {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              iconSize: 50,
              onPressed: () => _payController.quality.value > 1
                  ? _payController.subtractQuality()
                  : {},
              color: lowGrey,
              icon: Icon(
                Icons.remove_circle,
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width(30)),
            child: Text(
              _payController.quality.value.toString(),
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontSize: size(25),
                  color: lowBlack,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          IconButton(
            iconSize: 50,
            onPressed: () => _payController.addQuality(),
            icon: Icon(
              Icons.add_circle,
              color: orange,
            ),
          ),
        ],
      ),
    );
  }
}
