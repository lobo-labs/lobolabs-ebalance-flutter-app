
import 'dart:convert';

import 'package:pretty_http_logger/pretty_http_logger.dart';
import '../models/constants.dart';
import '../models/request/sign_in_request.dart';

class AuthService {
  Future signIn(SignInRequest request) async {
    HttpWithMiddleware http = HttpWithMiddleware.build(
        requestTimeout: const Duration(seconds: 60),
        middlewares: [
          HttpLogger(logLevel: LogLevel.BODY),
        ]);
    Map<String, String> headers = {"Content-type": "application/json"};
    var response = await http.post(Uri.https(apiURL, '/api/sign-in'), headers: headers, body: request.toJson());
    var decode = jsonDecode(utf8.decode(response.bodyBytes));
    return decode;
  }
}
