import 'package:flutter/material.dart';

import 'package:safecode/dataObject/password.dart';
import 'package:safecode/shortcuts_utilities/shorcuts_enter.dart';
import 'package:safecode/widget/smallWidget/password_text_field.dart';
import 'package:safecode/widget/smallWidget/text_field_custom.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class PasswordForm extends StatefulWidget {
  final Function(Password) refresh;
  final Function(Password) onValidate;
  final Password? password;

  const PasswordForm({Key? key, required this.refresh, this.password, required this.onValidate}) : super(key: key);

  @override
  _PasswordFormState createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _textEditingControllerURL = TextEditingController();
  final _textEditingControllerIdentifiant = TextEditingController();
  final _textEditingControllerEmail = TextEditingController();
  final _textEditingControllerPassword = TextEditingController();

  @override
  // Appelé à la fermeture de la page pour "vider" tous les controllers
  void dispose() {
    _textEditingControllerURL.dispose();
    _textEditingControllerIdentifiant.dispose();
    _textEditingControllerEmail.dispose();
    _textEditingControllerPassword.dispose();
    super.dispose();
  }

  String? validator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  void validerForm() {
    Password newPassword = Password(
      _textEditingControllerIdentifiant.text,
      _textEditingControllerURL.text,
      _textEditingControllerEmail.text,
      _textEditingControllerPassword.text,
      "",
    );

    widget.onValidate(newPassword);

    Navigator.pop(context);
    widget.refresh(newPassword);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(30.0, 15.0, 30.0, 0.0),
        child: Shortcuts(
          shortcuts: shortcutEnterPressed(),
          child: Actions(
            actions: shortcutExecute(validerForm),
            child: Column(
              children: <Widget>[
                TextFieldCustom(
                  initialValue: widget.password?.url,
                  controller: _textEditingControllerURL,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.link),
                    labelText: "Lien / URL",
                  ),
                  validator: validator,
                ),
                TextFieldCustom(
                  initialValue: widget.password?.identifiant,
                  controller: _textEditingControllerIdentifiant,
                  decoration: const InputDecoration(
                    labelText: "Identifiant",
                  ),
                  validator: validator,
                ),
                TextFieldCustom(
                  initialValue: widget.password?.email,
                  controller: _textEditingControllerEmail,
                  decoration: const InputDecoration(
                    labelText: "Adresse mail",
                  ),
                  validator: validator,
                ),
                PasswordTextField(
                  initialValue: widget.password?.password,
                  controller: _textEditingControllerPassword,
                ),
                FlutterPwValidator(
                  controller: _textEditingControllerPassword,
                  minLength: 12,
                  uppercaseCharCount: 1,
                  numericCharCount: 1,
                  specialCharCount: 1,
                  width: 400,
                  height: 150,
                  onSuccess: () {},
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      validerForm();
                    },
                    child: const Text("Enregistrer"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
