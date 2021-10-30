import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_store/model/product_model.dart';
import 'package:ecommerce_store/model/category_model.dart';
import 'package:get/get.dart';

class ExploreViewModel extends GetxController {
  bool isOpend = true;
  ExploreViewModel() {
    getCategories();
    getBestSelling();
  }
  List<Category> categoryModelList = [];
  List<Product> bestSillingList = [];
  CollectionReference categryRef =
      FirebaseFirestore.instance.collection('categories');

  CollectionReference bestSeliingRef =
      FirebaseFirestore.instance.collection('best_selling');
  @override
  void getCategories() async {
    print("firee");
    await categryRef.get().then((value) {
      for (QueryDocumentSnapshot i in value.docs) {
        categoryModelList.add(Category.fromMap(i));
      }

      update();
    });
  }

  void refreshData() {
    bestSillingList.clear();
    update();
    getBestSelling();
  }

  void getBestSelling() async {
    print("BestSelling");
    await bestSeliingRef.where('best', isEqualTo: true).get().then((value) {
      for (QueryDocumentSnapshot i in value.docs) {
        bestSillingList.add(Product.fromMap(i));
      }
      update();
    });
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
}
