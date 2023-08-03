import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import '../provider/characters_provider.dart';

// constant
import '../constant/colors.dart';

// models
import '../models/characters_model.dart';

// services
import '../service/characters_service.dart';

// custom widgets
import '../widget/characters_gird.dart';
import '../widget/custom_loading.dart';
import '../widget/sticker_image.dart';
import '../widget/custom_app_bar.dart';
import '../widget/show_error.dart';

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
    //final provider = Provider.of<CharactersProvider>(context);
    //provider.fetchData();
    // return provider.characters.isEmpty
    // ? provider.isLoading() 
    // : buildUI(
    //     character: provider.characters,
    //   );

    return FutureBuilder(
      future: characters,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CustomLoading(
            size: 20,
            colors: [
              darkRed,
              teal,
              brightRed
            ],
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return buildUI(character: snapshot.data!);
          } 
        }
        return const ShowError();
      },
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
    body: SingleChildScrollView(
      child: Column(
        children: [
          StickerImage(
            image: 'assets/images/ch1.png',
            backColor: darkGray,
            fontColor: Colors.white,
          ),
          CharacterGirdView(character: character),
        ],
      ),
    ),
  );
}