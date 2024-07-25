import 'package:flutter/material.dart';
import '../../models/weapons_model.dart';
import 'custom_grid_weapons.dart';

class WeaponsBody extends StatelessWidget {
  final List<Weapon> weapons;
  const WeaponsBody({super.key, required this.weapons,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: weapons.length,
        itemBuilder: (_, index) {
          return CustomGridWeapons(
            weapon: weapons[index],
          );
        },
      ),
    );
  }
}
