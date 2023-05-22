import 'package:flutter/material.dart';

@immutable
abstract class TopRatedMovieEvent {}

class FetchTopRatedMovies extends TopRatedMovieEvent {
  FetchTopRatedMovies();
}
