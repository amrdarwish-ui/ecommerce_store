import 'package:ecommerce_store/constants.dart';
import 'package:ecommerce_store/dialogs/dialogs.dart';
import 'package:ecommerce_store/view_model/cart_view_model.dart';
import 'package:ecommerce_store/widgets/custom_back_button.dart';
import 'package:ecommerce_store/widgets/custom_button.dart';
import 'package:ecommerce_store/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SummaryBodyView extends GetWidget<CartViewModel> {
  final controller = Get.put(CartViewModel());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomText(
                    txt: 'Summary'.tr,
                    fontSize: 20,
                    color: primaryGreen,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: Get.height * 0.2,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.cartProductList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(10),
                          height: Get.height * 0.15,
                          width: Get.height * 0.1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: Get.height * 0.1,
                                width: Get.height * 0.1,
                                child: Image.network(
                                    controller.cartProductList[index].image),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              CustomText(
                                txt:
                                    "\$${controller.cartProductList[index].price.toString()}",
                                fontSize: 16,
                                color: primaryGreen,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Divider(
                    height: 0,
                    color: primaryGrey,
                    thickness: 1,
                  ),
                  ListTile(
                    title: CustomText(
                      txt: 'Adderss'.tr,
                      fontSize: 18,
                      color: primaryGreen,
                    ),
                    subtitle: CustomText(txt: controller.adderss, fontSize: 16),
                    trailing: SvgPicture.asset('assets/svg_icons/checked.svg'),
                  ),
                  Divider(
                    height: 0,
                    color: primaryGrey,
                    thickness: 1,
                  ),
                  ListTile(
                    title: CustomText(
                      txt: 'Phone'.tr,
                      fontSize: 18,
                      color: primaryGreen,
                    ),
                    subtitle: CustomText(txt: controller.phone, fontSize: 16),
                    trailing: SvgPicture.asset('assets/svg_icons/checked.svg'),
                  ),
                  Divider(
                    height: 0,
                    color: primaryGrey,
                    thickness: 1,
                  ),
                  ListTile(
                    title: CustomText(
                      txt: 'Total'.tr,
                      fontSize: 18,
                      color: primaryGreen,
                    ),
                    subtitle: CustomText(
                        txt: '\$${controller.total.toString()}', fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomBackButton(
                        onPressd: () {
                          controller.checkoutNvaigate(false);
                        },
                        txt: 'Back'.tr),
                    CustomButton(
                        onPressd: () {
                          showSureDialoge(() {
                            controller.uploudOrder();
                          }, () {
                            Get.back();
                          });
                        },
                        txt: 'Deliver'.tr)
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
