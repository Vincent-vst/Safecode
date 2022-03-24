import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'package:safecode/dataObject/password.dart';
import 'package:safecode/persistent_storage/main_password_manager.dart';
import 'package:safecode/persistent_storage/password_dao.dart';

class PasswordHiveBox {
  static final String _separator = Platform.pathSeparator;

  static changeMainPassword(String password) async {
    Map<dynamic, Password> passwordsDB = PasswordDAO.getAllPasswords();
    await Hive.close();

    Directory directory = await getApplicationSupportDirectory();
    String path = directory.path;
    Directory dir = Directory(path);
    dir.deleteSync(recursive: true);
    initializePasswordBox(password).then(
      (_) {
        PasswordDAO.rebootBox();
        passwordsDB.forEach((key, password) {
          PasswordDAO.addPassword(password);
        });
      },
    );
  }

  static Future<void> initializePasswordBox(String key) async {
    Directory directory = await getApplicationSupportDirectory();
    String path = directory.path;
    String backupPath = path + _separator + "backups";
    File? backupFile = await _getLastBackup(backupPath);

    if (await _checkStateData(path, backupFile)) {
      // Si la box est en bon état
      await _openBox(path, key);
    } else {
      // Si la box est corrompue/modifiée...
      if (backupFile != null) {
        await _restoreLastBackup(path, backupFile);
      }
      await _openBox(path, key);
    }
  }

  static Future<bool> _checkStateData(String path, File? backupFile) async {
    if (backupFile != null) {
      DateTime lastModifDateBackup = await backupFile.lastModified();
      File passwordsFile = File(path + _separator + "passwords.hive");
      DateTime? lastModifDateFile;
      if (await passwordsFile.exists()) {
        lastModifDateFile = await passwordsFile.lastModified();
      }
      return (lastModifDateBackup == lastModifDateFile);
    } else {
      return false;
    }
  }

  static Future<void> _openBox(String path, String key) async {
    await Hive.initFlutter(path);
    try {
      Hive.registerAdapter(PasswordAdapter());
    } catch (_) {}

    List<int> hashedKey = _hashKey(key);
    await Hive.openBox<Password>(
      "passwords",
      encryptionCipher: HiveAesCipher(hashedKey),
    );
    return;
  }

  static List<int> _hashKey(String key) {
    MainPasswordManager mainPasswordManager = MainPasswordManager();
    return mainPasswordManager.hashPassword(key);
  }

  static Future<void> _restoreLastBackup(String path, File lastBackup) async {
    await lastBackup.copy(path + _separator + "passwords.hive");
    return;
  }

  static Future<File?> _getLastBackup(String backupDirPath) async {
    Directory dir = Directory(backupDirPath);
    dir.create();
    List<FileSystemEntity> backupFiles = await dir.list().toList();
    if (backupFiles.isEmpty) {
      return null;
    } else {
      FileSystemEntity backupFile = backupFiles.last;
      return (backupFile as File);
    }
  }
}
