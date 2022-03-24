import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? initialValue;
  final String? label;

  const PasswordTextField({Key? key, required this.controller, this.initialValue, this.label}) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    widget.controller.text = (widget.initialValue ?? "");
  }

  @override
  Widget build(BuildContext context) {
    // Ce TextFormField est tiré de https://www.instagram.com/p/CSKdv1hDrkI/
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      obscureText: !_passwordVisible,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
          icon: _passwordVisible
              ? const Icon(
                  Icons.visibility,
                  color: Colors.black,
                )
              : const Icon(
                  Icons.visibility_off,
                  color: Colors.grey,
                ),
        ),
        labelText: widget.label ?? "Mot de passe",
      ),
    );
  }
}
