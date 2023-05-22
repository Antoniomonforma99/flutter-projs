import 'package:bloc/bloc.dart';
import 'package:project/repository/movie_repository.dart';

import 'latest_movie_event.dart';
import 'latest_movie_state.dart';

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
