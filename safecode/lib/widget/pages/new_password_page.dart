import 'package:flutter/material.dart';

import 'package:safecode/dataObject/password.dart';
import 'package:safecode/persistent_storage/password_dao.dart';
import 'package:safecode/widget/composedWidget/password_form.dart';

class NewPasswordPage extends StatelessWidget {
  final Function(Password) refresh;

  const NewPasswordPage({Key? key, required this.refresh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajouter un mot de passe"),
      ),
      body: PasswordForm(
        refresh: refresh,
        onValidate: (newPassword) {
          PasswordDAO.addPassword(newPassword);
        },
      ),
    );
  }
}
