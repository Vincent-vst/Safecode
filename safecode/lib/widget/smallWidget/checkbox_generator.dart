import 'package:flutter/material.dart';
import 'package:safecode/theme.dart';
import 'package:safecode/checkbox_list_count.dart';

class CheckboxGenerateur extends StatefulWidget {
  final String title;
  final Function(bool?) onChanged;
  final CheckboxListCount counter;

  const CheckboxGenerateur({Key? key, required this.title, required this.onChanged, required this.counter})
      : super(key: key);

  @override
  State<CheckboxGenerateur> createState() => _CheckboxGenerateurState();
}

class _CheckboxGenerateurState extends State<CheckboxGenerateur> {
  late int count = widget.counter.getCount();
  bool? actived = true;

  void changeState(bool? value) {
    if (widget.counter.getCount() > 1 || !actived!) {
      setState(() {
        actived = value!;
      });
      widget.counter.changeCount(value);
      widget.onChanged(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        widget.title,
        style: TextStyle(color: font),
      ),
      value: actived,
      onChanged: (bool? value) {
        changeState(value);
      },
    );
  }
}
