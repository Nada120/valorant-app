import 'package:flutter/material.dart';
import 'package:valorant_app/widget/custom_button.dart';
import 'package:valorant_app/widget/custom_navigator.dart';
import '../constant/colors.dart';
import '../models/characters_model.dart';

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
    return Container(
      height: width * 0.76,
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

  Widget setTitle({
    required String title,
    double fontSize = 17,
    FontWeight fontWeight = FontWeight.w800,
    Color fontColor = Colors.black,
  }) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: fontColor,
      ),
    );
  }

  Widget setData({
    required String text,
    required double width,
  }) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
  
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

  Widget setAbilities({
    required String title,
    required String description,
    required double width,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            setTitle(
              title: 'Name: ',
              fontSize: 14,
            ),
            setTitle(
              title: title,
              fontColor: brightRed,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        setData(
          text: description,
          width: width,
        ),
      ],
    );
  }
}
