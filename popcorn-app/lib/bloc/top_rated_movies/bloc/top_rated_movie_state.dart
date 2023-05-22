import 'package:flutter/material.dart';
import 'package:project/model/movie_response.dart';

@immutable
abstract class TopRatedMovieState {}

class TopRatedMovieInitial extends TopRatedMovieState {}

class TopRatedMoviesFetched extends TopRatedMovieState {
  final List<Movie> movies;

  TopRatedMoviesFetched(this.movies);
}

class TopRatedMovieFetchError extends TopRatedMovieState {
  final String message;

  TopRatedMovieFetchError(this.message);
}
