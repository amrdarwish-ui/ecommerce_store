import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCategory extends StatelessWidget {
  const CustomCategory({Key? key, required this.imageUrl, required this.name})
      : super(key: key);
  final String imageUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 60,
              width: 60,
              child: Center(
                child: Center(
                    child: SvgPicture.network(
                  imageUrl,
                )),
              ),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            ),
            Text(name)
          ],
        ),
      ),
    );
  }
}
