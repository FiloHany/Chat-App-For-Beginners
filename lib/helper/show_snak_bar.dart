import 'package:flutter/material.dart';

void showsnakbar(BuildContext context, String message, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message), //"User Created Successfully"
      backgroundColor: color, //Colors.green
    ),
  );
}
