import 'package:lobolabs_ebalance_flutter_app/data/models/request/sign_in_request.dart';
import 'package:lobolabs_ebalance_flutter_app/data/remote/auth_service.dart';

class AuthRepository {
  AuthService service = AuthService();

  Future signIn(SignInRequest request) {
    return service.signIn(request);
  }
}
