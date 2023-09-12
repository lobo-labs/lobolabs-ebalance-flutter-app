import 'package:shared_preferences/shared_preferences.dart';

class SharedData {

  late SharedPreferences? preferences;

  _getPreferences() async {
    preferences ??= await SharedPreferences.getInstance();
  }
  Future<String?> getToken() async {
    return await _getPreferences().getString('jwt');
  }

  Future<bool> hasToken() async {
    var token = await getToken();
    return token != null;
  }

  clear() async {
    await _getPreferences().setString('jwt', null);
  }
}
