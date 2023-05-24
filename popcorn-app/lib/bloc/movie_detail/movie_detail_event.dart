import 'package:flutter/material.dart';

@immutable
abstract class MovieDetailEvent {}

class FetchMovie extends MovieDetailEvent {
  FetchMovie();
}
