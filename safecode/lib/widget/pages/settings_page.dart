import 'package:flutter/material.dart';

import 'package:safecode/dataObject/password.dart';
import 'package:safecode/updatable_interface/updatable.dart';
import 'package:safecode/widget/pages/change_main_password_page.dart';
import 'package:safecode/widget/smallWidget/account_option.dart';

class SettingsPage extends StatefulWidget implements Updatable {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();

  @override
  void update(Password password) {}
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkTheme = true;
  bool hasNotifications = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          const SizedBox(
            height: 40,
          ),
          // Widget 0 : Compte
          Row(
            children: const [
              Icon(
                Icons.person,
                color: Colors.blue,
              ),
              SizedBox(
                width: 10,
              ),
              Text("Compte")
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          // Widget 1, 2 and 3
          AccountOption(
            title: "Changer le mot de passe principal",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChangeMainPasswordPage()),
              );
            },
          ),
          const AccountOption(
            title: "Langue",
          ),
          const AccountOption(
            title: "Collecte des données",
          ),
          const SizedBox(
            height: 40,
          ),
          // Widget 4 : Theme
          Row(
            children: const [
              Icon(
                Icons.color_lens,
                color: Colors.blue,
              ),
              SizedBox(
                width: 10,
              ),
              Text("Theme")
            ],
          ),
          // Widget 5 : theme choice
          CheckboxListTile(
            title: const Text(
              "Dark Theme",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            value: isDarkTheme,
            onChanged: (newValue) {
              setState(() {
                isDarkTheme = newValue!;
              });
            },
          ),
          // Widget 6 : Notification settings
          CheckboxListTile(
            title: const Text(
              "Notifications",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            value: hasNotifications,
            onChanged: (newValue) {
              setState(() {
                hasNotifications = newValue!;
              });
            },
          ),
        ],
      ),
    );
  }
}
