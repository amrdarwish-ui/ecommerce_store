import 'package:flutter/material.dart';

import '../constants.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField({
    Key? key,
    required this.onSaved(val),
    required this.hintText,
    required this.obscure,
    required this.validate(val),
  }) : super(key: key);
  String hintText;
  bool obscure;
  Function validate;
  Function onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Please Fill the requird';
        }
        return null;
      },
      onChanged: (val) {
        onSaved(val);
      },
      cursorColor: primaryGreen,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: primaryGreen)),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: primaryGrey))),
    );
  }
}
