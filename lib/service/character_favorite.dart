import 'package:shared_preferences/shared_preferences.dart';
import 'characters_service.dart';

void addToFavoriteCharacters({required List<String> isFavorite}) async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  sp.setStringList('isFavorite', isFavorite);
}

Future<List<String>?> getFavoriteCharacters() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  List<String>? allFavorites = sp.getStringList('isFavorite');
  
  if (allFavorites == null) {
    var characters = await CharacterService().getCharacters();
    allFavorites = characters.map((e) => e.isFavorite).toList();
    addToFavoriteCharacters(isFavorite: allFavorites);
  }

  return allFavorites;
}
