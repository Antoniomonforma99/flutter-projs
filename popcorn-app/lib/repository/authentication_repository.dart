abstract class AuthenticationRepository {
  Future<bool> loginUser(Map<String, dynamic> params);

  Future<void> logoutUser();

  Future<void> saveSessionId(String sessionId);
  Future<String?> getSessionId();
  Future<void> deleteSessionId();
}
