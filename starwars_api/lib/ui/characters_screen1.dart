import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars_api/bloc/characters/characters_bloc.dart';
import 'package:starwars_api/bloc/characters/characters_event.dart';
import 'package:starwars_api/repository/characters_repository.dart';
import 'package:starwars_api/repository/characters_repository_impl.dart';

import '../bloc/characters/characters_state.dart';
import 'error_screen.dart';

class CharactersScreenBis extends StatefulWidget {
  const CharactersScreenBis({super.key});

  @override
  State<CharactersScreenBis> createState() => _CharactersScreenBisState();
}

class _CharactersScreenBisState extends State<CharactersScreenBis> {
  late CharacterRepository repository;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  void initState() {
    repository = CharacterRepositoryImpl();
    super.initState();
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

  Widget _createCharacterView()
}
