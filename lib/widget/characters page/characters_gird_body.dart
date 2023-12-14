import 'package:flutter/widgets.dart';
import '../../widget/characters%20page/characters_gird.dart';
import '../../models/characters_model.dart';

class CharacterGirdBody extends StatelessWidget {
  final List<Character> characters;

  const CharacterGirdBody({
    super.key, 
    required this.characters,
  });

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
        itemCount: characters.length,
        itemBuilder: (_, index) {
          return CharacterGirdView(
            characters: characters,
            index: index,
          );
        },
      ),
    );
  }
}
