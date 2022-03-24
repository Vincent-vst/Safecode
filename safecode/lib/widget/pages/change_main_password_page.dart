import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:safecode/persistent_storage/main_password_manager.dart';
import 'package:safecode/shortcuts_utilities/shorcuts_enter.dart';
import 'package:safecode/widget/smallWidget/password_text_field.dart';

class ChangeMainPasswordPage extends StatefulWidget {
  const ChangeMainPasswordPage({Key? key}) : super(key: key);

  @override
  _ChangeMainPasswordPageState createState() => _ChangeMainPasswordPageState();
}

validerForm() {}

class _ChangeMainPasswordPageState extends State<ChangeMainPasswordPage> {
  final _textEditingControllerPasswordOld = TextEditingController();
  final _textEditingControllerPasswordNew1 = TextEditingController();
  final _textEditingControllerPasswordNew2 = TextEditingController();
  final MainPasswordManager mainPasswordManager = MainPasswordManager();
  bool canValidate = false;

  @override
  // Appelé à la fermeture de la page pour "vider" tous les controllers
  void dispose() {
    _textEditingControllerPasswordOld.dispose();
    _textEditingControllerPasswordNew1.dispose();
    _textEditingControllerPasswordNew2.dispose();
    super.dispose();
  }

  void validerForm(BuildContext context) {
    mainPasswordManager.readPassword().then(
      (password) {
        if (password == mainPasswordManager.hashPasswordTwice(_textEditingControllerPasswordOld.text)) {
          if (_textEditingControllerPasswordNew1.text == _textEditingControllerPasswordNew2.text) {
            mainPasswordManager.changePassword(_textEditingControllerPasswordNew1.text);
            Navigator.pop(context);
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Changer le mot de passe principal"),
      ),
      body: Form(
          child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(30.0, 15.0, 30.0, 0.0),
        child: Shortcuts(
          shortcuts: shortcutEnterPressed(),
          child: Actions(
            actions: shortcutExecute(validerForm),
            child: Column(
              children: <Widget>[
                PasswordTextField(
                  controller: _textEditingControllerPasswordOld,
                  label: "Ancien mot de passe",
                ),
                PasswordTextField(
                  controller: _textEditingControllerPasswordNew1,
                  label: "Nouveau mot de passe",
                ),
                FlutterPwValidator(
                  controller: _textEditingControllerPasswordNew1,
                  minLength: 12,
                  uppercaseCharCount: 1,
                  numericCharCount: 1,
                  specialCharCount: 1,
                  width: 400,
                  height: 150,
                  onSuccess: () {
                    canValidate = true;
                  },
                ),
                PasswordTextField(
                  controller: _textEditingControllerPasswordNew2,
                  label: "Confirmez le nouveau mot de passe",
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (canValidate) {
                        validerForm(context);
                      }
                    },
                    child: const Text("Enregistrer"),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
