import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyButton extends StatelessWidget {
  final String text;

  const CopyButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Clipboard.setData(
        ClipboardData(
          text: text,
        ),
      ), //Copie dans le presse-papier le mot de passe généré
      child: const Text("Copier"),
    );
  }
}
