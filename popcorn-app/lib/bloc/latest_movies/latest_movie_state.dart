import 'package:flutter/foundation.dart';
import 'package:project/model/movie_response.dart';

@immutable
abstract class LatestMovieState {}

class LatestMovieInitial extends LatestMovieState {}

class LatestMoviesFetched extends LatestMovieState {
  final List<Movie> movies;

  LatestMoviesFetched(this.movies);
}

class LatestMoviesFetchError extends LatestMovieState {
  final String message;

  LatestMoviesFetchError(this.message);
}
