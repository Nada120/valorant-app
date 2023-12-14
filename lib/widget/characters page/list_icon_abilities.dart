import 'package:flutter/material.dart';

class ListIconAbilities extends StatelessWidget {
  final String imagePath;
  final Color backColor;
  final List<dynamic> abilities;
  final void Function()? onTap;

  const ListIconAbilities({
    super.key,
    required this.backColor,
    required this.imagePath,
    required this.abilities,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: abilities.length,
        itemBuilder: (_, index) {
          return InkWell(
            onTap: onTap,
            child: Container(
              color: backColor,
              width: 40,
              height: 30,
              child: Image.network(
                abilities[index]['displayIcon']!,
                width: 30,
                height: 30,
              ),
            ),
          );
        },
      ),
    );
  }
}
