import 'dart:convert';
import 'package:http/http.dart';
import 'package:project/model/movide_detail_response.dart';
import 'package:project/model/movie_response.dart';
import 'package:project/repository/movie_repository.dart';

import 'package:project/utils/constants.dart' as constants;

class MovieRepositoryImpl extends MovieRepository {
  final Client _client = Client();

  @override
  Future<List<Movie>> fetchTopRatedMovies() async {
    final response = await _client.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=${constants.apiKey}'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('An error occured loading top rated movies');
    }
  }

  @override
  Future<List<Movie>> fetchLatestsMovies() async {
    final response = await _client.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=${constants.apiKey}'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('An error occured loading top rated movies');
    }
  }

  @override
  Future<List<Movie>> fetchPopularMovies() async {
    final response = await _client.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=${constants.apiKey}'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('An error occured loading top rated movies');
    }
  }

  @override
  Future<MovieDetail> fetchMovie(String id) async {
    final response = await _client.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/$id?api_key=${constants.apiKey}'));

    if (response.statusCode == 200) {
      return MovieDetail.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('An error occured loading movie with id $id');
    }
  }

  @override
  Future<MovieDetail> addToWatchList(String id) async {
    final response = await _client.post(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/$id?api_key=${constants.apiKey}'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, dynamic>{
          'media_type': "movie",
          'media_id': id,
          'watchlist': true
        }));
    if (response.statusCode == 200) {
      return MovieDetail.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('An error occured loading movie with id $id');
    }
  }
}
