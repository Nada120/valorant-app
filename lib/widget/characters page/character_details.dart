import 'package:flutter/material.dart';
import '../global/custom_button.dart';
import '../global/custom_navigator.dart';
import '../../constant/colors.dart';
import '../../models/characters_model.dart';
import 'custom_text_details.dart';

class CharacterDetails extends StatefulWidget {
  final Character character;

  const CharacterDetails({
    super.key,
    required this.character,
  });

  @override
  State<CharacterDetails> createState() => _CharacterDetailsState();
}

class _CharacterDetailsState extends State<CharacterDetails> {
  String selectedAbilityName = '';
  String selectedAbilityDescription = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedAbilityDescription = widget.character.abilities[0]['description'];
      selectedAbilityName = widget.character.abilities[0]['displayName']; 
    });
  }

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
              title: widget.character.name!,
              fontSize: 25,
              fontColor: brightRed,
            ),
          ),
          const SizedBox(height: 2),  
          setTitle(
            title: 'Description:',
          ),
          setData(
            text: widget.character.description!,
            width: width,
          ),
          const Spacer(
            flex: 1,
          ),
          setTitle(
            title: 'Abilities:',
          ),
          setIconAbilities(),
          const SizedBox(height: 6),
          setAbilities(
            title: selectedAbilityName,
            description: selectedAbilityDescription,
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

  // TODO remove this and add custom_icon_button 
  Widget setIconAbilities() {
    final abilities = widget.character.abilities;
    return SizedBox(
      height: 30,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.character.abilities.length,
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () {
              setState(() {
                selectedAbilityName = abilities[index]['displayName'];
                selectedAbilityDescription =  abilities[index]['description'];
              });
            },
            child: Container(
              color: selectedAbilityName == abilities[index]['displayName'] 
                ? brightRed
                : darkGray.withOpacity(0.4),
              width: 40,
              height: 30,
              child: Image.network(
                abilities[index]['displayIcon']!,
                width: 30,
                height: 30,
              ),
            ),
          );
        }  
      ),
    );
  }
  // _________________________________________________
}
