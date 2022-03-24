import 'package:flutter/material.dart';

import 'package:safecode/persistent_storage/main_password_manager.dart';
import 'package:safecode/widget/material_app/safecode_application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final MainPasswordManager mainPasswordManager = MainPasswordManager();

  mainPasswordManager.isPasswordSet().then(
    (isContained) {
      runApp(SafecodeApplication(
        isSigned: isContained,
      ));
    },
  );
}
