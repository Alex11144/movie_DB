import 'package:flutter/material.dart';

abstract class AppButtonStyle {
  static final ButtonStyle linkButton = ButtonStyle(
      foregroundColor: MaterialStateProperty.all(const Color(0xff0184e4)),
      textStyle: MaterialStateProperty.all(
        const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ));
}
