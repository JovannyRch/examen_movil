import 'package:examen_movil/constants/constants.dart';
import 'package:examen_movil/widgets/gradiant_component.dart';
import 'package:examen_movil/widgets/input_auth.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Size _size;
  TextEditingController _emailCtrl;
  TextEditingController _passwordCtrl;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailCtrl = new TextEditingController();
    _passwordCtrl = new TextEditingController();
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

  Widget _formContainer() {
    return Container(
      width: double.infinity,
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
        onPressed: () => {},
        color: Colors.white,
      ),
    );
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
    );
  }

  Widget _passInput() {
    return InputAuth(
      TextInputType.text,
      _passwordCtrl,
      "Password",
      Icons.lock,
      isPassword: true,
    );
  }
}
