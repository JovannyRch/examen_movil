import 'package:shared_preferences/shared_preferences.dart';

class UserPrefrences {
  static final UserPrefrences _instance = new UserPrefrences._internal();
  bool _user;

  UserPrefrences._internal();
  SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get username {
    return _prefs.getString("username") ?? '';
  }

  set username(String name) {
    _prefs.setString('username', name);
  }

  get token {
    return _prefs.getInt('token') ?? "";
  }

  set token(String token) {
    _prefs.setString('token', token);
  }

  get isLogged {
    return !this.username.isEmpty;
  }

  factory UserPrefrences() {
    return _instance;
  }
}
