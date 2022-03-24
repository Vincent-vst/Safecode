import 'package:flutter/material.dart';

import 'package:safecode/dataObject/password.dart';
import 'package:safecode/widget/pages/password_details_page.dart';
import 'package:safecode/widget/smallWidget/masked_text.dart';
import 'package:safecode/widget/smallWidget/password_container_line.dart';
import 'package:safecode/theme.dart';

class PasswordContainer extends StatelessWidget {
  final Password password;
  final Function updateList;

  const PasswordContainer({Key? key, required this.password, required this.updateList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PasswordDetailsPage(passwordHash: password.getHashcode()),
          ),
        ).then((_) => updateList());
      },
      child: Container(
        color: background,
        child: Card(
          child: ListTile(
            leading: const Icon(
              Icons.password,
              size: 20,
            ),
            title: Text(password.url),
            textColor: font,
            tileColor: background,
            subtitle: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(5),
                ),
                PasswordContainerLine(
                  string: password.identifiant,
                ),
                PasswordContainerLine(
                  string: password.email,
                ),
                const MaskedText(),
              ],
            ),
          ),
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: pinky,
            ),
          ),
          margin: const EdgeInsets.all(10),
        ),
      ),
    );
  }
}
