import 'package:flutter/material.dart';
import 'package:project/model/movide_detail_response.dart';
import 'package:project/repository/movie_repository.dart';
import 'package:project/repository/movie_repository_impl.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({super.key});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  late MovieRepository repository;

  late String _movie_id;

  late FutureMovieDetail movie;

  @override
  void initState() {
    super.initState();
    repository = MovieRepositoryImpl();
    movie = repository.fetchMovie(_movie_id);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
