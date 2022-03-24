import 'package:flutter/material.dart';

import 'package:safecode/theme.dart';
import 'package:safecode/widget/application_structure/application_structure.dart';
import 'package:safecode/widget/pages/authentification_pages/connexion_page.dart';
import 'package:safecode/widget/pages/authentification_pages/inscription_page.dart';

class SafecodeApplication extends StatelessWidget {
  final bool isSigned;
  const SafecodeApplication({Key? key, required this.isSigned}) : super(key: key);

  String getRoute() {
    String route = isSigned ? '/connexion' : "/inscription";
    return route;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safecode',
      theme: CustomTheme.darkTheme,
      initialRoute: getRoute(),
      routes: {
        '/connexion': (context) => ConnexionPage(),
        '/application': (context) => const ApplicationStructure(),
        '/inscription': (context) => const InscriptionPage(),
      },
    );
  }
}
