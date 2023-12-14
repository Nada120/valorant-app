import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../models/characters_model.dart';
import '../../service/character_favorite.dart';
part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());

  void listFavoriteCharacters(List<Character> characters) async {
    List<String> isFavorites = await getFavoriteCharacters() ?? [];
    List<Character> favoriteCharacters = [];

    for (int index = 0; index < characters.length; index++) {
      if (isFavorites[index] == 'true') {
        favoriteCharacters.add(characters[index]);
      }
    }
    

    if (isFavorites.every((fav) => fav == 'false' || isFavorites.isEmpty)) {
      favoriteCharacters = [];
      emit(NoCharacterFavorite());
    } else {
      emit(CharacterFavoriteLoaded(favoriteCharacters));
    }
  }

  void showFavorites() {
    getFavoriteCharacters().then((isFavorite) {
      emit(IsFavorite(isFavorite!));
    });
  }

  void addToFavorites(List<String> newFavorites) {
    addToFavoriteCharacters(isFavorite: newFavorites);
    emit(IsFavorite(newFavorites));
  }
}
