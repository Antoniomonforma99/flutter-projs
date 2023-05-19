part of 'popular_movie_bloc.dart';

@immutable
abstract class PopularMovieState {}

class PopularMovieInitial extends PopularMovieState {}

class PopularMoviesFetched extends PopularMovieState {
  final List<PopularMovie> movies;

  PopularMoviesFetched(this.movies);
}

class PopularMoviesFetchError extends PopularMovieState {
  final String message;

  PopularMoviesFetchError(this.message);
}
