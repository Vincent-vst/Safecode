import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

import 'package:safecode/persistent_storage/main_password_manager.dart';
import 'package:safecode/persistent_storage/password_hive_box.dart';
import 'package:safecode/shortcuts_utilities/shorcuts_enter.dart';
import 'package:safecode/widget/smallWidget/password_text_field.dart';

class InscriptionPage extends StatefulWidget {
  const InscriptionPage({Key? key}) : super(key: key);

  @override
  _InscriptionPageState createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  final TextEditingController textController1 = TextEditingController();
  final TextEditingController textController2 = TextEditingController();
  final MainPasswordManager mainPasswordManager = MainPasswordManager();
  bool canValidate = false;

  void signUp(List args) async {
    BuildContext context = args[0];
    String password = textController1.text;
    String passwordVerif = textController2.text;
    if (password == passwordVerif) {
      await mainPasswordManager.storePassword(
        password: password,
      );
      await PasswordHiveBox.initializePasswordBox(password);
      Navigator.popAndPushNamed(
        context,
        '/application',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inscription"),
      ),
      body: Center(
        child: Shortcuts(
          shortcuts: shortcutEnterPressed(),
          child: Actions(
            actions: shortcutExecute(signUp, args: [context]),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Text(
                    "Inscription à Safecode",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                    child: PasswordTextField(
                      controller: textController1,
                      label: "Mot de passe principal",
                    ),
                  ),
                ),
                FlutterPwValidator(
                  controller: textController1,
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
                FractionallySizedBox(
                  widthFactor: 0.5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                    child: PasswordTextField(
                      controller: textController2,
                      label: "Confirmer le mot de passe principal",
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (canValidate) {
                      signUp([context]);
                    }
                  },
                  child: const Text("Enregistrer le mot de passe"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
