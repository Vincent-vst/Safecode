import 'package:flutter/material.dart';

class NavigationBarItem extends StatelessWidget {
  final String title;
  final Icon icon;
  final Function()? onTap;

  const NavigationBarItem({Key? key, required this.title, required this.icon, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      leading: icon,
      title: Text(title),
      onTap: onTap,
      dense: true,
    );
  }
}
