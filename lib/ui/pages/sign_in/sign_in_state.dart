
import 'package:lobolabs_ebalance_flutter_app/data/models/response/sign_in_response.dart';

sealed class SignInState { }

class OnSignInForm extends SignInState { }
class OnSignInLoading extends SignInState { }

class OnSignInSuccess extends SignInState {
    final SignInResponse response;
    OnSignInSuccess(this.response);
}

class OnSignInError extends SignInState {
  final String error;
  OnSignInError(this.error);
}
