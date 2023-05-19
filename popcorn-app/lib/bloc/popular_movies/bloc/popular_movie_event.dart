part of 'popular_movie_bloc.dart';

@immutable
abstract class PopularMovieEvent {}

class FetchPopularMovies extends PopularMovieEvent {
  FetchPopularMovies();
}
