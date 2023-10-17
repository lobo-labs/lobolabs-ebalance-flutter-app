import 'package:bloc/bloc.dart';
import 'package:lobolabs_ebalance_flutter_app/data/models/request/sign_in_request.dart';
import 'package:lobolabs_ebalance_flutter_app/data/repository/auth_repository.dart';
import 'package:lobolabs_ebalance_flutter_app/ui/pages/sign_in/sign_in_event.dart';
import 'package:lobolabs_ebalance_flutter_app/ui/pages/sign_in/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {

  SignInBloc() : super(SignInFormState()) {
    on<SignInCallEvent>(_onSignInCallEvent);
  }

  final AuthRepository repository = AuthRepository();

  Future<void> _onSignInCallEvent(SignInCallEvent event, Emitter<SignInState> emit) async {
    try {
      emit(SignInLoadingState());
      var request = SignInRequest(email: event.email, password: event.password);
      print("Request: $request");
      var response = await repository.signIn(request);
      emit(SignInSuccessState(response));
    } catch (e) {
      print("Erro: $e");
      emit(SignInErrorState(e.toString()));
    }
  }
}
