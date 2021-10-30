import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_store/model/product_model.dart';
import 'package:get/get.dart';

class CategoryViewModel extends GetxController {
  bool notFound = false;
  CollectionReference prpductRef =
      FirebaseFirestore.instance.collection('best_selling');
  List<Product> pruductList = [];

  getPruducts(String category) async {
    if (pruductList.isNotEmpty) {
      pruductList.clear();
    }
    await prpductRef.where('category', isEqualTo: category).get().then((value) {
      if (value.docs.isEmpty) {
        notFound = true;
      } else {
        notFound = false;
      }
      for (QueryDocumentSnapshot i in value.docs) {
        pruductList.add(Product.fromMap(i));
      }
      update();
    });
  }
}
