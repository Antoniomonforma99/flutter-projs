import 'dart:convert';
import 'package:http/http.dart';
import 'package:starwars_api/model/character_response.dart';
import 'package:starwars_api/repository/characters_repository.dart';

class CharacterRepositoryImpl extends CharacterRepository {
  final Client _client = Client();

  @override
  Future<List<Character>> fetchCharacters() async {
    final response =
        await _client.get(Uri.parse('https://swapi.dev/api/people'));

    if (response.statusCode == 200) {
      return CharacterResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('Fail to load characters');
    }
  }
}
