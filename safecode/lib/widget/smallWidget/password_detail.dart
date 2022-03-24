import 'package:flutter/material.dart';

class PasswordDetail extends StatelessWidget {
  final String label;
  final String data;
  final Widget? actionButton;

  const PasswordDetail({Key? key, required this.label, required this.data, this.actionButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
              child: Text(
                label,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            (actionButton != null
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: (actionButton!),
                  )
                : Container()),
          ],
        ),
        data != ""
            ? SelectableText(data)
            : Text(
                "Pas de " + label.toLowerCase() + " enregistré",
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
      ],
    );
  }
}
