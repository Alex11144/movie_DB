import 'package:flutter/material.dart';

class bottomAppBar extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onTap;
  final Color color;
  const bottomAppBar(
      {Key? key,
      required this.text,
      required this.icon,
      this.onTap,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
