import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars_api/bloc/characters/characters_state.dart';
import 'package:starwars_api/repository/characters_repository.dart';

import 'characters_event.dart';

class CharactersBloc extends Bloc<CharactersEvents, CharactersState> {
  final CharacterRepository repository;

  CharactersBloc(this.repository) : super(CharactersInitial()) {
    on<FetchCharacters>(_charactersFetched);
  }

  void _charactersFetched(
      FetchCharacters event, Emitter<CharactersState> emit) async {
    try {
      final characters = await repository.fetchCharacters();
      emit(CharacterFetched(characters));
      return;
    } on Exception catch (e) {
      emit(CharactersFetchError(e.toString()));
    }
  }
}
