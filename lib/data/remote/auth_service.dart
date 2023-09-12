import 'package:http/http.dart' as http;
import '../models/constants.dart';
import '../models/request/sign_in_request.dart';

class AuthService {
  Future signIn(SignInRequest request) async {
    return await http.post(Uri.https(apiURL, '/sign-in'), body: request);
    // var decode = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    // return decode;
  }
}
