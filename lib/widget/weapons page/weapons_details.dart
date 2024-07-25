import 'package:flutter/material.dart';
import '../../constant/colors.dart';
import '../../models/weapons_model.dart';
import '../characters page/custom_text_details.dart';
import '../global/custom_button.dart';
import '../global/custom_navigator.dart';

class WeaponsDetails extends StatelessWidget {
  final Weapon weapon;
  const WeaponsDetails({
    super.key,
    required this.weapon,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.4,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: teal.withOpacity(0.3),
            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(
            flex: 1,
          ),
          Center(
            child: setTitle(
              title: weapon.name,
              fontSize: 25,
              fontColor: brightRed,
            ),
          ),
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              setTitle(
                title: 'Category: ',
              ),
              setData(
                text: weapon.category,
                width: width * 0.6,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              setTitle(
                title: 'Cost: ',
              ),
              setData(
                text: weapon.cost == 0 ? 'NA' : '${weapon.cost}',
                width: width * 0.6,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              setTitle(
                title: 'Equip Time: ',
              ),
              setData(
                text: '${weapon.weaponStats.equipTimeSeconds} sec',
                width: width * 0.4,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              setTitle(
                title: 'Fire Rate: ',
              ),
              setData(
                text: '${weapon.weaponStats.fireRate}',
                width: width * 0.4,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              setTitle(
                title: 'First Bullet Accuracy: ',
              ),
              setData(
                text: '${weapon.weaponStats.firstBulletAccuracy}',
                width: width * 0.4,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              setTitle(
                title: 'Reload Time: ',
              ),
              setData(
                text: '${weapon.weaponStats.reloadTimeSeconds} sec',
                width: width * 0.4,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              setTitle(
                title: 'Shotgun Pellet Count: ',
              ),
              setData(
                text: '${weapon.weaponStats.shotgunPelletCount}',
                width: width * 0.4,
              ),
            ],
          ),
          const Spacer(),
          CustomButton(
            text: 'BACK',
            textSize: 16,
            backgroundColor: brightRed,
            icon: Icons.arrow_circle_left,
            process: () => popPage(context),
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
