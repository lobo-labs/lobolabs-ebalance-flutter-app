
import '../../../data/models/response/sign_in_response.dart';

sealed class SignInState { }

class SignInFormState extends SignInState { }
class SignInLoadingState extends SignInState { }
class SignInSuccessState extends SignInState {
  final SignInResponse response;
  SignInSuccessState(this.response);
}

class SignInErrorState extends SignInState {
  final String error;
  SignInErrorState(this.error);
}
