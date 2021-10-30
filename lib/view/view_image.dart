import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewImage extends StatelessWidget {
  const ViewImage({Key? key, required this.src}) : super(key: key);
  final String src;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.close,
              color: Colors.white,
            )),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Hero(tag: 1, child: Image.network(src)),
      ),
    );
  }
}
