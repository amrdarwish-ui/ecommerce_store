import 'package:ecommerce_store/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSureDialoge(yes, no) {
  Get.defaultDialog(title: 'Are you sure?', content: Container(), actions: [
    TextButton(onPressed: yes, child: CustomText(txt: 'Yes', fontSize: 16)),
    TextButton(onPressed: no, child: CustomText(txt: 'No', fontSize: 16)),
  ]);
}

void showIndecatorDialoge() {
  Get.defaultDialog(
      title: '',
      content: Row(
        children: [
          CircularProgressIndicator(),
          SizedBox(
            width: 10,
          ),
          CustomText(txt: 'wait', fontSize: 16)
        ],
      ),
      barrierDismissible: false);
}
