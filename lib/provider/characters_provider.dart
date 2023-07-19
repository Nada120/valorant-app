
import 'package:flutter/material.dart';
import 'package:valorant_app/constant/colors.dart';
import '../models/characters_model.dart';
import '../service/characters_service.dart';
import '../widget/custom_loading.dart';

class CharactersProvider extends ChangeNotifier {
  List<Character> characters = [];

  void fetchData() async {
    CharacterService service = CharacterService();
    characters = await service.getCharacters();
  }

  Widget isLoading() {
    return CustomLoading(
      size: 30,
      colors: [teal, brightRed, Colors.white],
    );
  }
}