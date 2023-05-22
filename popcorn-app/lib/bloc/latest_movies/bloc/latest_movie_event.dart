import 'package:flutter/material.dart';

@immutable
abstract class LatestMovieEvent {}

class FetchLatestMovies extends LatestMovieEvent {
  FetchLatestMovies();
}
