import 'package:ecommerce_store/constants.dart';
import 'package:ecommerce_store/model/product_model.dart';
import 'package:ecommerce_store/view_model/product_details_view_model.dart';
import 'package:ecommerce_store/widgets/custom_button.dart';
import 'package:ecommerce_store/widgets/custom_slider.dart';
import 'package:ecommerce_store/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProductDetailsView extends GetWidget<ProductDetailsViewModel> {
  ProductDetailsView({
    required this.product,
  }) {
    _wait();
  }
  Product product;
  final controller = Get.put(ProductDetailsViewModel());
  double h = Get.height;
  double w = Get.width;
  bool isOpend = false;
  double starPosition = 10;
  double starHeight = 50;
  Future<void> _wait() async {
    await Future.delayed(Duration(milliseconds: 350));
    isOpend = true;
    print(isOpend);
    controller.update();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsViewModel>(
      builder: (cont) => Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Stack(
                          children: [
                            CustomSlider(
                              h: h,
                              ImageList: product.images,
                            ),
                            AnimatedPositioned(
                                duration: Duration(milliseconds: 300),
                                right: starPosition,
                                top: h * 0.1,
                                bottom: h * 0.1,
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  child: IconButton(
                                      onPressed: () async {
                                        if (cont.isFavorite) {
                                          cont.isFavorite = !cont.isFavorite;
                                          cont.update();
                                        } else {
                                          starPosition = w * 0.4;
                                          starHeight = 100;
                                          cont.update();
                                          cont.isFavorite = !cont.isFavorite;
                                          cont.update();
                                          await Future.delayed(
                                              Duration(milliseconds: 300));
                                          starPosition = 10;
                                          starHeight = 50;
                                          cont.update();
                                        }
                                        print(h);
                                      },
                                      icon: cont.isFavorite
                                          ? Icon(
                                              Icons.star,
                                              color: Colors.yellow[800],
                                            )
                                          : SvgPicture.asset(
                                              "assets/svg_icons/star.svg")),
                                  height: starHeight,
                                  width: starHeight,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                )),
                            Positioned(
                                left: 0,
                                top: h * 0.1,
                                bottom: h * 0.1,
                                child: IconButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: Icon(Icons.arrow_back_ios_sharp))),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5),
                        child: CustomText(
                          txt: '${product.name}',
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: h * 0.025,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: w * (160 / w),
                            height: h * (40 / h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(txt: 'Size'.tr, fontSize: 14),
                                CustomText(
                                  txt: 'XL',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(spreadRadius: 1, color: primaryGrey)
                                ]),
                          ),
                          Container(
                            width: w * (160 / w),
                            height: h * (40 / h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(txt: 'Color'.tr, fontSize: 14),
                                Container(
                                  height: 22,
                                  width: 22,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Color(
                                          int.parse("0xff${product.color}"))),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(spreadRadius: 1, color: primaryGrey)
                                ]),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: CustomText(
                          txt: 'Details'.tr,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: CustomText(
                            txt: '''${product.details}''', fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 350),
                    color: !isOpend
                        ? Color(int.parse("0xff${product.color}"))
                        : Colors.white,
                    height: !isOpend ? h : h * (84 / h),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              txt: 'Price'.tr,
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            CustomText(
                              txt: '\$${product.price}',
                              fontSize: 18,
                              color: primaryGreen,
                              fontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                        CustomButton(
                            onPressd: () {
                              cont.addToCart(product.name, product.image,
                                  product.price.toInt());
                            },
                            txt: 'add'.tr)
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
