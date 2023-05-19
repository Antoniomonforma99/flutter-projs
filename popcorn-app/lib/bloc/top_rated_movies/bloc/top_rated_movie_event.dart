part of 'top_rated_movie_bloc.dart';

@immutable
abstract class TopRatedMovieEvent {}

class FetchTopRatedMovies extends TopRatedMovieEvent {
  FetchTopRatedMovies();
}
