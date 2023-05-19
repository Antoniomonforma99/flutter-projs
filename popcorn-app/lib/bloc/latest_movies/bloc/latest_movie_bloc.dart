import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:project/bloc/top_rated_movies/bloc/top_rated_movie_bloc.dart';
import 'package:project/model/latest_movie_response.dart';
import 'package:project/repository/movie_repository.dart';

part 'latest_movie_event.dart';
part 'latest_movie_state.dart';

class LatestMovieBloc extends Bloc<LatestMovieEvent, LatestMovieState> {
  final MovieRepository repository;

  LatestMovieBloc(this.repository) : super(LatestMovieInitial()) {
    on<FetchLatestMovies>(_latestMoviesFetched);
  }

  void _latestMoviesFetched(
      FetchLatestMovies event, Emitter<LatestMovieState> emit) async {
    try {
      final latestMovies = await repository.fetchLatestsMovies();
      emit(LatestMoviesFetched(latestMovies));
    } on Exception catch (e) {
      emit(LatestMoviesFetchError(e.toString()));
    }
  }
}
