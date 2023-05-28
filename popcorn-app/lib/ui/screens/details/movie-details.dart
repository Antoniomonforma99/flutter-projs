import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:project/bloc/movie_detail/movie_detail_event.dart';
import 'package:project/model/movide_detail_response.dart';
import 'package:project/repository/movie_repository.dart';
import 'package:project/repository/movie_repository_impl.dart';
import 'package:project/ui/screens/error_screen.dart';
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
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(scaffoldBackgroundColor: Colors.black.withOpacity(0.8)),
    home: Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.8,
            child: Image(
              image: NetworkImage(
                  constants.baseUrlPosterImage + movie.posterPath!),
              height: 280,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: SafeArea(
                child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Row(children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ]),
                ),
                SizedBox(height: 60),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                            image: NetworkImage(constants.baseUrlPosterImage +
                                movie.posterPath!),
                            height: 250,
                            width: 180,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 50, top: 10),
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.orange,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.orange.withOpacity(0.6),
                                spreadRadius: 2,
                                blurRadius: 8,
                              )
                            ]),
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
          )
        ],
      ),
    ),
  );
}
