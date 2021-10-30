import 'package:ecommerce_store/constants.dart';
import 'package:ecommerce_store/view/track_order_view.dart';
import 'package:ecommerce_store/view_model/account_view_model.dart';
import 'package:ecommerce_store/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AccountView extends GetWidget<AccountViewModel> {
  AccountView({Key? key}) : super(key: key);
  final controller = Get.put(AccountViewModel());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountViewModel>(
        builder: (cont) => Scaffold(
                body: SafeArea(
                    child: Stack(
              children: [
                Container(
                  child: ListView(
                    children: [
                      Container(
                        height: Get.height * 0.3,
                        margin: EdgeInsets.all(30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              backgroundColor: primaryGreen.withOpacity(0.07),
                              radius: Get.width * (60 / Get.width),
                              child: Icon(
                                Icons.person,
                                size: Get.width * (80 / Get.width),
                                color: primaryGreen,
                              ),
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText(
                                      txt: cont.name.toString(), fontSize: 25),
                                  CustomText(
                                      txt: cont.email.toString(), fontSize: 14)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        child: ListTile(
                          leading: SvgPicture.asset(
                              'assets/svg_icons/notifications.svg'),
                          title:
                              CustomText(txt: 'Notifications'.tr, fontSize: 18),
                          trailing: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => TrackOrder());
                        },
                        child: ListTile(
                          leading: SvgPicture.asset(
                              'assets/svg_icons/track_order.svg'),
                          title:
                              CustomText(txt: 'Track Orders'.tr, fontSize: 18),
                          trailing: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          cont.logOut();
                        },
                        child: ListTile(
                          trailing: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 14,
                            color: Colors.black,
                          ),
                          leading:
                              SvgPicture.asset('assets/svg_icons/logout.svg'),
                          title: CustomText(txt: 'Log Out'.tr, fontSize: 18),
                        ),
                      ),
                      ListTile(
                        title: Text("English"),
                        leading: Radio(
                          value: 'en',
                          groupValue: cont.lang,
                          onChanged: (value) {
                            cont.lang = value.toString();
                            Get.updateLocale(Locale(cont.lang));
                            cont.storeLanguage();
                            cont.update();
                          },
                          activeColor: primaryGreen,
                        ),
                      ),
                      ListTile(
                        title: Text("العربيه"),
                        leading: Radio(
                          value: 'ar',
                          groupValue: cont.lang,
                          onChanged: (value) {
                            cont.lang = value.toString();
                            Get.updateLocale(Locale(cont.lang));
                            cont.storeLanguage();
                            cont.update();
                          },
                          activeColor: primaryGreen,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 250),
                      width: double.infinity,
                      height: controller.isOpend ? 0 : Get.height,
                      color: Colors.white,
                    )),
              ],
            ))));
  }
}
