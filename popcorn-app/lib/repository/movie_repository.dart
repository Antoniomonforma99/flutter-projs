import 'package:project/model/movide_detail_response.dart';
import 'package:project/model/movie_response.dart';

abstract class MovieRepository {
  Future<List<Movie>> fetchTopRatedMovies();

  Future<List<Movie>> fetchLatestsMovies();

  Future<List<Movie>> fetchPopularMovies();

  Future<MovieDetail> fetchMovie(String id);
}
