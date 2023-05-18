import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:starwars_api/bloc/characters/characters_bloc.dart';
import 'package:starwars_api/bloc/characters/characters_event.dart';
import 'package:starwars_api/bloc/characters/characters_state.dart';
import 'package:starwars_api/repository/characters_repository.dart';
import 'package:starwars_api/repository/characters_repository_impl.dart';
import 'package:starwars_api/ui/error_screen.dart';

import '../model/character_response.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late CharacterRepository repository;

  @override
  void initState() {
    super.initState();
    repository = CharacterRepositoryImpl();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return CharactersBloc(repository)..add(FetchCharacters());
      },
      child: Scaffold(body: _createCharacter(context)),
    );
  }

//Gestiona los estados y las pantallas
  Widget _createCharacter(BuildContext context) {
    return BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
      if (state is CharactersInitial) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is CharactersFetchError) {
        return ErrorScreen(
          message: state.message,
          retry: () {
            context.watch<CharactersBloc>().add(FetchCharacters());
          },
        );
      } else if (state is CharacterFetched) {
        return _createCharacterView(context, state.characters);
      } else {
        return const Text('Not support');
      }
    });
  }

  Widget _createCharacterView(
      BuildContext context, List<Character> characters) {
    //final contentHeight = 4.0 * (MediaQuery.of(context).size.width / 2.4) / 3;
    const contentHeight = double.infinity;

    return Container(
      color: Colors.yellow,
      height: double.infinity,
      child: SizedBox(
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 20.0, right: 16.0),
              height: 50,
              color: Colors.blue,
              child: Row(
                children: const <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Characters',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16.0,
                        fontFamily: 'Muli',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward, color: Colors.red),
                ],
              ),
            ),
            Container(
              color: Colors.orange,
              height: 776,
              child: Center(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return _createCharacterViewItem(context, characters[index]);
                  },
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const VerticalDivider(
                    color: Colors.transparent,
                    width: 6.0,
                  ),
                  itemCount: characters.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createCharacterViewItem(BuildContext context, Character character) {
    final width = MediaQuery.of(context).size.width / 2.6;
    return Container(
        color: Colors.red,
        width: width,
        height: 400,
        padding: const EdgeInsets.only(bottom: 20.0),
        child: GestureDetector(
          onTap: () => context.go('/details'),
          child: SizedBox(
            height: 200,
            child: Card(
              elevation: 10.0,
              borderOnForeground: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                children: [
                  Text(character.name),
                  CachedNetworkImage(
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    imageUrl: getImage(character.url),
                    width: width,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ),
          ),
        ));
  }

  String getImage(String url) {
    return "";
  }
}
