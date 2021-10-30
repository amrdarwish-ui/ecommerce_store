import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText(
      {Key? key,
      required this.txt,
      required this.fontSize,
      this.fontWeight = FontWeight.normal,
      this.color = Colors.black,
      this.align = TextAlign.left})
      : super(key: key);
  String txt;
  double fontSize;
  FontWeight fontWeight;
  Color color;
  TextAlign align;

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      textAlign: align,
      style:
          TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
    );
  }
}
