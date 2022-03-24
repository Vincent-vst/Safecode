import 'package:flutter/material.dart';

class PasswordContainerLine extends StatelessWidget {
  final String string;

  const PasswordContainerLine({Key? key, required this.string}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return string != ""
        ? Row(
            children: [
              Text(string),
              const Padding(
                padding: EdgeInsets.all(15),
              )
            ],
          )
        : Container();
  }
}
