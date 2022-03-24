import "package:flutter/material.dart";

class SliderWithLabel extends StatefulWidget {
  final double longueurMin, longueurMax;
  final Function(int) changedValue;
  final int longueur;

  const SliderWithLabel(
      {Key? key,
      required this.longueurMin,
      required this.longueurMax,
      required this.changedValue,
      required this.longueur})
      : super(key: key);

  @override
  State<SliderWithLabel> createState() => _SliderWithLabelState();
}

class _SliderWithLabelState extends State<SliderWithLabel> {
  late int longueur;

  @override
  void initState() {
    super.initState();
    longueur = widget.longueur;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Slider(
          value: longueur.toDouble(),
          min: widget.longueurMin,
          max: widget.longueurMax,
          divisions: (widget.longueurMax - widget.longueurMin).toInt(),
          onChanged: (double value) {
            setState(() {
              longueur = value.toInt();
            });
            widget.changedValue(longueur);
          },
          label: longueur.toString(),
        ),
        Text(
          longueur.toString(),
        ), //Affiche la longueur actuelle du mot de passe
      ],
    );
  }
}
