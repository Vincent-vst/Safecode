import 'package:flutter/material.dart';

class PasswordMasker extends StatefulWidget {
  final Widget? actionButton;
  final String data;

  const PasswordMasker({Key? key, this.actionButton, required this.data}) : super(key: key);

  @override
  _PasswordMaskerState createState() => _PasswordMaskerState();
}

class _PasswordMaskerState extends State<PasswordMasker> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
              child: Text(
                "Mot de passe",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            (widget.actionButton != null
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: (widget.actionButton!),
                  )
                : Container()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _isPasswordVisible ? SelectableText(widget.data) : Text("*" * widget.data.length),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
                icon: _isPasswordVisible
                    ? const Icon(
                        Icons.visibility,
                        color: Colors.black,
                      )
                    : const Icon(
                        Icons.visibility_off,
                        color: Colors.grey,
                      ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
