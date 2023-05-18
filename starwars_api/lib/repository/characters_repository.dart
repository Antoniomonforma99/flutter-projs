import 'package:starwars_api/model/character_response.dart';

abstract class CharacterRepository {
  Future<List<Character>> fetchCharacters();
}
