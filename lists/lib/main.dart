import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});
  /*
  late Future<List> futureList;
  */

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var data;
  fetchPokemon() async {
    final response = await http.get(
        Uri.parse("https://pokeapi.co/api/v2/pokemon/?offset=20&limit=20"));

    if (response.statusCode == 200) {
      data = (jsonDecode(response.body));
      // If the server did return a 200 OK response,
      // then parse the JSON.
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load pokeapi');
    }
  }

/*
  late Future futurePokemon;
*/
  @override
  void initState() {
    super.initState();
    /*
    Future data = fetchPokemon();
    */
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
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text('Loading');
                  } else {
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              children: [
                                Text('' +
                                    data['results'][index]['name'].toString()),
                              ],
                            ),
                          );
                        });
                  }
                },
              ))
            ],
          )),
    );
  }
}
