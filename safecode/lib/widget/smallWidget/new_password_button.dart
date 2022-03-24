import 'package:flutter/material.dart';
import 'package:safecode/theme.dart';

class NewPasswordButton extends StatelessWidget {
  final void Function() onPressed;

  const NewPasswordButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(
            Radius.circular(100),
          ),
          boxShadow: [
            BoxShadow(
              color: icons.withOpacity(0.3),
              spreadRadius: 9,
              blurRadius: 9,
            ),
          ],
        ),
        child: const Icon(Icons.add),
      ),
      onPressed: onPressed,
    );
  }
}
