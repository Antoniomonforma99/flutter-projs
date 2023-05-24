part of 'movie_detail_bloc.dart';

@immutable
abstract class MovieDetailState {}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailFetched extends MovieDetailInitial {
  final MovieDetail movie;

  MovieDetailFetched(this.movie);
}

class MovieDetailFetchError extends MovieDetailState {
  final String message;

  MovieDetailFetchError(this.message);
}
