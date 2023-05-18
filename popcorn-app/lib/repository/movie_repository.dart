import 'package:project/model/top_rated_movie_response.dart';

abstract class MovieRepository {
  Future<List<TopRatedMovie>> fetchTopRatedMovies();
}
