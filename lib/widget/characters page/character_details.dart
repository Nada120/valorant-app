import 'package:flutter/material.dart';
import '../global/custom_button.dart';
import '../global/custom_navigator.dart';
import '../../constant/colors.dart';
import '../../models/characters_model.dart';
import 'custom_icons_abilities.dart';
import 'custom_text_details.dart';

class CharacterDetails extends StatelessWidget {
  final Character character;

  const CharacterDetails({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.6,
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
              title: character.name!,
              fontSize: 25,
              fontColor: brightRed,
            ),
          ),
          const SizedBox(height: 2),  
          setTitle(
            title: 'Description:',
          ),
          setData(
            text: character.description!,
            width: width,
          ),
          const Spacer(
            flex: 1,
          ),
          setTitle(
            title: 'Abilities:',
          ),
          CustomIconsAbilities(
            abilities: character.abilities,
            width: width,
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
