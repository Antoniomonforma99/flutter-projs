import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project/bloc/movie_detail/movie_detail_event.dart';
import 'package:project/model/movide_detail_response.dart';
import 'package:project/repository/movie_repository.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final MovieRepository repository;

  MovieDetailBloc(this.repository) : super(MovieDetailInitial()) {
    on<FetchMovie>(_movieFetched);
  }

  void _movieFetched(FetchMovie event, Emitter<MovieDetailState> emit) async {
    try {
      final movie = await repository.fetchMovie(event.movieId);
      emit(MovieDetailFetched(movie));
    } on Exception catch (e) {
      emit(MovieDetailFetchError(e.toString()));
    }
  }
}
