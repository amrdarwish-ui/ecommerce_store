import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:ecommerce_store/view/view_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({Key? key, required this.h, required this.ImageList})
      : super(key: key);

  final double h;
  final List<String> ImageList;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: h * 0.3,
        child: Carousel(
          animationDuration: Duration(milliseconds: 1),
          defaultImage: Icon(
            Icons.photo_size_select_actual_sharp,
            color: Colors.grey,
          ),
          autoplay: false,
          showIndicator: false,
          onImageTap: (index) {
            Get.to(ViewImage(src: ImageList[index]));
          },
          images: ImageList.map((e) {
            return Builder(
              builder: (context) {
                return Hero(
                  tag: 1,
                  child: Image.network(
                    '$e',
                    width: double.infinity,
                  ),
                );
              },
            );
          }).toList(),
          boxFit: BoxFit.cover,
        ));
  }
}
