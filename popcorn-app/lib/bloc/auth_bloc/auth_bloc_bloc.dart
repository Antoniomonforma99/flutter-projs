import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project/auth/api_client.dart';
import 'package:project/auth/request_token_response.dart';
import 'package:project/bloc/auth_bloc/auth_bloc_event.dart';
part 'auth_bloc_state.dart';
/*
class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthState> {
  final ApiClient _client;

  AuthBlocBloc(this._client) : super(AuthInitial()) {
    on<AuthUser>(_authAuthenticated);
  }

  void _authAuthenticated(
      AuthUser event, Emitter<AuthAuthenticated> emit) async {
    try {
      final RequestToken token = await _client.getRequestToken();

      final tokenString = token.requestToken;
    } on Exception catch (e) {
      emit(AuthError(e.toString()));
    }
  }
  
}
*/
