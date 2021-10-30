import 'package:ecommerce_store/constants.dart';
import 'package:ecommerce_store/view/checkout_view.dart';
import 'package:ecommerce_store/view_model/cart_view_model.dart';
import 'package:ecommerce_store/widgets/custom_button.dart';
import 'package:ecommerce_store/widgets/custom_cart.dart';
import 'package:ecommerce_store/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends GetWidget<CartViewModel> {
  final controller = Get.put(CartViewModel());
  bool del = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
        builder: (count) => Scaffold(
              body: SafeArea(
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        height: Get.height -
                            (Get.height * ((84 + 50) / Get.height)),
                        width: double.infinity,
                        child: count.cartProductList.isEmpty
                            ? Center(
                                child: CustomText(
                                    txt: 'Your cart is empty'.tr, fontSize: 16),
                              )
                            : ListView.builder(
                                itemCount: count.cartProductList.length,
                                itemBuilder: (context, index) {
                                  return CustomCart(
                                      index: index,
                                      id: count.cartProductList[index].id,
                                      pruduct: count.cartProductList[index]);
                                },
                              ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 250),
                          width: double.infinity,
                          height: controller.isOpend ? 0 : Get.height,
                          color: Colors.white,
                        )),
                    Positioned(
                        bottom: 0,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 250),
                          color:
                              controller.isOpend ? Colors.white : primaryGreen,
                          height: controller.isOpend
                              ? Get.height * (84 / Get.height)
                              : Get.height * (50 / Get.height),
                          width:
                              controller.isOpend ? Get.width : Get.width * 0.6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    txt: 'Total'.tr.toUpperCase(),
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  CustomText(
                                    txt: '\$${(count.total).round()}',
                                    fontSize: 18,
                                    color: primaryGreen,
                                    fontWeight: FontWeight.bold,
                                  )
                                ],
                              ),
                              CustomButton(
                                  onPressd: () {
                                    Get.to(() => CheckoutView());
                                  },
                                  txt: 'order'.tr)
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ));
  }
}
