import 'package:project/auth/login_request_params.dart';
import 'package:project/repository/authentication_repository.dart';

class LoginUser {
  final AuthenticationRepository _authenticationRepository;

  LoginUser(this._authenticationRepository);

  @override
  Future<bool> call(LoginRequestParams params) async =>
      _authenticationRepository.loginUser(params.toJson());
}
