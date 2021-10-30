import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_store/dialogs/dialogs.dart';
import 'package:ecommerce_store/helper/db_helper.dart';
import 'package:ecommerce_store/model/cart_pruduct_model.dart';
import 'package:ecommerce_store/model/order_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  //for checkout
  String adderss = '';
  String phone = '';
  String street = '';
  String city = '';
  String state = '';
  int checkoutIndex = 0;
  CollectionReference ordersRef =
      FirebaseFirestore.instance.collection('orders');
  String uid = FirebaseAuth.instance.currentUser!.uid;
  //for animation
  bool isOpend = false;
  //for cart
  double total = 0;

  List<CartPruduct> cartProductList = [];

  late DBHelper dbHelper;
  @override
  void onInit() {
    dbHelper = DBHelper();
    dbHelper.createDatabse();

    super.onInit();
  }

  void deleteProduct(int? id) {
    dbHelper.delete(id!);
    update();
  }

  void getAllToCart() async {
    if (cartProductList.isNotEmpty) {
      cartProductList.clear();
    }
    await dbHelper.allPruducts().then((value) {
      for (var i in value) {
        cartProductList.add(CartPruduct.fromMap(i));
      }
      update();
    });
  }

  double calcTotal() {
    dbHelper.allPruducts().then((value) {
      total = 0;
      value.forEach((element) {
        total = total +
            (int.parse(element['price'].toString()) *
                int.parse(element['count'].toString()));
      });
      update();
    });

    return total;
  }

  void increment(int index) {
    cartProductList[index].count++;
    dbHelper.update(cartProductList[index]).then((value) {
      calcTotal();
    });
  }

  void decrease(int index) {
    if (cartProductList[index].count != 1) {
      cartProductList[index].count--;
      dbHelper.update(cartProductList[index]).then((value) {
        calcTotal();
      });
    }
  }

  Future<void> animate() async {
    await Future.delayed(Duration(milliseconds: 50));
    isOpend = true;
    print(isOpend);
    update();
  }

  void unAnimate() {
    isOpend = false;
    update();
  }

  // for checkout
  void checkoutNvaigate(bool isNext) {
    if (isNext) {
      checkoutIndex++;
      print(checkoutIndex);
    } else {
      checkoutIndex--;
    }
    update();
  }

  void addressSubmit() {
    adderss = '$street , $city , $state';
  }

  Future<void> uploudOrder() async {
    Get.back();
    if (cartProductList.isNotEmpty) {
      showIndecatorDialoge();
      List<Map> list = [];
      for (var i in cartProductList) {
        list.add(i.toMap());
      }
      OrderModel orderModel = OrderModel(
          uid: uid,
          isDeliverd: false,
          address: adderss,
          phone: phone,
          total: total,
          orders: list);
      try {
        await ordersRef.doc().set(orderModel.toMap()).whenComplete(() {
          dbHelper.claerTable();
          total = 0;
          cartProductList.clear();
          Get.back();
          Get.back();
          update();
          Get.snackbar('uploud order ', 'done',
              snackPosition: SnackPosition.BOTTOM);
        });
      } catch (e) {
        Get.back();
        Get.snackbar('uploud order ', 'erorr',
            snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      Get.snackbar('erorr', 'Your cart is empty',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
