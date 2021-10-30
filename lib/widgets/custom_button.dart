import 'package:ecommerce_store/constants.dart';
import 'package:ecommerce_store/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key, required this.onPressd, required this.txt})
      : super(key: key);

  String txt;
  void Function() onPressd;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressd,
      child: CustomText(
        txt: txt.toUpperCase(),
        fontSize: 14,
        color: Colors.white,
      ),
      style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: primaryGreen,
          fixedSize: Size(
              Get.width * (146 / Get.width), Get.height * (50 / Get.height))),
    );
  }
}
