import 'package:examen_movil/const/const.dart';
import 'package:examen_movil/utils/validatorsAuth.dart';
import 'package:examen_movil/widgets/gradiant_component.dart';
import 'package:examen_movil/widgets/input_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

import '../../shared/user_preferences.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Size _size;
  TextEditingController _emailCtrl;
  TextEditingController _passwordCtrl;
  UserPrefrences _userPrefrences;
  LocalAuthentication _authentication = new LocalAuthentication();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailCtrl = new TextEditingController();
    _passwordCtrl = new TextEditingController();
    _userPrefrences = new UserPrefrences();
    _authenticate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradiantWidget(),
          _formContainer(),
        ],
      ),
    );
  }

  Future<void> _authenticate() async {
    bool isAuthenticated = false;
    try {
      isAuthenticated = await _authentication.authenticateWithBiometrics(
        localizedReason: "Inicia sesión con tu huella",
        useErrorDialogs: true,
        stickyAuth: false,
      );
      if (isAuthenticated) {
        Navigator.pushNamed(context, "/home");
      } //print(isAuthenticated);
    } on PlatformException catch (e) {
      //print(e);
    }
  }

  Widget _formContainer() {
    return Container(
      width: double.infinity,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _title(),
            SizedBox(height: 80.0),
            _emailInput(),
            _passInput(),
            _buttonLogin(),
          ],
        ),
      ),
    );
  }

  Widget _buttonLogin() {
    return Container(
      width: _size.width * 0.75,
      margin: EdgeInsets.only(top: 20.0),
      child: RaisedButton(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          //side: BorderSide(color: kBaseColor.withOpacity(0.5)),
        ),
        child: Text(
          "Login",
          style: TextStyle(
            color: kBaseColor,
            fontSize: 20.0,
          ),
        ),
        onPressed: onLogin,
        color: Colors.white,
      ),
    );
  }

  void onLogin() {
    if (_formKey.currentState.validate()) {
      //Save user session
      _userPrefrences.email = _emailCtrl.text;
      //Go home screen
      Navigator.pushNamed(context, "/home");
    }
  }

  Widget _title() {
    return Container(
        child: Text(
      "My App",
      style: TextStyle(color: Colors.white, fontSize: 50.0),
      textAlign: TextAlign.center,
    ));
  }

  Widget _emailInput() {
    return InputAuth(
      TextInputType.emailAddress,
      _emailCtrl,
      "Email address",
      Icons.email,
      validatorEmail,
    );
  }

  Widget _passInput() {
    return InputAuth(
      TextInputType.text,
      _passwordCtrl,
      "Password",
      Icons.lock,
      validatorPassword,
      isPassword: true,
    );
  }
}
