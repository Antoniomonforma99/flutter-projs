import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:project/bloc/popular_movies/bloc/popular_movie_event.dart';
import 'package:project/bloc/popular_movies/bloc/popular_movie_state.dart';
import 'package:project/repository/movie_repository.dart';

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
