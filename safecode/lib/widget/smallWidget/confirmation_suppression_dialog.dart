import 'package:flutter/material.dart';

import 'package:safecode/persistent_storage/password_dao.dart';

class ConfirmationSuppressionDialog extends StatelessWidget {
  final int passwordHash;

  const ConfirmationSuppressionDialog({Key? key, required this.passwordHash}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Êtes vous sûr ?'),
      content: const Text('Vous vous apprêtez à supprimer un mot de passe, voulez-vous continuer ?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Annuler'),
        ),
        TextButton(
          onPressed: () => {
            PasswordDAO.deletePassword(passwordHash),
            Navigator.popAndPushNamed(context, "/application"),
          },
          child: const Text(
            'Valider',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
