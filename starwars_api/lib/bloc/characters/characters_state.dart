import 'package:flutter/cupertino.dart';

import '../../model/character_response.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharacterFetched extends CharactersState {
  final List<Character> characters;

  CharacterFetched(this.characters);
}

class CharactersFetchError extends CharactersState {
  final String message;

  CharactersFetchError(this.message);
}
