import 'package:flutter/material.dart';

import 'package:safecode/updatable_interface/updatable.dart';
import 'package:safecode/widget/pages/main_page.dart';
import 'package:safecode/widget/pages/new_password_page.dart';
import 'package:safecode/widget/application_structure/navigation_bar/navigation_bar.dart' as nav_bar;
import 'package:safecode/widget/smallWidget/new_password_button.dart';

class ApplicationStructure extends StatefulWidget {
  const ApplicationStructure({Key? key}) : super(key: key);

  @override
  State<ApplicationStructure> createState() => _ApplicationStructureState();
}

class _ApplicationStructureState extends State<ApplicationStructure> {
  String appTitle = "Safecode";
  Updatable body = MainPage();

  void changePage(String title, Updatable page) {
    setState(() {
      appTitle = title;
      body = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appTitle,
        ),
      ),
      body: Row(
        children: [
          nav_bar.NavigationBar(
            onItemSelect: changePage,
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: body,
          ),
        ],
      ),
      floatingActionButton: NewPasswordButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewPasswordPage(
                refresh: body.update,
              ),
            ),
          ).then((_) {
            setState(() {
              body = body;
            });
          });
        },
      ),
    );
  }
}
