import 'dart:io';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'package:safecode/dataObject/password.dart';

class PasswordDAO {
  static Box<Password> box = Hive.box<Password>("passwords");
  static String separator = Platform.pathSeparator;

  static void rebootBox() {
    box = Hive.box<Password>("passwords");
  }

  static Future<void> backupData() async {
    Directory directory = await getApplicationSupportDirectory();
    String originPath = directory.path;
    File dataFile = File(originPath + separator + "passwords.hive");

    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String targetPath = originPath + separator + "backups" + separator + "backup" + timestamp + ".scbu";

    Directory targetDirectory = Directory(originPath + separator + "backups" + separator);

    if (!await targetDirectory.exists()) {
      await targetDirectory.create(recursive: true);
    }

    dataFile.copy(targetPath);
    deleteTooMuchBackup(originPath);
  }

  static void deleteTooMuchBackup(String path) async {
    String backupDirPath = path + separator + "backups";
    Directory dir = Directory(backupDirPath);
    List<FileSystemEntity> backupFiles = await dir.list().toList();
    while (backupFiles.length > 100) {
      File olderFile = (backupFiles[0] as File);
      olderFile.delete();
      backupFiles = await dir.list().toList();
    }
  }

  static void addPassword(Password password) {
    int key = password.getHashcode();
    box.put(key, password);
    backupData();
  }

  static Map<dynamic, Password> getAllPasswords() {
    return box.toMap();
  }

  static Password getPassword(int hashcode) {
    Password? password = box.get(hashcode);
    password ??= Password("", "", "", "", "");
    return password;
  }

  static void deletePassword(int hashcode) {
    box.delete(hashcode);
    backupData();
  }
}
