part of 'latest_movie_bloc.dart';

@immutable
abstract class LatestMovieState {}

class LatestMovieInitial extends LatestMovieState {}

class LatestMoviesFetched extends LatestMovieState {
  final List<LatestMovie> movies;

  LatestMoviesFetched(this.movies);
}

class LatestMoviesFetchError extends LatestMovieState {
  final String message;

  LatestMoviesFetchError(this.message);
}
