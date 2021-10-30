import 'package:ecommerce_store/constants.dart';
import 'package:ecommerce_store/view_model/account_view_model.dart';
import 'package:ecommerce_store/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TrackOrder extends GetWidget<AccountViewModel> {
  final controller = Get.put(AccountViewModel());
  TrackOrder() {
    if (controller.odersList.isEmpty) {
      controller.getOrders();
    }
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountViewModel>(
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
              title: CustomText(txt: 'Track Orders'.tr, fontSize: 18),
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                cont.getOrders();
              },
              child: cont.odersList.isEmpty
                  ? Center(
                      child: CustomText(txt: 'No orders yet'.tr, fontSize: 16),
                    )
                  : ListView.builder(
                      itemCount: cont.odersList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: Get.height * (140 / Get.height),
                          width: double.infinity,
                          margin: const EdgeInsets.all(20),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: primaryGrey,
                                    offset: Offset(0, 5),
                                    blurRadius: 10)
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: Get.width * 0.4,
                                            child: CustomText(
                                                txt: cont
                                                    .odersList[index].address,
                                                fontSize: 16)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        CustomText(
                                          txt:
                                              '\$${cont.odersList[index].total.round()}',
                                          fontSize: 14,
                                          color: primaryGreen,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          color:
                                              cont.odersList[index].isDeliverd
                                                  ? primaryGreen
                                                  : Colors.yellow[600]),
                                      padding: const EdgeInsets.all(7.5),
                                      child: CustomText(
                                          txt: cont.odersList[index].isDeliverd
                                              ? 'Delivered'.tr
                                              : 'In Transit'.tr,
                                          fontSize: 14),
                                    )
                                    // SvgPicture.asset(
                                    //     cont.odersList[index].isDeliverd
                                    //         ? 'assets/svg_txts/deliverd.svg'
                                    //         : 'assets/svg_txts/intransit.svg')
                                  ],
                                ),
                              ),
                              Container(
                                height: Get.height * (105 / Get.height),
                                width: Get.height * (105 / Get.height),
                                child: Image.network(
                                  cont.odersList[index].orders[0]['image'],
                                  fit: BoxFit.cover,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
            )));
  }
}
