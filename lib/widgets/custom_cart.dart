import 'package:ecommerce_store/model/cart_pruduct_model.dart';
import 'package:ecommerce_store/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import 'custom_text.dart';

class CustomCart extends StatefulWidget {
  CustomCart(
      {Key? key, required this.id, required this.pruduct, required this.index})
      : super(key: key);
  CartPruduct pruduct;
  int? id;
  int index;

  @override
  _CustomCartState createState() => _CustomCartState();
}

class _CustomCartState extends State<CustomCart> {
  final Controller = Get.put(CartViewModel());

  bool del = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
        builder: (count) => Container(
              margin: EdgeInsets.all(15),
              height: Get.height * 0.2,
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        del = false;
                      });
                    },
                    onLongPress: () {
                      setState(() {
                        del = true;
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                          child: Image.network(
                            widget.pruduct.image,
                            fit: BoxFit.cover,
                            width: Get.width * 0.3,
                            height: Get.height * 0.2,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomText(
                                txt: widget.pruduct.name,
                                fontSize: 20,
                              ),
                              CustomText(
                                txt: '\$${widget.pruduct.price.toString()}',
                                fontSize: 20,
                                color: primaryGreen,
                              ),
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  children: [
                                    //icrement button
                                    IconButton(
                                        onPressed: () {
                                          count.increment(widget.index);
                                        },
                                        icon: Icon(Icons.add)),
                                    CustomText(
                                        txt: '${widget.pruduct.count}',
                                        fontSize: 18),
                                    //decrease button
                                    IconButton(
                                        onPressed: () {
                                          count.decrease(widget.index);
                                        },
                                        icon: Icon(Icons.remove))
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      right: 0,
                      top: 0,
                      child: AnimatedOpacity(
                          opacity: del ? 0.9 : 0,
                          duration: Duration(milliseconds: 300),
                          child: GestureDetector(
                            onTap: () {
                              if (del) {
                                setState(() {
                                  count.deleteProduct(widget.id);
                                  count.getAllToCart();
                                });
                                count.calcTotal();
                              }
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              color: Colors.red[600],
                              width: del ? Get.width * 0.3 : 50,
                              height: del ? Get.height * 0.2 : 100,
                              alignment: Alignment.center,
                              child: CustomText(
                                  txt: 'Delete'.tr,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                          )))
                ],
              ),
            ));
  }
}
