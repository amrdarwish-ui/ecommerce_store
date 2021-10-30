import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_store/model/order_model.dart';
import 'package:ecommerce_store/view/view_auth/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountViewModel extends GetxController {
  // for animation
  bool isOpend = false;
  // for Account
  String? name = '';
  String? email = '';
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  //for track order
  CollectionReference ordersRef =
      FirebaseFirestore.instance.collection('orders');
  List<OrderModel> odersList = [];
  //for localization
  late String lang = 'en';

  @override
  void onInit() {
    getUserData();
    getLanguage();
    super.onInit();
  }

  void getUserData() {
    name = firebaseAuth.currentUser!.displayName == null
        ? ''
        : firebaseAuth.currentUser!.displayName;
    email = firebaseAuth.currentUser!.email;
  }

  void logOut() async {
    firebaseAuth.signOut().whenComplete(() {
      Get.offAll(SignIn());
    });
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove("email");
  }

  //for tracking order
  Future<void> getOrders() async {
    odersList.clear();
    await ordersRef
        .where('uid', isEqualTo: firebaseAuth.currentUser!.uid)
        .get()
        .then((value) {
      for (QueryDocumentSnapshot i in value.docs) {
        odersList.add(OrderModel.fromMap(i));
      }
    }).whenComplete(() {
      update();
    });
  }

  //for lacalization
  Future<void> storeLanguage() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('lang', lang);
  }

  Future<void> getLanguage() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    lang = preferences.getString('lang').toString();
    update();
  }

// for animation
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
}
