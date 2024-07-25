import 'package:flutter/material.dart';
import '../../models/characters_model.dart';
import '../../constant/colors.dart';

AppBar customAppBar(BuildContext context, List<Character> characters) {
  return AppBar(
    elevation: 0,
    scrolledUnderElevation: 0,
    iconTheme: const IconThemeData(
      size: 30,
      color: Colors.white,
    ),
    backgroundColor: darkGray,
    actions: [
      IconButton(
        onPressed: () {
          // TODO here add search method
        },
        icon: const Icon(
          Icons.search_outlined,
        ),
      ),
    ],
  );
}
