import 'package:flutter/material.dart';
import '../../constant/colors.dart';
import '../../models/characters_model.dart';
import 'character_details.dart';

class CharacterGirdView extends StatelessWidget {
  final List<Character> characters;
  final int index;

  const CharacterGirdView({
    super.key,
    required this.characters,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showBottomSheet(
          context: context,
          builder: (_) => CharacterDetails(character: characters[index]),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: darkGray,
          gradient: LinearGradient(
            end: Alignment.topCenter,
            begin: Alignment.bottomCenter,
            colors: [
              darkGray,
              darkGray.withOpacity(0.3),
              darkRed.withOpacity(0.3),
              darkRed,
            ],
          ),
        ),
        height: 400,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Image.network(
              characters[index].fullPortrait!,
              height: 400,
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                gradient: LinearGradient(
                  colors: [
                    teal,
                    teal.withOpacity(0.6),
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  characters[index].name!,
                  style: const TextStyle(
                    fontFamily: 'gamerBold',
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
