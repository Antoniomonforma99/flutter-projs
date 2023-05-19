part of 'latest_movie_bloc.dart';

@immutable
abstract class LatestMovieEvent {}

class FetchLatestMovies extends LatestMovieEvent {
  FetchLatestMovies();
}
