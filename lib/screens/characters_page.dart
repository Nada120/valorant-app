import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../models/characters_model.dart';
import '../service/characters_service.dart';
import '../widget/characters_gird.dart';
import '../widget/custom_app_bar.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  
  
  CharacterService service = CharacterService();
  late Future<List<Character>> characters =  service.getCharacters();
  
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Widget buildUI({
  required List<Character> character
}) {
  return Scaffold(
    appBar: customAppBar(
      iconColor: Colors.white,
      iconData: Icons.search_outlined,
      process: (){
        // TODO Here
      },
    ),
    //drawer: ,
    body: CharacterGirdView(
      character: character,
    ),
  );
}