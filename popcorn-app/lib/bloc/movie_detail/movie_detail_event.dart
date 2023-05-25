import 'package:flutter/material.dart';

@immutable
abstract class MovieDetailEvent {}

class FetchMovie extends MovieDetailEvent {
  final String movieId;
  FetchMovie(this.movieId);
}
