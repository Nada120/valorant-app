import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../models/characters_model.dart';
import '../../service/characters_service.dart';
part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {

  CharactersCubit() : super(CharactersInitial());

  void getAllCharacters() {
    CharacterService().getCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      
    }).onError((_, __) {
      emit(CharactersFail());
    });

    emit(CharactersLoading());
  }
}
