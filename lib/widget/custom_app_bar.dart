import 'package:flutter/material.dart';

AppBar customAppBar({
  required Color iconColor, 
  required IconData iconData, 
  required void Function()? process, 
  required Color backColor,
}) {
  return AppBar(
    elevation: 0,
    iconTheme: IconThemeData(
      size: 30,
      color: iconColor,
    ),
    backgroundColor: backColor,
    actions: [
      IconButton(
        onPressed: process,
        icon: Icon(
          iconData,
        ),
      ),
    ],
  );
}
