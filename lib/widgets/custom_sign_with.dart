import 'package:ecommerce_store/constants.dart';
import 'package:ecommerce_store/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomSignWith extends StatelessWidget {
  const CustomSignWith({
    Key? key,
    required this.imageLink,
    required this.title,
    required this.size,
  }) : super(key: key);

  final Size size;
  final String imageLink;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: size.height * 0.07,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.network(
            imageLink,
            height: 30,
            width: 30,
          ),
          CustomText(txt: title, fontSize: 16),
          Container()
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
          boxShadow: [BoxShadow(color: primaryGrey, spreadRadius: 1)]),
    );
  }
}
