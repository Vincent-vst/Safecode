import 'package:flutter/material.dart';

import 'package:safecode/dataObject/password.dart';
import 'package:safecode/updatable_interface/updatable.dart';
import 'package:safecode/dataObject/password_generator_moteur.dart';
import 'package:safecode/widget/composedWidget/list_checkbox_generator.dart';
import 'package:safecode/widget/smallWidget/copy_button.dart';
import 'package:safecode/widget/smallWidget/slider_with_label.dart';

class PasswordGenerator extends StatefulWidget implements Updatable {
  const PasswordGenerator({Key? key}) : super(key: key);

  @override
  State<PasswordGenerator> createState() => _PasswordGeneratorState();

  @override
  void update(Password password) {}
}

class _PasswordGeneratorState extends State<PasswordGenerator> {
  static const double longueurMin = 4;
  static const double longueurMax = 32;

  bool mins = true;
  bool majs = true;
  bool chifs = true;
  bool specs = true;
  int longueur = 12;

  late String password = getNewPassword();

  String getNewPassword() {
    return PasswordGeneratorMoteur.genererMotDePasse(longueur, mins, majs, chifs, specs);
  }

  String verificationPassword() {
    String rst;
    int a = mins ? 1 : 0;
    a += majs ? 1 : 0;
    a += chifs ? 1 : 0;
    a += specs ? 1 : 0;
    a += longueur < 8 ? -1 : 0;
    a += longueur >= 12 ? 1 : 0;
    a += longueur >= 20 ? 1 : 0;
    switch (a) {
      case 0:
        rst = "beaucoup trop faible";
        break;
      case 1:
        rst = "très faible";
        break;
      case 2:
        rst = "faible";
        break;
      case 3:
        rst = "moyen";
        break;
      case 4:
        rst = "fort";
        break;
      case 5:
        rst = "très fort";
        break;
      case 6:
        rst = "extrêmement fort";
        break;
      default:
        rst = "";
    }
    return rst;
  }

  @override
  Widget build(BuildContext context) {
    password = getNewPassword();
    return Center(
      child: Container(
        padding: const EdgeInsets.only(top: 30),
        width: 550,
        child: Column(
          children: [
            SelectableText(
              password,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 30)),
            Text("Mot de passe " + verificationPassword()),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CopyButton(text: password),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => setState(() {
                      password = getNewPassword();
                    }), //Génère un nouveau mot de passe
                    child: const Text("Regénérer"),
                  ),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            SliderWithLabel(
              longueur: longueur,
              longueurMax: longueurMax,
              longueurMin: longueurMin,
              changedValue: (value) {
                setState(() {
                  longueur = value;
                  password = getNewPassword();
                });
              },
            ),
            ListCheckboxGenerator(
              onChangedMinuscules: (bool? value) => setState(() {
                mins = value!;
              }),
              onChangedMajuscules: (bool? value) => setState(() {
                majs = value!;
              }),
              onChangedChiffres: (bool? value) => setState(() {
                chifs = value!;
              }),
              onChangedSpeciaux: (bool? value) => setState(() {
                specs = value!;
              }),
            )
          ],
        ),
      ),
    );
  }
}
