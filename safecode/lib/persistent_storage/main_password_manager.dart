import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:safecode/persistent_storage/password_hive_box.dart';

class MainPasswordManager {
  static const key = "password";
  final _storage = const FlutterSecureStorage();

  Future<bool> isPasswordSet() {
    return _storage.containsKey(key: "password");
  }

  Future<String?> readPassword() async {
    return _storage.read(key: key);
  }

  Future<void> deletePassword() {
    return _storage.delete(key: key);
  }

  void changePassword(String password) async {
    await deletePassword();
    await storePassword(password: password);
    PasswordHiveBox.changeMainPassword(password);
  }

  Future<void> storePassword({required String password}) {
    String hash = hashPasswordToString(password);
    hash = hashPasswordToString(hash);

    return _storage.write(key: key, value: hash);
  }

  List<int> hashPassword(String password) {
    List<int> bytes = utf8.encode(password);
    Digest digest = sha256.convert(bytes);
    return digest.bytes;
  }

  String hashPasswordToString(String password) {
    return hashPassword(password).toString();
  }

  String hashPasswordTwice(String password) {
    return hashPasswordToString(hashPasswordToString(password));
  }
}
