import 'package:ecommerce_store/constants.dart';
import 'package:ecommerce_store/view/category_view.dart';
import 'package:ecommerce_store/view/product_details_view.dart';
import 'package:ecommerce_store/view_model/explore_view_model.dart';
import 'package:ecommerce_store/widgets/custom_catagory.dart';
import 'package:ecommerce_store/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ExploreView extends GetWidget<ExploreViewModel> {
  ExploreView({Key? key}) : super(key: key);
  double h = Get.height;
  double w = Get.width;
  final controller = Get.put(ExploreViewModel());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExploreViewModel>(
        builder: (cont) => Scaffold(
                body: SafeArea(
                    child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: RefreshIndicator(
                onRefresh: () async {
                  cont.refreshData();
                },
                child: Stack(
                  children: [
                    ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Colors.black,
                                    ),
                                    fillColor: Colors.grey[200],
                                    filled: true,
                                    contentPadding: EdgeInsets.all(10),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(50))),
                              ),
                            ),
                            SizedBox(
                              height: h * 0.05,
                            ),
                            CustomText(
                              txt: 'Categories'.tr,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                height: h * 0.15,
                                child: cont.categoryModelList.isEmpty
                                    ? Center(child: CircularProgressIndicator())
                                    : ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            controller.categoryModelList.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              Get.to(CategoryView(
                                                  category: cont
                                                      .categoryModelList[index]
                                                      .name));
                                            },
                                            child: CustomCategory(
                                              imageUrl: cont
                                                  .categoryModelList[index]
                                                  .image,
                                              name: cont
                                                  .categoryModelList[index]
                                                  .name
                                                  .tr,
                                            ),
                                          );
                                        },
                                      )),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  txt: 'Best Selling'.tr,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                GestureDetector(
                                  child: CustomText(
                                    txt: 'See all'.tr,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                height: h * .5,
                                child: cont.bestSillingList.isEmpty
                                    ? Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : ListView.builder(
                                        itemCount: cont.bestSillingList.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                Get.to(ProductDetailsView(
                                                  product: cont
                                                      .bestSillingList[index],
                                                ));
                                              },
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      height: h * 0.3,
                                                      width: w * 0.4,
                                                      child: Image.network(
                                                        '${cont.bestSillingList[index].image}',
                                                        fit: BoxFit.cover,
                                                      )),
                                                  Container(
                                                    width: w * 0.4,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        CustomText(
                                                            txt: cont
                                                                .bestSillingList[
                                                                    index]
                                                                .name,
                                                            fontSize: 16),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        CustomText(
                                                          txt: cont
                                                              .bestSillingList[
                                                                  index]
                                                              .company,
                                                          fontSize: 14,
                                                          color: Colors.grey,
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        CustomText(
                                                          txt:
                                                              '\$${cont.bestSillingList[index].price.toString()}',
                                                          fontSize: 16,
                                                          color: primaryGreen,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      )),
                            Container(
                              height: h * 0.05,
                            )
                          ],
                        ),
                      ],
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
                ),
              ),
            ))));
  }
}
