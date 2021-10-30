import 'package:ecommerce_store/view/account_view.dart';
import 'package:ecommerce_store/view/cart_view.dart';
import 'package:ecommerce_store/view/explore_view.dart';
import 'package:ecommerce_store/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeView extends GetWidget<HomeViewModel> {
  HomeView({Key? key}) : super(key: key);
  final controller = Get.put(HomeViewModel());
  CartView cartView = CartView();
  ExploreView exploreView = ExploreView();
  AccountView accountView = AccountView();

  List<Widget> bodyList = [ExploreView(), CartView(), AccountView()];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (_) => Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: controller.selectedItem,
              onTap: (index) {
                controller.changeIndex(index);
                if (index == 1) {
                  cartView.controller.getAllToCart();
                  cartView.controller.calcTotal();
                  cartView.controller.animate();
                } else {
                  cartView.controller.unAnimate();
                }
                if (index == 0) {
                  exploreView.controller.animate();
                  if (exploreView.controller.isOpend) {
                    exploreView.controller.refreshData();
                  }
                } else {
                  exploreView.controller.unAnimate();
                }
                if (index == 2) {
                  accountView.controller.animate();
                } else {
                  accountView.controller.unAnimate();
                }
              },
              items: [
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset("assets/svg_txts/explore.svg"),
                    icon: SvgPicture.asset("assets/svg_icons/explore.svg"),
                    label: 'explore'),
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset("assets/svg_txts/cart.svg"),
                    icon: SvgPicture.asset("assets/svg_icons/cart.svg"),
                    label: 'cart'),
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset("assets/svg_txts/account.svg"),
                    icon: SvgPicture.asset("assets/svg_icons/profile.svg"),
                    label: 'profile')
              ]),
          body: bodyList[controller.selectedItem]),
    );
  }
}
