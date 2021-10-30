import 'package:ecommerce_store/constants.dart';
import 'package:ecommerce_store/helper/db_helper.dart';
import 'package:ecommerce_store/model/cart_pruduct_model.dart';
import 'package:ecommerce_store/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsViewModel extends GetxController {
  bool isFavorite = false;
  late DBHelper dbHelper;
  @override
  void onInit() {
    dbHelper = DBHelper();
    dbHelper.createDatabse();
    super.onInit();
  }

  void favourite() {
    isFavorite = !isFavorite;
  }

  void addToCart(String name, String image, int price) {
    var result = dbHelper.createPruduct(
        CartPruduct(name: name, price: price, image: image, count: 1));
    if (result != null) {
      Get.defaultDialog(title: 'Added', content: Container(), actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: CustomText(
              txt: 'OK',
              fontSize: 16,
              color: primaryGreen,
            ))
      ]);
    }
  }
}
