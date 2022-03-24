import 'package:flutter/material.dart';
import 'package:safecode/dataObject/password.dart';

abstract class Updatable extends Widget {
  const Updatable({Key? key}) : super(key: key);

  void update(Password password);
}
