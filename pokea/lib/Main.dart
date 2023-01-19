import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokea/models/Pokemon.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_svg/svg.dart';
import 'package:pokea/models/PokemonDetail.dart';

import 'PokemonDetailPage.dart';
import "string_extension.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Pokemon>> _pokemonList;
  



  Future<List<Pokemon>> _getPokemons() async {
    final response =
        await http.get(Uri.parse("https://pokeapi.co/api/v2/pokemon/"));

    List<Pokemon> pokemons = [];

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);

      for (var item in jsonData["results"]) {
        pokemons.add(Pokemon(item["name"], item["url"]));
      }

      return pokemons;
    } else {
      throw Exception("Error");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pokemonList = _getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/pokemon': (context) => _MyAppState(),
        '/pokemon/$id' :(context) => const 
      },
      title: 'PokeDex',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PokeDex'),
        ),
        body: FutureBuilder(
          future: _pokemonList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.count(
                crossAxisCount: 2,
                children: _listPokemons(snapshot.data),
              );
            } else if (snapshot.hasError) {
              print(snapshot.error);
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
  /*
                child: Image.network(
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/$count.png",
                    fit: BoxFit.fill),
                    */

  List<Widget> _listPokemons(List<Pokemon>? data) {
    List<Widget> poks = [];

    if (data != null) {
      int count = 1;
      for (var pok in data) {
        poks.add(Card(
          child: SizedBox(
            child: InkWell(
                child: Container(
                  child: Column(
                    children: [
                      Expanded(
                          child: SvgPicture.network(
                              "https://raw.githubusercontent.com/PokeAPI/sprites/40e887ff58c6aca87dd593a9ab89a8f95442fd24/sprites/pokemon/other/dream-world/$count.svg")),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          pok.name.capitalize(),
                          style: TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PokemonDetailPage(count),
                    ),
                  );
                }),
          ),
        ));
        count += 1;
      }
    }

    return poks;
  }
}
