import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

/*
class Pokemon {
  int count;
  String next;
  Null previous;
  List<Results> results;

  Pokemon(
      {this.count,
      this.next,
      this.previous,
      this.results});

  Pokemon.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String name;
  String url;

  Results({this.name, this.url});

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
*/

Future<dynamic> fetchPokemon() async {
  List pokemons = [];
  final response =
      await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon'));

  if (response.statusCode == 200) {
    pokemons = (jsonDecode(response.body));
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return pokemons;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load pokeapi');
  }
}

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  App({super.key});
  /*
  late Future<List> futureList;
  */

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late Future futurePokemon;

  @override
  void initState() {
    super.initState();
    Future pokemons = fetchPokemon();
  }

  @override
  Widget build(BuildContext context) {
    const title = "Ejemplo de listas";

    return MaterialApp(
      title: title,
      home: Scaffold(
          appBar: AppBar(
            title: const Text(title),
          ),
          body: Column(
            //Numero de columnas
            children: [
              Expanded(
                  child: FutureBuilder(
                future: fetchPokemon(),
                builder: (context, snapshot) {
                  List pokemons = snapshot.data['results'];

                  if (!snapshot.hasData) {
                    return Text('Loading');
                  } else {
                    return ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Card(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [Text('' + pokemons[index]['name'])],
                            ),
                          ));
                        });
                  }
                },
              ))
            ],
          )),
    );
  }
}
