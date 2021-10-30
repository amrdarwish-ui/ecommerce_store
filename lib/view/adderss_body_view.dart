import 'package:ecommerce_store/constants.dart';
import 'package:ecommerce_store/view_model/cart_view_model.dart';
import 'package:ecommerce_store/widgets/custom_button.dart';
import 'package:ecommerce_store/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressBodyView extends GetWidget<CartViewModel> {
  final controller = Get.put(CartViewModel());
  TextEditingController streetController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  AddressBodyView() {
    if (controller.adderss != '') {
      stateController.text = controller.state;
      streetController.text = controller.street;
      cityController.text = controller.city;
      phoneController.text = controller.phone;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              height: Get.height,
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    txt: 'Adderss'.tr,
                    fontSize: 20,
                    color: primaryGreen,
                    align: TextAlign.center,
                  ),
                  Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          CustomText(
                            txt: 'street'.tr,
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: streetController,
                            onChanged: (val) {
                              controller.street = val;
                            },
                            decoration: InputDecoration(
                                hintText: '22, Alharam St',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: primaryGreen))),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomText(
                            txt: 'City'.tr,
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: cityController,
                            onChanged: (value) {
                              controller.city = value;
                            },
                            decoration: InputDecoration(
                                hintText: 'Giza',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: primaryGreen))),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomText(
                            txt: 'State'.tr,
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: stateController,
                            onChanged: (value) {
                              controller.state = value;
                            },
                            decoration: InputDecoration(
                                hintText: 'Giza state',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: primaryGreen))),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomText(
                            txt: 'Phone'.tr,
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            onChanged: (value) {
                              controller.phone = value;
                            },
                            decoration: InputDecoration(
                                hintText: '011151568',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: primaryGreen))),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ],
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
                    Container(
                      width: Get.width * (146 / Get.width),
                    ),
                    CustomButton(
                        onPressd: () {
                          controller.addressSubmit();
                          controller.checkoutNvaigate(true);
                        },
                        txt: 'next'.tr)
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
