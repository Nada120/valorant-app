part of 'characters_cubit.dart';

@immutable
sealed class CharactersState {}

final class CharactersInitial extends CharactersState {}

final class CharactersLoaded extends CharactersInitial {
  final List<Character> characters;

  CharactersLoaded(this.characters);
}

final class CharactersLoading extends CharactersInitial {}

final class CharactersFail extends CharactersInitial {}
