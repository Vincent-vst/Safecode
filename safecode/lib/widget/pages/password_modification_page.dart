import 'package:flutter/material.dart';

import 'package:safecode/dataObject/password.dart';
import 'package:safecode/persistent_storage/password_dao.dart';
import 'package:safecode/widget/composedWidget/password_form.dart';

class PasswordModificationPage extends StatefulWidget {
  final Password password;
  final Function(Password) refresh;

  const PasswordModificationPage({Key? key, required this.password, required this.refresh}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PasswordModificationPageState();
}

class _PasswordModificationPageState extends State<PasswordModificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modifier un mot de passe"),
      ),
      body: PasswordForm(
        refresh: widget.refresh,
        password: widget.password,
        onValidate: (newPassword) {
          PasswordDAO.deletePassword(widget.password.getHashcode());
          PasswordDAO.addPassword(newPassword);
        },
      ),
    );
  }
}
