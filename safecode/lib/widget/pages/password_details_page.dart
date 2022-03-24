import 'package:flutter/material.dart';
import 'package:safecode/widget/smallWidget/password_masker.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:safecode/widget/pages/password_modification_page.dart';
import 'package:safecode/widget/smallWidget/confirmation_suppression_dialog.dart';
import 'package:safecode/widget/smallWidget/password_detail.dart';
import 'package:safecode/dataObject/password.dart';
import 'package:safecode/widget/smallWidget/copy_button.dart';
import 'package:safecode/persistent_storage/password_dao.dart';

class PasswordDetailsPage extends StatefulWidget {
  final int passwordHash;

  const PasswordDetailsPage({Key? key, required this.passwordHash}) : super(key: key);

  @override
  _PasswordDetailsPageState createState() => _PasswordDetailsPageState();
}

class _PasswordDetailsPageState extends State<PasswordDetailsPage> {
  late Password password = PasswordDAO.getPassword(widget.passwordHash);
  bool isPasswordVisible = false;

  void _openURL() async {
    String url = password.url;
    if (url.substring(0, 4) != "http") {
      url = "http://" + url;
    }
    await launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(password.url),
      ),
      body: Center(
        child: Column(
          children: [
            PasswordDetail(
              label: "Lien",
              data: password.url,
              actionButton: ElevatedButton(
                onPressed: _openURL,
                child: const Icon(Icons.link),
              ),
            ),
            PasswordDetail(
              label: "Identifiant",
              data: password.identifiant,
              actionButton: CopyButton(text: password.identifiant),
            ),
            PasswordDetail(
              label: "Adresse mail",
              data: password.email,
              actionButton: CopyButton(text: password.email),
            ),
            PasswordMasker(
              data: password.password,
              actionButton: CopyButton(text: password.password),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Fermer"),
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PasswordModificationPage(
                          password: password,
                          refresh: (password) {
                            setState(() {
                              this.password = password;
                            });
                          },
                        ),
                      ),
                    ).then((_) {
                      setState(() {});
                    });
                  },
                  child: const Text("Modifier"),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                ElevatedButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => ConfirmationSuppressionDialog(
                      passwordHash: widget.passwordHash,
                    ),
                  ),
                  child: const Text(
                    "Supprimer",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
