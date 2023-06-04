import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:project/auth/request_token_response.dart';
import 'package:project/utils/constants.dart' as constants;

class ApiClient {
  final Client _client = Client();

  Future<RequestToken> getRequestToken() async {
    final response = await _client.get(
      Uri.parse(
          'https://api.themoviedb.org/3/authentication/token/new?api_key=${constants.apiKey}'),
      headers: {
        'Authorization': 'Bearer ${constants.accessToken}',
        'accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return RequestToken.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
