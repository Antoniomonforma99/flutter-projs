part of 'top_rated_movie_bloc.dart';

@immutable
abstract class TopRatedMovieState {}

class TopRatedMovieInitial extends TopRatedMovieState {}

class TopRatedMoviesFetched extends TopRatedMovieState {
  final List<TopRatedMovie> movies;

  TopRatedMoviesFetched(this.movies);
}

class TopRatedMovieFetchError extends TopRatedMovieState {
  final String message;

  TopRatedMovieFetchError(this.message);
}
