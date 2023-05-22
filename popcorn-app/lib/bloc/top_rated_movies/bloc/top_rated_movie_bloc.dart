import 'package:bloc/bloc.dart';
import 'package:project/bloc/top_rated_movies/bloc/top_rated_movie_event.dart';
import 'package:project/bloc/top_rated_movies/bloc/top_rated_movie_state.dart';
import 'package:project/repository/movie_repository.dart';

class TopRatedMovieBloc extends Bloc<TopRatedMovieEvent, TopRatedMovieState> {
  final MovieRepository repository;

  TopRatedMovieBloc(this.repository) : super(TopRatedMovieInitial()) {
    on<FetchTopRatedMovies>(_topRatedMoviesFetched);
  }

  void _topRatedMoviesFetched(
      FetchTopRatedMovies event, Emitter<TopRatedMovieState> emit) async {
    try {
      final topRatedMovies = await repository.fetchTopRatedMovies();

      emit(TopRatedMoviesFetched(topRatedMovies));
      return;
    } on Exception catch (e) {
      emit(TopRatedMovieFetchError(e.toString()));
    }
  }
}
