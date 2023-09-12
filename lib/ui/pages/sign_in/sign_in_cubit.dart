import 'package:bloc/bloc.dart';
import 'package:lobolabs_ebalance_flutter_app/data/models/request/sign_in_request.dart';
import 'package:lobolabs_ebalance_flutter_app/data/repository/auth_repository.dart';
import 'package:lobolabs_ebalance_flutter_app/ui/pages/sign_in/sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  AuthRepository repository = AuthRepository();

  SignInCubit() : super(OnSignInForm());

  Future<void> doLogin(String email, String password) async {
    try {
      emit(OnSignInLoading());
      var response = await repository
          .signIn(SignInRequest(email: email, password: password));
      emit(OnSignInSuccess(response));
    } catch (e) {
      emit(OnSignInError(e.toString()));
    }
  }
}
