import 'package:flutter/material.dart';
import 'package:safecode/dataObject/password.dart';
import 'package:safecode/updatable_interface/updatable.dart';

import 'package:safecode/widget/composedWidget/passwords_list.dart';

class MainPage extends StatelessWidget implements Updatable {
  final passwordList = PasswordList(
    key: UniqueKey(),
    addPasswordGenerator: true,
  );

  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: passwordList,
    );
  }

  @override
  void update(Password password) {
    passwordList.update(password);
  }
}
