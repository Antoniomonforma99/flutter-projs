import 'package:flutter/cupertino.dart';
import 'package:project/model/movie_response.dart';

@immutable
abstract class PopularMovieState {}

class PopularMovieInitial extends PopularMovieState {}

class PopularMoviesFetched extends PopularMovieState {
  final List<Movie> movies;

  PopularMoviesFetched(this.movies);
}

class PopularMoviesFetchError extends PopularMovieState {
  final String message;

  PopularMoviesFetchError(this.message);
}
