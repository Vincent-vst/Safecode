import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String? initialValue;
  final TextEditingController controller;
  final InputDecoration decoration;
  final String? Function(String?) validator;

  TextFieldCustom(
      {Key? key, required this.controller, required this.decoration, required this.validator, this.initialValue})
      : super(key: key) {
    controller.text = (initialValue != null ? initialValue! : "");
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: decoration,
      validator: validator,
      autocorrect: false,
    );
  }
}
