import 'package:flutter/material.dart';
import '../../constant/colors.dart';
import '../../models/characters_model.dart';

class GridFavoriteCharacters extends StatelessWidget {
  final List<Character> characters;
  const GridFavoriteCharacters({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 3,
            childAspectRatio: 1 / 2,
          ),
          itemCount: characters.length,
          itemBuilder: (_, index) {
            return Column(
              children: [
                Container(
                  color: teal,
                  padding: const EdgeInsets.symmetric(
                    vertical: 3,
                    horizontal: 15,
                  ),
                  child: Text(
                    characters[index].name!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 3,
                    horizontal: 5,
                  ),
                  color: brightRed,
                  child: Image.network(characters[index].fullPortrait!),
                ),
                Container(
                  color: brightRed.withOpacity(0.2),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 3,
                    vertical: 6,
                  ),
                  child: Text(
                    characters[index].description!,
                    maxLines: 7,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
