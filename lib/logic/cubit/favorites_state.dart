part of 'favorites_cubit.dart';

@immutable
sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

final class NoCharacterFavorite extends FavoritesInitial {}

final class IsFavorite extends FavoritesInitial {
  final List<String> favorites;

  IsFavorite(this.favorites);
}

final class CharacterFavoriteLoaded extends FavoritesInitial {
  final List<Character> favoritesCharacters;

  CharacterFavoriteLoaded(this.favoritesCharacters);
}
