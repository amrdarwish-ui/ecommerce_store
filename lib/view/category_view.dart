import 'package:ecommerce_store/constants.dart';
import 'package:ecommerce_store/view/product_details_view.dart';
import 'package:ecommerce_store/view_model/category_view_model.dart';
import 'package:ecommerce_store/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class CategoryView extends GetView<CategoryViewModel> {
  CategoryView({required this.category}) {
    controller.getPruducts(category);
  }
  final controller = Get.put(CategoryViewModel());
  String category;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryViewModel>(
        builder: (cont) => Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_sharp,
                    color: Colors.black,
                  )),
              title: CustomText(txt: category.tr, fontSize: 18),
            ),
            body: Container(
              child: cont.notFound
                  ? Center(
                      child:
                          CustomText(txt: 'nothing to show'.tr, fontSize: 16),
                    )
                  : cont.pruductList.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(15),
                          child: GridView.builder(
                            itemCount: cont.pruductList.length,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: Get.width * 0.45,
                                    mainAxisExtent: Get.height * 0.4,
                                    // childAspectRatio: 3 / 2,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                            itemBuilder: (context, index) {
                              return Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(ProductDetailsView(
                                          product: cont.pruductList[index],
                                        ));
                                      },
                                      child: Container(
                                        height: Get.height * 0.3,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            image: DecorationImage(
                                                image: NetworkImage(cont
                                                    .pruductList[index].image),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    CustomText(
                                        txt: cont.pruductList[index].name,
                                        fontSize: 16),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    CustomText(
                                      txt: cont.pruductList[index].company,
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    CustomText(
                                      txt:
                                          '\$ ${cont.pruductList[index].price.toString()}',
                                      fontSize: 16,
                                      color: primaryGreen,
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
            )));
  }
}
