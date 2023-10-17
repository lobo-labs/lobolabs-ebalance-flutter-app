import '../../../data/models/response/sign_in_response.dart';

sealed class SignInEvent {}

class SignInCallEvent extends SignInEvent {
  final String email;
  final String password;
  SignInCallEvent(this.email, this.password);
}
