import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constant/colors.dart';
import '../models/characters_model.dart';
import '../provider/characters_provider.dart';
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CharactersProvider>(context);
    provider.fetchData();

    return provider.characters.isEmpty
    ? provider.isLoading() 
    : buildUI(
        character: provider.characters,
      );
  }
}

Widget buildUI({
  required List<Character> character
}) {
  return Scaffold(
    appBar: customAppBar(
      iconColor: Colors.white,
      iconData: Icons.search_outlined,
      backColor: darkGray,
      process: (){
        // TODO Here
      },
    ),
     // TODO Here
    //drawer: ,
    body: CharacterGirdView(
      character: character,
    ),
  );
}