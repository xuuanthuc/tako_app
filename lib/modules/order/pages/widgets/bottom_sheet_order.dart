import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tako_app/modules/common/lazy_load_widget.dart';
import 'package:tako_app/util/common/screen_util.dart';
import 'package:tako_app/util/constants/locale_keys.dart';
import 'package:tako_app/util/theme/app_colors.dart';
import 'package:get/get.dart';

import '../../../../app_pages.dart';
import '../../pay_controller.dart';

enum SizeOption { sizeM, sizeL }
enum SugarOption { p100, p70, p50, p30 }
enum IceOption { p100, p70, p50, p30 }
enum Topping { pearl, coconutJelly, grassJelly, creamMousse, whitePearl }

class bottomSheetOrder extends StatefulWidget {
  bottomSheetOrder(
      {Key? key,
      required this.itemImage,
      required this.itemPrice,
      required this.itemName,
      required this.type,
      required this.ontap})
      : super(key: key);
  VoidCallback ontap;
  String itemName;
  String itemImage;
  String itemPrice;
  String type;

  @override
  _bottomSheetOrderState createState() => _bottomSheetOrderState();
}

class _bottomSheetOrderState extends State<bottomSheetOrder> {
  SizeOption? sizeCharacter = SizeOption.sizeM;
  SugarOption? sugarCharacter = SugarOption.p100;
  IceOption? iceCharacter = IceOption.p100;
  Topping? toppingChar;

  final PayController _payController = Get.put(PayController());

  void selectSize(SizeOption? value) {
    if (value == SizeOption.sizeM) {
      _payController.sizeNote.value = LocaleKeys.size_M;
    } else {
      _payController.sizeNote.value = LocaleKeys.size_L;
    }
  }

  void selectSugar(SugarOption? value) {
    if (value == SugarOption.p100) {
      _payController.sugarNote.value = LocaleKeys.sugar100;
    } else if (value == SugarOption.p70) {
      _payController.sugarNote.value = LocaleKeys.sugar70;
    } else if (value == SugarOption.p50) {
      _payController.sugarNote.value = LocaleKeys.sugar50;
    } else if (value == SugarOption.p30) {
      _payController.sugarNote.value = LocaleKeys.sugar30;
    }
  }

  void selectIce(IceOption? value) {
    if (value == IceOption.p100) {
      _payController.iceNote.value = LocaleKeys.ice100;
    } else if (value == IceOption.p70) {
      _payController.iceNote.value = LocaleKeys.ice70;
    } else if (value == IceOption.p50) {
      _payController.iceNote.value = LocaleKeys.ice50;
    } else if (value == IceOption.p30) {
      _payController.iceNote.value = LocaleKeys.ice30;
    }
  }

  void selectTopping(Topping? value) {
    if (value == Topping.pearl) {
      _payController.toppingNote.value = LocaleKeys.pearl;
    } else if (value == Topping.whitePearl) {
      _payController.toppingNote.value = LocaleKeys.whitePearl;
    } else if (value == Topping.coconutJelly) {
      _payController.toppingNote.value = LocaleKeys.coconutJelly;
    } else if (value == Topping.grassJelly) {
      _payController.toppingNote.value = LocaleKeys.grassJelly;
    } else if (value == Topping.creamMousse) {
      _payController.toppingNote.value = LocaleKeys.mousses;
    }
  }

