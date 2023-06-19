import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:project/auth/create_session_response.dart';
import 'package:project/auth/request_token_response.dart';
import 'package:project/utils/constants.dart' as constants;

class ApiClient {
  final Client _client = Client();

  dynamic get(String path, {Map<dynamic, dynamic>? params}) async {
    await Future.delayed(Duration(milliseconds: 500));
    final response = await _client.get(
      getPath(path, params),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic post(String path, {Map<dynamic, dynamic>? params}) async {
    final response = await _client.post(
      getPath(path, null),
      body: jsonEncode(params),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      throw Exception();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic deleteWithBody(String path, {Map<dynamic, dynamic>? params}) async {
    Request request = Request('DELETE', getPath(path, null));
    request.headers['Content-Type'] = 'application/json';
    request.body = jsonEncode(params);
    final response = await _client.send(request).then(
          (value) => Response.fromStream(value),
        );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      throw Exception();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Uri getPath(String path, Map<dynamic, dynamic>? params) {
    var paramsString = '';
    if (params?.isNotEmpty ?? false) {
      params?.forEach((key, value) {
        paramsString += '&$key=$value';
      });
    }

    return Uri.parse(
        '${constants.baseUrl}$path?api_key=${constants.apiKey}$paramsString');
  }

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

  Future<RequestToken> validateWithLogin(
      Map<String, dynamic> requestBody) async {
    final response = await _client.post(
      Uri.parse('authentication/token/validate_with_login'),
      headers: {
        'Authorization': 'Bearer ${constants.accessToken}',
        'accept': 'application/json',
      },
      body: requestBody,
    );

    return RequestToken.fromJson(response as Map<String, dynamic>);
  }

  Future<SessionResponse?> createSession(
      Map<String, dynamic> requestBody) async {
    final response = await _client.post(
      Uri.parse('https://api.themoviedb.org/3authentication/session/new'),
      headers: {
        'Authorization': 'Bearer ${constants.accessToken}',
        'accept': 'application/json',
      },
      body: requestBody,
    );

    return SessionResponse.fromJson(response as Map<String, dynamic>);
  }

  Future<bool> deleteSession(String sessionId) async {
    final response = await _client.deleteWithBody(
      'authentication/session',
      params: {
        'session_id': sessionId,
      },
    );
    return response['success'] ?? false;
  }
}
