import 'package:ecommerce_store/languages/controll_language.dart';
import 'package:ecommerce_store/view_model/account_view_model.dart';
import 'package:ecommerce_store/view_model/auth_view_model.dart';
import 'package:ecommerce_store/view_model/cart_view_model.dart';
import 'package:ecommerce_store/view_model/category_view_model.dart';
import 'package:ecommerce_store/view_model/explore_view_model.dart';
import 'package:ecommerce_store/view_model/home_view_model.dart';
import 'package:ecommerce_store/view_model/product_details_view_model.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => ExploreViewModel());
    Get.lazyPut(() => AccountViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => ProductDetailsViewModel());
    Get.lazyPut(() => CategoryViewModel());
    Get.lazyPut(() => LanguageControll());
  }
}
