import 'package:flutter/material.dart';

@immutable
abstract class PopularMovieEvent {}

class FetchPopularMovies extends PopularMovieEvent {
  FetchPopularMovies();
}
