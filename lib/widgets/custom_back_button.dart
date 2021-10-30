import 'package:ecommerce_store/constants.dart';
import 'package:ecommerce_store/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBackButton extends StatelessWidget {
  CustomBackButton({Key? key, required this.onPressd, required this.txt})
      : super(key: key);

  String txt;
  void Function() onPressd;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(spreadRadius: 1, color: primaryGreen)],
          borderRadius: BorderRadius.circular(5)),
      child: ElevatedButton(
        onPressed: onPressd,
        child: CustomText(
          txt: txt.toUpperCase(),
          fontSize: 14,
          color: Colors.black,
        ),
        style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: Colors.white,
            fixedSize: Size(
                Get.width * (146 / Get.width), Get.height * (50 / Get.height))),
      ),
    );
  }
}
