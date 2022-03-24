import 'dart:convert';

import 'package:hive/hive.dart';

part 'password.g.dart';

@HiveType(typeId: 0)
class Password {
  @HiveField(0)
  String identifiant;
  @HiveField(1)
  String url;
  @HiveField(2)
  String email;
  @HiveField(3)
  String password;
  @HiveField(4)
  String description;

  Password(
    this.identifiant,
    this.url,
    this.email,
    this.password,
    this.description,
  );

  Map toJson() => {
        "identifiant": identifiant,
        "url": url,
        "email": email,
        "password": password,
        "description": description,
      };

  int getHashcode() {
    return jsonEncode(password).hashCode;
  }
}
