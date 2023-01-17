import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokea/Main.dart';
import 'package:pokea/models/PokemonDetail.dart';
import 'package:http/http.dart' as http;

class PokemonDetailPage extends StatefulWidget {
  late final int id;
  PokemonDetailPage(this.id);
  @override
  State createState() => _PokemonDetailPage();
}

class _PokemonDetailPage extends State<PokemonDetailPage> {
  late final int id;
  late Future<PokemonDetail> _pokemon;

  Future<PokemonDetail> _getPokemon(int id) async {
    final response =
        await http.get(Uri.parse("https://pokeapi.co/api/v2/pokemon/$id"));

    PokemonDetail pokemon;

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);

/*
      pokemon = PokemonDetail(
          jsonData["baseExperience"],
          jsonData["abilities"],
          jsonData["forms"],
          jsonData["gameIndices"],
          jsonData["height"],
          jsonData["heldItems"],
          jsonData["id"],
          jsonData["isDefault"],
          jsonData["locationAreaEncounters"],
          jsonData["moves"],
          jsonData["name"],
          jsonData["order"],
          jsonData["pastTypes"],
          jsonData["species"],
          jsonData["sprites"],
          jsonData["stats"],
          jsonData["types"],
          jsonData["weight"]);
          */

      return _pokemon;
    } else {
      throw Exception("Error");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pokemon = _getPokemon(id);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text("Hola")),
      body: Text(id as String),
    ));
  }
}
