import 'package:flutter/material.dart';

AppBar customAppBar({required iconColor, required iconData, required process}) {
  return AppBar(
    actions: [
      Padding(
        padding: const EdgeInsets.all(12),
        child: IconButton(
          onPressed: process,
          icon: Icon(
            iconData,
            color: iconColor,
            size: 45,
          ),
        ),
      ),
    ],
  );
}