  void orderNow() async {
    await _payController.orderNow();
    Get.toNamed(Routes.ORDER);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _payController.price.value = int.tryParse(widget.itemPrice)!;
    _payController.total.value = int.tryParse(widget.itemPrice)!;
    _payController.itemImage.value = widget.itemImage;
    _payController.itemName.value = widget.itemName;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(radius(30)),
            topLeft: Radius.circular(radius(30)),
          ),
          child: Container(
            height: height(700),
            color: white,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ImageDetail(),
                      ItemNameWidget(),
                      ItemPriceWidget(),
                      Container(
                        color: white,
                        height: height(20),
                      ),
                      ItemCountWidget(),
                      //Chọn size
                      Visibility(
                        visible: widget.type == LocaleKeys.coffee ? true : false || widget.type == LocaleKeys.milkTea ? true :false,
                        child: Container(
                          color: white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              labelTextSelectOption('Chọn Size'),
                              Column(
                                children: [
                                  ListTile(
                                    title: textOptionSelect('Size M'),
                                    leading: Radio<SizeOption>(
                                      activeColor: orange,
                                      value: SizeOption.sizeM,
                                      groupValue: sizeCharacter,
                                      onChanged: (SizeOption? value) {
                                        setState(() {
                                          sizeCharacter = value;
                                          selectSize(sizeCharacter);
                                        });
                                      },
                                    ),
                                    trailing: textOptionSelect('0đ'),
                                  ),
                                  ListTile(
                                    title: textOptionSelect('Size L'),
                                    leading: Radio<SizeOption>(
                                      activeColor: orange,
                                      value: SizeOption.sizeL,
                                      groupValue: sizeCharacter,
                                      onChanged: (SizeOption? value) {
                                        setState(() {
                                          sizeCharacter = value;
                                          selectSize(sizeCharacter);
                                        });
                                      },
                                    ),
                                    trailing: textOptionSelect('6,000đ'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      //Chọn đường
                      Visibility(
                        visible: widget.type == LocaleKeys.milkTea ? true :false,
                        child: Container(
                          color: white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              labelTextSelectOption('Chọn đường'),
                              Column(
                                children: [
                                  ListTile(
                                    title: textOptionSelect('100% đường'),
                                    leading: Radio<SugarOption>(
                                      activeColor: orange,
                                      value: SugarOption.p100,
                                      groupValue: sugarCharacter,
                                      onChanged: (SugarOption? value) {
                                        setState(() {
                                          sugarCharacter = value;
                                          print(value);
                                          selectSugar(sugarCharacter);
                                        });
                                      },
                                    ),
                                    trailing: textOptionSelect('0đ'),
                                  ),
                                  ListTile(
                                    title: textOptionSelect('70% đường'),
                                    leading: Radio<SugarOption>(
                                      activeColor: orange,
                                      value: SugarOption.p70,
                                      groupValue: sugarCharacter,
                                      onChanged: (SugarOption? value) {
                                        setState(() {
                                          sugarCharacter = value;
                                          selectSugar(sugarCharacter);
                                        });
                                      },
                                    ),
                                    trailing: textOptionSelect('0đ'),
                                  ),
                                  ListTile(
                                    title: textOptionSelect('50% đường'),
                                    leading: Radio<SugarOption>(
                                      activeColor: orange,
                                      value: SugarOption.p50,
                                      groupValue: sugarCharacter,
                                      onChanged: (SugarOption? value) {
                                        setState(() {
                                          sugarCharacter = value;
                                          selectSugar(sugarCharacter);
                                        });
                                      },
                                    ),
                                    trailing: textOptionSelect('0đ'),
                                  ),
                                  ListTile(
                                    title: textOptionSelect('30% đường'),
                                    leading: Radio<SugarOption>(
                                      activeColor: orange,
                                      value: SugarOption.p30,
                                      groupValue: sugarCharacter,
                                      onChanged: (SugarOption? value) {
                                        setState(() {
                                          sugarCharacter = value;
                                          selectSugar(sugarCharacter);
                                        });
                                      },
                                    ),
                                    trailing: textOptionSelect('0đ'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      //Chọn đá
                      Visibility(
                        visible: widget.type == LocaleKeys.milkTea ? true :false,
                        child: Container(
                          color: white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              labelTextSelectOption('Chọn đá'),
                              Column(
                                children: [
                                  ListTile(
                                    title: textOptionSelect('100% đá'),
                                    leading: Radio<IceOption>(
                                      activeColor: orange,
                                      value: IceOption.p100,
                                      groupValue: iceCharacter,
                                      onChanged: (IceOption? value) {
                                        setState(() {
                                          iceCharacter = value;
                                          selectIce(iceCharacter);
                                        });
                                      },
                                    ),
                                    trailing: textOptionSelect('0đ'),
                                  ),
                                  ListTile(
                                    title: textOptionSelect('70% đá'),
                                    leading: Radio<IceOption>(
                                      activeColor: orange,
                                      value: IceOption.p70,
                                      groupValue: iceCharacter,
                                      onChanged: (IceOption? value) {
                                        setState(() {
                                          iceCharacter = value;
                                          selectIce(iceCharacter);
                                        });
                                      },
                                    ),
                                    trailing: textOptionSelect('0đ'),
                                  ),
                                  ListTile(
                                    title: textOptionSelect('50% đá'),
                                    leading: Radio<IceOption>(
                                      activeColor: orange,
                                      value: IceOption.p50,
                                      groupValue: iceCharacter,
                                      onChanged: (IceOption? value) {
                                        setState(() {
                                          iceCharacter = value;
                                          selectIce(iceCharacter);
                                        });
                                      },
                                    ),
                                    trailing: textOptionSelect('0đ'),
                                  ),
                                  ListTile(
                                    title: textOptionSelect('30% đá'),
                                    leading: Radio<IceOption>(
                                      activeColor: orange,
                                      value: IceOption.p30,
                                      groupValue: iceCharacter,
                                      onChanged: (IceOption? value) {
                                        setState(() {
                                          iceCharacter = value;
                                          selectIce(iceCharacter);
                                        });
                                      },
                                    ),
                                    trailing: textOptionSelect('0đ'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      //Chọn topping
                      Visibility(
                        visible: widget.type == LocaleKeys.milkTea ? true :false,
                        child: Container(
                          color: white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              labelTextSelectOption('Chọn topping'),
                              Column(
                                children: [
                                  ListTile(
                                    title: textOptionSelect('Trân Châu'),
                                    leading: Radio<Topping>(
                                      activeColor: orange,
                                      value: Topping.pearl,
                                      groupValue: toppingChar,
                                      onChanged: (Topping? value) {
                                        setState(() {
                                          toppingChar = value;
                                          selectTopping(toppingChar);
                                        });
                                      },
                                    ),
                                    trailing: textOptionSelect('5,000đ'),
                                  ),
                                  ListTile(
                                    title: textOptionSelect('Thạch dừa'),
                                    leading: Radio<Topping>(
                                      activeColor: orange,
                                      value: Topping.coconutJelly,
                                      groupValue: toppingChar,
                                      onChanged: (Topping? value) {
                                        setState(() {
                                          toppingChar = value;
                                          selectTopping(toppingChar);
                                        });
                                      },
                                    ),
                                    trailing: textOptionSelect('5,000đ'),
                                  ),
                                  ListTile(
                                    title: textOptionSelect('Thạch rau câu'),
                                    leading: Radio<Topping>(
                                      activeColor: orange,
                                      value: Topping.grassJelly,
                                      groupValue: toppingChar,
                                      onChanged: (Topping? value) {
                                        setState(() {
                                          toppingChar = value;
                                          selectTopping(toppingChar);
                                        });
                                      },
                                    ),
                                    trailing: textOptionSelect('5,000đ'),
                                  ),
                                  ListTile(
                                    title: textOptionSelect('Kem Mousses'),
                                    leading: Radio<Topping>(
                                      activeColor: orange,
                                      value: Topping.creamMousse,
                                      groupValue: toppingChar,
                                      onChanged: (Topping? value) {
                                        setState(() {
                                          toppingChar = value;
                                          selectTopping(toppingChar);
                                        });
                                      },
                                    ),
                                    trailing: textOptionSelect('8,000đ'),
                                  ),
                                  ListTile(
                                    title: textOptionSelect('Trân châu trắng'),
                                    leading: Radio<Topping>(
                                      activeColor: orange,
                                      value: Topping.whitePearl,
                                      groupValue: toppingChar,
                                      onChanged: (Topping? value) {
                                        setState(() {
                                          toppingChar = value;
                                          selectTopping(toppingChar);
                                        });
                                      },
                                    ),
                                    trailing: textOptionSelect('8,000đ'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      labelTextSelectOption('Lời nhắn cho cửa hàng'),
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
                                borderSide: BorderSide(
                                    color: greySmall, width: width(1))),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: orange),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height(120),
                      ),
                    ],
                  ),
                ),
                bottomButtonOrder(),
                Align(
                    alignment: Alignment.topCenter,
                    child: IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(
                          Icons.arrow_drop_down_circle_rounded,
                          color: white,
                        ))),
                Visibility(
                  child: LazyLoad(),
                  visible: _payController.isLoading.value,
                ),
              ],
            ),
          ),
        ));
  }

  Align bottomButtonOrder() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: height(90),
        color: white,
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Tổng tiền:',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: size(16),
                          color: lowGrey,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Text(
                      '${_payController.total.value}đ',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: size(25),
                          color: lowBlack,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                color: orange,
                height: height(90),
                width: double.infinity,
                child: TextButton.icon(
                  onPressed: () => orderNow(),
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: white,
                  ),
                  label: Text(
                    'Đặt ngay',
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

  Text textOptionSelect(String option) => Text(
        option,
        style: GoogleFonts.roboto(
          textStyle: TextStyle(
            fontSize: size(14),
            color: lowBlack,
            fontWeight: FontWeight.w500,
          ),
        ),
      );

  Widget labelTextSelectOption(String label) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: width(16), vertical: height(20)),
      child: Text(
        label,
        style: GoogleFonts.roboto(
          textStyle: TextStyle(
            fontSize: size(16),
            color: lowBlack,
            fontWeight: FontWeight.w700,
          ),
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

  Container ItemPriceWidget() {
    return Container(
      color: white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '${widget.itemPrice}đ',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontSize: size(16),
                  color: orange,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container ItemNameWidget() {
    return Container(
      color: white,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: width(16), vertical: height(20)),
        child: Text(
          widget.itemName,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontSize: size(20),
              color: lowBlack,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  Container ImageDetail() {
    return Container(
      width: width(415),
      height: height(305),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(radius(30)),
          topLeft: Radius.circular(radius(30)),
        ),
        child: Image.network(
          widget.itemImage,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
