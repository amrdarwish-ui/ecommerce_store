import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  int selectedItem = 0;
  void changeIndex(int index) {
    selectedItem = index;
    update();
  }
}
