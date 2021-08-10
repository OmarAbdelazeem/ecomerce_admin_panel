import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType ? keyBoardType;
  final String? Function(String?)? validationFunction;
  final TextDirection? textDirection;
  final void Function()? onTap;
  final bool readOnly;

  CustomTextField(
      {required this.hintText,
      required this.controller,
      this.validationFunction,
        this.keyBoardType,
        this.onTap,
        this.readOnly = false,
      this.textDirection});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      autofocus: true,
      readOnly: readOnly,
      maxLines: 5,
      minLines: 1,
      style: TextStyle(
        fontFamily: "Poppins",
      ),
      decoration: InputDecoration(
        filled: true,
        labelText: getTranslated(context, hintText),
        labelStyle: TextStyle(
          fontSize: 18,
        ),
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      validator: validationFunction,
      textDirection: textDirection,
      keyboardType: keyBoardType,
    );
  }
}
