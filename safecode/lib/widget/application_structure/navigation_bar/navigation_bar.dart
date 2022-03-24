import 'package:flutter/material.dart';
import 'package:safecode/theme.dart';

import 'package:safecode/updatable_interface/updatable.dart';
import 'package:safecode/widget/composedWidget/passwords_list.dart';
import 'package:safecode/widget/pages/main_page.dart';
import 'package:safecode/widget/pages/password_generator_page.dart';
import 'package:safecode/widget/pages/profil_page.dart';
import 'package:safecode/widget/pages/settings_page.dart';

class NavigationBar extends StatefulWidget {
  final Function(String, Updatable) onItemSelect;

  const NavigationBar({Key? key, required this.onItemSelect}) : super(key: key);

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      // backgroundColor : background,
      destinations: <NavigationRailDestination>[
        NavigationRailDestination(
          icon: Icon(Icons.home, color: font),
          label: Text(
            'Accueil',
            style: TextStyle(color: font),
          ),
        ),
        NavigationRailDestination(
          icon: Icon(
            Icons.lock,
            color: font,
          ),
          label: Text(
            'Mots de passe',
            style: TextStyle(color: font),
          ),
        ),
        NavigationRailDestination(
          icon: Icon(
            Icons.shuffle_rounded,
            color: font,
          ),
          label: Text(
            'Générateur',
            style: TextStyle(color: font),
          ),
        ),
        NavigationRailDestination(
          icon: Icon(
            Icons.color_lens,
            color: font,
          ),
          label: Text(
            'Profil',
            style: TextStyle(color: font),
          ),
        ),
        NavigationRailDestination(
          icon: Icon(
            Icons.settings,
            color: font,
          ),
          label: Text(
            'Paramètres',
            style: TextStyle(color: font),
          ),
        ),
      ],
      onDestinationSelected: changeBody,
      selectedIndex: _selectedIndex,
      labelType: NavigationRailLabelType.all,
    );
  }

  void changeBody(int index) {
    String title;
    Updatable page;
    switch (index) {
      case 0:
        title = "Safecode";
        page = MainPage();
        break;
      case 1:
        title = "Mots de passe";
        page = PasswordList(
          key: UniqueKey(),
          addPasswordGenerator: false,
        );
        break;
      case 2:
        title = "Générateur de mots de passe";
        page = const PasswordGeneratorPage();
        break;
      case 3:
        title = "Profil";
        page = const ProfilPage();
        break;
      case 4:
        title = "Paramètres";
        page = const SettingsPage();
        break;
      default:
        title = "Safecode";
        page = MainPage();
    }
    widget.onItemSelect(title, page);

    setState(() {
      _selectedIndex = index;
    });
  }
}
