import 'package:ecommerce_store/view/home/home_view.dart';
import 'package:ecommerce_store/view/view_auth/sign_in.dart';
import 'package:ecommerce_store/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel> {
  ControlView({Key? key}) : super(key: key);
  final controller = Get.put(AuthViewModel());

  // @override
  // Widget build(BuildContext context) {
  //   return GetBuilder<AuthViewModel>(
  //       builder: (_) => _.email == null ? SignIn() : HomeView());
  // }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user != null ? HomeView() : SignIn());
    });
  }
}
