import 'package:flutter/material.dart';
import 'package:safecode/dataObject/password.dart';

import 'package:safecode/updatable_interface/updatable.dart';
import 'package:safecode/widget/composedWidget/password_generator.dart';

class PasswordGeneratorPage extends StatelessWidget implements Updatable {
  final PasswordGenerator passwordGenerator = const PasswordGenerator();

  const PasswordGeneratorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return passwordGenerator;
  }

  @override
  void update(Password password) {
    passwordGenerator.update(password);
  }
}
