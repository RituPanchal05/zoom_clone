import 'package:flutter/material.dart';

void showSnackBarError(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      showCloseIcon: true,
      behavior: SnackBarBehavior.floating,
      content: Text(
        text,
        style: TextStyle(color: Color(0xffDB4E63), fontWeight: FontWeight.bold),
      ),
      backgroundColor: Color(0xffFBEBEE),
      closeIconColor: Color(0xffD6314B),
      elevation: 0,
    ),
  );
}