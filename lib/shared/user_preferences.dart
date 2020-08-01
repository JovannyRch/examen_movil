import 'package:shared_preferences/shared_preferences.dart';

class UserPrefrences {
  static final UserPrefrences _instance = new UserPrefrences._internal();

  UserPrefrences._internal();
  SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get email {
    return _prefs.getString("email") ?? '';
  }

  set email(String name) {
    _prefs.setString('email', name);
  }

  get token {
    return _prefs.getInt('token') ?? "";
  }

  set token(String token) {
    _prefs.setString('token', token);
  }

  get isLogged {
    return !this.email.isEmpty;
  }

  factory UserPrefrences() {
    return _instance;
  }
}
