import 'dart:io';
import 'package:flutter/material.dart';

class Util {
  Future<void> showBar(BuildContext context, String text) async {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
