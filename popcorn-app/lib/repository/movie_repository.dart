import 'package:project/model/latest_movie_response.dart';
import 'package:project/model/popular_movie_response.dart';
import 'package:project/model/top_rated_movie_response.dart';

abstract class MovieRepository {
  Future<List<TopRatedMovie>> fetchTopRatedMovies();

  Future<List<LatestMovie>> fetchLatestsMovies();

  Future<List<PopularMovie>> fetchPopularMovies();
}
