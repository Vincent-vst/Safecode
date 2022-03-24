import 'package:flutter/cupertino.dart';

class MaskedText extends StatelessWidget {
  const MaskedText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text("**********"),
        Padding(
          padding: EdgeInsets.all(15),
        )
      ],
    );
  }
}
