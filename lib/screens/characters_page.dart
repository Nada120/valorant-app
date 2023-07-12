import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../models/characters_model.dart';
import '../service/characters_service.dart';

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
    return FutureBuilder(
      future: characters,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          debugPrint("There is Error");
        } else {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(
              color: brightRed,
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return buildUI(character: snapshot.data!);
          }
        }
        return CircularProgressIndicator(
          color: brightRed,
        );
    });
  }
}


// TODO THERE

Widget buildUI({
  required List<Character> character
}) {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
    ), 
    itemCount: character.length,
    itemBuilder: (context, index){
      return Container(
        height: 400,
        color: darkGray,
        child: Column(
          children: [
            Image.network(
              character[index].fullPortrait?? "https://cdn.dribbble.com/users/1078347/screenshots/2799566/media/8a4ae0833c5e06c34e48b87c7583dc2d.png?compress=1&resize=400x300&vertical=center",
              height: 200,
            ),
            Container(
              color: darkRed,
              child: Center(
                child: Text(
                  character[index].name?? 'none',
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
  );
}