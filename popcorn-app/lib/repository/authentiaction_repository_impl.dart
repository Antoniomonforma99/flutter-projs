import 'package:hive/hive.dart';
import 'package:project/auth/api_client.dart';
import 'package:project/repository/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final ApiClient _client = ApiClient();

  @override
  Future<bool> loginUser(Map<String, dynamic> params) async {
    final requesTokenResponse = await _client.getRequestToken();

    final token = requesTokenResponse.requestToken;

    try {
      params.putIfAbsent("request_token", () => token);

      final validateWithLoginToken = await _client.validateWithLogin(params);

      final sessionId =
          await _client.createSession(validateWithLoginToken.toJson());

      if (sessionId != null) {
        await saveSessionId(sessionId.toString());
      }

      return true;
    } on Exception {
      return false;
    }
  }

  @override
  Future<void> logoutUser() {}

  @override
  Future<void> deleteSessionId() async {
    print('delete session - local');
    final authenticationBox = await Hive.openBox('authenticationBox');
    authenticationBox.delete('session_id');
  }

  @override
  Future<String?> getSessionId() async {
    final authenticationBox = await Hive.openBox('authenticationBox');
    return await authenticationBox.get('session_id');
  }

  @override
  Future<void> saveSessionId(String sessionId) async {
    final authenticationBox = await Hive.openBox('authenticationBox');
    return await authenticationBox.put('session_id', sessionId);
  }
}
