import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:project/bloc/movie_detail/movie_detail_event.dart';
import 'package:project/model/movide_detail_response.dart';
import 'package:project/repository/movie_repository.dart';
import 'package:project/repository/movie_repository_impl.dart';
import 'package:project/ui/screens/error_screen.dart';
import 'package:project/ui/widgets/HeaderAndRating.dart';
import 'package:project/utils/constants.dart' as constants;

class MovieDetails extends StatefulWidget {
  final String movieId;

  const MovieDetails({super.key, required this.movieId});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  late MovieRepository repository;

  late MovieDetail movie;

  @override
  void initState() {
    super.initState();
    repository = MovieRepositoryImpl();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          MovieDetailBloc(repository)..add(FetchMovie(widget.movieId)),
      child: _createMovieDetailFullView(context),
    );
  }
}

Widget _createMovieDetailFullView(BuildContext context) {
  return _movieDetailBloc();
}

BlocBuilder<MovieDetailBloc, MovieDetailState> _movieDetailBloc() {
  return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      builder: (context, state) {
    if (state is MovieDetailInitial) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is MovieDetailFetchError) {
      return ErrorScreen(
          message: state.message,
          retry: () {
            context.watch<MovieDetailBloc>();
          });
    } else if (state is MovieDetailFetched) {
      return _createDescription(context, state.movie);
    }
    return const Text('Text not supported');
  });
}

Widget _createDescription(BuildContext context, MovieDetail movie) {
  Size size = MediaQuery.of(context).size;
  return Scaffold(
    body: Body(movie: movie),
  );
}

class Body extends StatelessWidget {
  final MovieDetail movie;
  const Body({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderAndRating(size: size, movie: movie),
        ],
      ),
    );
  }
}
