import 'package:flutter/material.dart';
import 'package:safecode/checkbox_list_count.dart';

import 'package:safecode/widget/smallWidget/checkbox_generator.dart';

class ListCheckboxGenerator extends StatefulWidget {
  final Function(bool? value) onChangedMinuscules;
  final Function(bool? value) onChangedMajuscules;
  final Function(bool? value) onChangedChiffres;
  final Function(bool? value) onChangedSpeciaux;

  const ListCheckboxGenerator(
      {Key? key,
      required this.onChangedMinuscules,
      required this.onChangedMajuscules,
      required this.onChangedChiffres,
      required this.onChangedSpeciaux})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListCheckboxGeneratorState();
}

class _ListCheckboxGeneratorState extends State<ListCheckboxGenerator> {
  CheckboxListCount count = CheckboxListCount(4);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <CheckboxGenerateur>[
        CheckboxGenerateur(
          title: 'Minuscule',
          onChanged: (value) {
            widget.onChangedMinuscules(value);
          },
          counter: count,
        ),
        CheckboxGenerateur(
          title: "Majuscules",
          // color : font,
          onChanged: (value) {
            widget.onChangedMajuscules(value);
          },
          counter: count,
        ),
        CheckboxGenerateur(
          title: "Chiffres",
          onChanged: (value) {
            widget.onChangedChiffres(value);
          },
          counter: count,
        ),
        CheckboxGenerateur(
          title: "Caractères spéciaux",
          onChanged: (value) {
            widget.onChangedSpeciaux(value);
          },
          counter: count,
        ),
      ],
    );
  }
}
