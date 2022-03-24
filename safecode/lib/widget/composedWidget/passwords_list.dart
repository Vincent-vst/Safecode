import 'package:flutter/material.dart';

import 'package:safecode/updatable_interface/updatable.dart';
import 'package:safecode/persistent_storage/password_dao.dart';
import 'package:safecode/dataObject/password.dart';
import 'package:safecode/widget/composedWidget/password_container.dart';
import 'package:safecode/widget/composedWidget/password_generator.dart';

class PasswordList extends StatefulWidget implements Updatable {
  final bool addPasswordGenerator;
  late final _PasswordListState passwordListState;

  PasswordList({required Key key, required this.addPasswordGenerator}) : super(key: key) {
    passwordListState = _PasswordListState();
  }

  @override
  _PasswordListState createState() {
    // ignore: no_logic_in_create_state
    return passwordListState;
  }

  @override
  void update(Password password) {
    passwordListState.refresh();
  }
}

class _PasswordListState extends State<PasswordList> {
  void refresh() {
    setState(() {});
  }

  Widget _buildPasswordContainer(Password password) {
    return PasswordContainer(
      password: password,
      updateList: refresh,
    );
  }

  @override
  Widget build(BuildContext context) {
    var all = PasswordDAO.getAllPasswords();
    var passwordList = [];
    all.forEach((key, value) {
      passwordList.add(value);
    });

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 15.0, 10.0),
            itemCount: all.length + (widget.addPasswordGenerator ? 1 : 0),
            itemBuilder: (BuildContext context, int index) {
              if (widget.addPasswordGenerator && index == 0) {
                return Column(
                  children: const [
                    PasswordGenerator(),
                    Divider(),
                  ],
                );
              }
              return _buildPasswordContainer(
                passwordList[index - (widget.addPasswordGenerator ? 1 : 0)],
              );
            },
          ),
        ),
      ],
    );
  }
}
