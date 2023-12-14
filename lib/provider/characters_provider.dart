
import 'package:flutter/material.dart';
import 'package:valorant_app/constant/colors.dart';
import '../models/characters_model.dart';
import '../service/characters_service.dart';
import '../widget/global/custom_loading.dart';

class CharactersProvider extends ChangeNotifier {
  List<Character> characters = [];  
  //List<Character> get character => characters;
  
  set character(List<Character> ch) {
    characters = ch;
    notifyListeners();
  }

  void fetchData() async {
    CharacterService service = CharacterService();
    List<Character> ch = await service.getCharacters();
    characters = ch;
    notifyListeners();
  }

  Widget isLoading() {
    return CustomLoading(
      size: 30,
      colors: [teal, brightRed, Colors.white],
    );
  }
}