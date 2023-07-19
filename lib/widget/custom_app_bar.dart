import 'package:flutter/material.dart';

AppBar customAppBar({
  required Color iconColor, 
  required IconData iconData, 
  required void Function()? process, 
  required Color backColor,
}) {
  return AppBar(
    backgroundColor: backColor,
    actions: [
      Padding(
        padding: const EdgeInsets.all(12),
        child: IconButton(
          onPressed: process,
          icon: Icon(
            iconData,
            color: iconColor,
            size: 35,
          ),
        ),
      ),
    ],
  );
}
