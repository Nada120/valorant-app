import 'package:shared_preferences/shared_preferences.dart';

void addToFavoriteCharacters({required List<String> isFavorite}) async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  sp.setStringList('isFavorite', isFavorite);
}

Future<List<String>?> getFavoriteCharacters() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  List<String>? allFavorites = sp.getStringList('isFavorite');
  
  return allFavorites; 
}

