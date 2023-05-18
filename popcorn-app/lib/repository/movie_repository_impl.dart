import 'dart:convert';

import 'package:http/http.dart';
import 'package:project/model/top_rated_movie_response.dart';
import 'package:project/repository/movie_repository.dart';

import 'package:project/utils/constants.dart' as constants;

class MovieRepositoryImpl extends MovieRepository {
  final Client _client = Client();

  @override
  Future<List<TopRatedMovie>> fetchTopRatedMovies() async {
    final response = await _client.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=${constants.apiKey}'));

    if (response.statusCode == 200) {
      return TopRatedMovieResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('An error occured loading top rated movies');
    }
  }
}
