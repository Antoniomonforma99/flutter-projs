import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/bloc/latest_movies/bloc/latest_movie_bloc.dart';
import 'package:project/bloc/latest_movies/bloc/latest_movie_event.dart';
import 'package:project/bloc/latest_movies/bloc/latest_movie_state.dart';
import 'package:project/bloc/popular_movies/bloc/popular_movie_bloc.dart';
import 'package:project/bloc/popular_movies/bloc/popular_movie_event.dart';
import 'package:project/bloc/popular_movies/bloc/popular_movie_state.dart';
import 'package:project/bloc/top_rated_movies/bloc/top_rated_movie_bloc.dart';
import 'package:project/bloc/top_rated_movies/bloc/top_rated_movie_event.dart';
import 'package:project/bloc/top_rated_movies/bloc/top_rated_movie_state.dart';
import 'package:project/repository/movie_repository.dart';
import 'package:project/repository/movie_repository_impl.dart';
import 'package:project/ui/screens/error_screen.dart';
import 'package:project/utils/constants.dart' as constants;

import '../../model/movie_response.dart';

class MoviesLandingScreen extends StatefulWidget {
  const MoviesLandingScreen({super.key});

  @override
  State<MoviesLandingScreen> createState() => _MoviesLandingScreenState();
}

class _MoviesLandingScreenState extends State<MoviesLandingScreen> {
  late MovieRepository movieRepository;

  @override
  void initState() {
    super.initState();
    movieRepository = MovieRepositoryImpl();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<TopRatedMovieBloc>(
        create: (BuildContext context) =>
            TopRatedMovieBloc(movieRepository)..add(FetchTopRatedMovies()),
      ),
      BlocProvider<LatestMovieBloc>(
        create: (BuildContext context) =>
            LatestMovieBloc(movieRepository)..add(FetchLatestMovies()),
      ),
      BlocProvider<PopularMovieBloc>(
        create: (BuildContext context) =>
            PopularMovieBloc(movieRepository)..add(FetchPopularMovies()),
      ),
    ], child: _createLandingFullView(context));
  }
}

Widget _createLandingFullView(BuildContext context) {
  return ListView(
    children: [
      const TextView(
        text: constants.topRated,
      ),
      _topRatedMoviesBloc(),
      const TextView(
        text: constants.newMovies,
      ),
      _LatestMoviesBloc(),
      const TextView(
        text: constants.popularMovies,
      ),
      _popularMoviesBloc(),
      const SizedBox(
        height: 20.0,
      )
    ],
  );
}
/*
Widget _createLandingFullView(BuildContext context) {
  return SingleChildScrollView(
      child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      const TextView(
        text: constants.topRated,
      ),
      _topRatedMoviesBloc(),
      const TextView(
        text: constants.newMovies,
      ),
      _LatestMoviesBloc(),
      const TextView(
        text: constants.popularMovies,
      ),
      _popularMoviesBloc(),
    ],
  ));
}
*/

BlocBuilder<PopularMovieBloc, PopularMovieState> _popularMoviesBloc() {
  return BlocBuilder<PopularMovieBloc, PopularMovieState>(
    builder: (context, state) {
      if (state is PopularMovieInitial) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is PopularMoviesFetchError) {
        return ErrorScreen(
            message: state.message,
            retry: () {
              context.watch<PopularMovieBloc>();
            });
      } else if (state is PopularMoviesFetched) {
        return _createList(context, state.movies);
      }
      return const Text('Text not supported');
    },
  );
}

BlocBuilder<LatestMovieBloc, LatestMovieState> _LatestMoviesBloc() {
  return BlocBuilder<LatestMovieBloc, LatestMovieState>(
    builder: (context, state) {
      if (state is LatestMovieInitial) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is LatestMoviesFetchError) {
        return ErrorScreen(
            message: state.message,
            retry: () {
              context.watch<LatestMovieBloc>();
            });
      } else if (state is LatestMoviesFetched) {
        return _createList(context, state.movies);
      }
      return const Text('Text not supported');
    },
  );
}

BlocBuilder<TopRatedMovieBloc, TopRatedMovieState> _topRatedMoviesBloc() {
  return BlocBuilder<TopRatedMovieBloc, TopRatedMovieState>(
    builder: (context, state) {
      if (state is TopRatedMovieInitial) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is TopRatedMovieFetchError) {
        return ErrorScreen(
            message: state.message,
            retry: () {
              context.watch<TopRatedMovieBloc>();
            });
      } else if (state is TopRatedMoviesFetched) {
        return _createList(context, state.movies);
      }
      return const Text('Text not supported');
    },
  );
}

class TextView extends StatelessWidget {
  final String text;
  const TextView({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 15, bottom: 5, left: 20),
      decoration: null,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 00),
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 30.0,
              fontFamily: 'Helvetica',
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

Widget _createList(BuildContext context, List<Movie> movies) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 200.0,
        child: ListView.builder(
            //physics: const ClampingScrollPhysics(),
            //shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      height: 200,
                      image: NetworkImage(constants.baseUrlPosterImage +
                          movies[index].posterPath!),
                      fit: BoxFit.fill,
                    ),
                  ),
                )),
      ),
    ],
  );
}
