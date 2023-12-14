import 'package:flutter/material.dart';

void pushPage(BuildContext context, Widget page) {
  Navigator.push(
    context, 
    MaterialPageRoute(
      builder: (_) => page,
    ),
  );
}

void popPage(BuildContext context) {
  Navigator.pop(context);
}

void pushRemovePage(BuildContext context, Widget page) {
  Navigator.pushAndRemoveUntil(
    context, 
    MaterialPageRoute(
      builder: (_) => page,
    ),
    (route) => false,
  );
}
