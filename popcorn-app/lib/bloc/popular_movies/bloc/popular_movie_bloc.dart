import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project/bloc/top_rated_movies/bloc/top_rated_movie_bloc.dart';
import 'package:project/model/popular_movie_response.dart';
import 'package:project/repository/movie_repository.dart';

part 'popular_movie_event.dart';
part 'popular_movie_state.dart';

class PopularMovieBloc extends Bloc<PopularMovieEvent, PopularMovieState> {
  final MovieRepository repository;

  PopularMovieBloc(this.repository) : super(PopularMovieInitial()) {
    on<FetchPopularMovies>(_popularMoviesFetched);
  }

  void _popularMoviesFetched(
      FetchPopularMovies event, Emitter<PopularMovieState> emit) async {
    try {
      final popularMovies = await repository.fetchPopularMovies();
      emit(PopularMoviesFetched(popularMovies));
    } on Exception catch (e) {
      emit(PopularMoviesFetchError(e.toString()));
    }
  }
}
