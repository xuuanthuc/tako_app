import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tako_app/app_pages.dart';
import 'package:tako_app/modules/authentication/auth_controller.dart';
import 'package:tako_app/modules/common/lazy_load_widget.dart';
import 'package:tako_app/modules/common/widgets/custom_button_design.dart';
import 'package:tako_app/modules/common/widgets/input_decoration_design.dart';
import 'package:tako_app/modules/order/order_page/widgets/order_success.dart';
import 'package:tako_app/modules/order/pay_controller.dart';
import 'package:tako_app/util/common/screen_util.dart';
import 'package:tako_app/util/common/show_toast.dart';
import 'package:tako_app/util/constants/app_image.dart';
import 'package:tako_app/util/theme/app_colors.dart';

class OrderScreen extends StatefulWidget {
  OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final PayController _payController = Get.find();

  final AuthController _authController = Get.find();

  TextEditingController _phoneTextController = TextEditingController();

  TextEditingController _addressTextController = TextEditingController();

  bool orderSuccess = false;

  void order() async {
    var isSuccess = await _payController.order(
      phoneNumber: _phoneTextController.text,
      address: _addressTextController.text,
      nameUser: _authController.user.value.name,
    );
    if (isSuccess == true) {
      setState(() {
        orderSuccess = true;
      });
    } else {
      showToast('Đặt hàng không thành công');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            backgroundColor: white,
            appBar: appbarDesign(),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(width(16)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        headerImage(),
                        SizedBox(
                          height: height(30),
                        ),
                        LabelAddress(),
                        TextField(
                          controller: _addressTextController,
                          decoration: decorTextField('Nhập địa chỉ nhận hàng'),
                        ),
                        SizedBox(
                          height: height(20),
                        ),
                        LabelPhoneNumber(),
                        TextField(
                          controller: _phoneTextController,
                          decoration: decorTextField(
                              'Nhập số điện thoại liên hệ nhận hàng'),
                        ),
                        SizedBox(
                          height: height(60),
                        ),
                        LabelOrder(),
                        SizedBox(
                          height: height(20),
                        ),
                        OrderItemDesgin(),
                        SizedBox(
                          height: height(20),
                        ),
                        DetailInfoOrder(),
                        SizedBox(
                          height: height(29),
                        ),
                        Text(
                          ' Hình thức thanh toán',
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: size(16),
                            color: lowBlack,
                          )),
                        ),
                        SizedBox(
                          height: height(20),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: orange,
                            borderRadius: BorderRadius.circular(radius(5)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: width(30), vertical: height(10)),
                            child: Text(
                              'Tiền mặt',
                              style: TextStyle(
                                fontSize: size(14),
                                color: white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height(90),
                        ),
                      ],
                    ),
                  ),
                ),
                bottomButtonOrder(),
                Visibility(
                  child: LazyLoad(),
                  visible: _payController.isLoading.value,
                ),
              ],
            ),
          ),
          Visibility(visible: orderSuccess ,child: OrderSuccessScreen())

        ],
      ),
    );
  }

  Align bottomButtonOrder() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: height(75),
        color: white,
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                color: orange,
                height: height(75),
                width: double.infinity,
                child: TextButton.icon(
                  onPressed: () => order(),
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: white,
                  ),
                  label: Text(
                    'Đặt hàng',
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontSize: size(18),
                        color: white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container DetailInfoOrder() {
    return Container(
      height: height(170),
      width: double.infinity,
      decoration: BoxDecoration(
        color: greySmall,
        borderRadius: BorderRadius.circular(radius(5)),
      ),
      child: Padding(
        padding: EdgeInsets.all(width(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                detailOrder('Giá sản phẩm'),
                detailOrder('${_payController.price.value}đ'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                detailOrder('Số lượng'),
                detailOrder('x${_payController.quality.value}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                detailOrder('Topping/size....'),
                detailOrder(
                    '${_payController.total.value - _payController.price.value * _payController.quality.value}đ'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tổng thanh toán',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: size(20),
                      color: lowBlack,
                    ),
                  ),
                ),
                Text(
                  '${_payController.total.value}đ',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: size(20),
                      color: lowBlack,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Text detailOrder(String text) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: size(14),
          color: lowBlack,
        ),
      ),
    );
  }

  Container OrderItemDesgin() {
    return Container(
      height: height(70),
      decoration: BoxDecoration(
        color: greySmall,
        borderRadius: BorderRadius.circular(radius(5)),
      ),
      child: Row(
        children: [
          Container(
            height: height(70),
            width: height(70),
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius(5)),
                  bottomLeft: Radius.circular(radius(5)),
                ),
                child: Image.network(
                  _payController.itemImage.value,
                  fit: BoxFit.fill,
                )),
          ),
          SizedBox(width: width(10)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _payController.itemName.value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: size(14),
                    color: lowBlack,
                  )),
                ),
                Text(
                  '${_payController.price.value}đ',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: size(16),
                      color: lowBlack,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: width(50),
            height: height(70),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(radius(5)),
                  bottomRight: Radius.circular(radius(5)),
                ),
                color: HexColor('#DADADA')),
            child: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.close,
                  color: lowBlack,
                )),
          )
        ],
      ),
    );
  }

  Text LabelOrder() {
    return Text(
      'Đơn hàng của bạn',
      style: GoogleFonts.roboto(
        textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: size(14),
          color: lowBlack,
        ),
      ),
    );
  }

  Text LabelPhoneNumber() {
    return Text(
      "Số điện thoại người nhận: ",
      style: GoogleFonts.roboto(
          textStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: size(16),
        color: lowBlack,
      )),
    );
  }

  Text LabelAddress() {
    return Text(
      "Địa chỉ nhận hàng: ",
      style: GoogleFonts.roboto(
          textStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: size(16),
        color: lowBlack,
      )),
    );
  }

  Row headerImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: height(150),
          width: width(230),
          child: Image.asset(
            AppFileName.textfiled_img,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }

  AppBar appbarDesign() {
    return AppBar(
      backgroundColor: white,
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: lowBlack,
          )),
      title: Text(
        'Thanh toán',
        style: GoogleFonts.roboto(
          textStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: size(20),
            color: lowBlack,
          ),
        ),
      ),
    );
  }
}
