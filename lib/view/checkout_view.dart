import 'package:ecommerce_store/view/adderss_body_view.dart';
import 'package:ecommerce_store/view/summary_body_view.dart';
import 'package:ecommerce_store/view_model/cart_view_model.dart';
import 'package:ecommerce_store/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutView extends GetView<CartViewModel> {
  final controller = Get.put(CartViewModel());
  List<Widget> bodyList = [AddressBodyView(), SummaryBodyView()];
  Future<bool> _onWillPop() async {
    return (await Get.defaultDialog(
            title: 'Are you sure?',
            content: Container(),
            actions: [
              TextButton(
                  onPressed: () {
                    Get.back();
                    Get.back();
                  },
                  child: CustomText(txt: 'Yes', fontSize: 16)),
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: CustomText(txt: 'No', fontSize: 16)),
            ])) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      builder: (_) => WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios_sharp,
                  color: Colors.black,
                )),
            title: CustomText(txt: 'order'.tr, fontSize: 18),
          ),
          body: bodyList[controller.checkoutIndex],
        ),
      ),
    );
  }
}
