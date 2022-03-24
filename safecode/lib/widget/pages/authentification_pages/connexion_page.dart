import 'package:flutter/material.dart';

import 'package:safecode/persistent_storage/main_password_manager.dart';
import 'package:safecode/persistent_storage/password_hive_box.dart';
import 'package:safecode/shortcuts_utilities/shorcuts_enter.dart';
import 'package:safecode/widget/smallWidget/password_text_field.dart';

class ConnexionPage extends StatelessWidget {
  ConnexionPage({Key? key}) : super(key: key);

  final TextEditingController textController = TextEditingController();
  final MainPasswordManager mainPasswordManager = MainPasswordManager();

  void connect(List args) async {
    BuildContext context = args[0];
    String password = textController.text;
    if (mainPasswordManager.hashPasswordTwice(password) == await mainPasswordManager.readPassword()) {
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
        title: const Text("Connexion"),
      ),
      body: Center(
        child: Shortcuts(
          shortcuts: shortcutEnterPressed(),
          child: Actions(
            actions: shortcutExecute(connect, args: [context]),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Text(
                    "Connexion à Safecode",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                    child: PasswordTextField(
                      controller: textController,
                      label: "Mot de passe principal",
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    connect([context]);
                  },
                  child: const Text("Connexion"),
                ),
                // ElevatedButton(
                //   onPressed: () async {
                //     await mainPasswordManager.deletePassword();
                //     Navigator.popAndPushNamed(
                //       context,
                //       '/inscription',
                //     );
                //   },
                //   child: Text("Supprimer mdp"),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
