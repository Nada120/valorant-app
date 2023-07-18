import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../models/characters_model.dart';

class CharacterGirdView extends StatelessWidget {
  final List<Character> character;

  const CharacterGirdView({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: character.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: darkGray,
            ),
            height: 400,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Image.network(
                  character[index].fullPortrait ??
                      "https://cdn.dribbble.com/users/1078347/screenshots/2799566/media/8a4ae0833c5e06c34e48b87c7583dc2d.png?compress=1&resize=400x300&vertical=center",
                  height: 400,
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: darkRed,
                  ),
                  child: Center(
                    child: Text(
                      character[index].name ?? 'none',
                      style: const TextStyle(
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
          );
        },
      ),
    );
  }
}
