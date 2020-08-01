import 'package:examen_movil/constants/constants.dart';
import 'package:examen_movil/widgets/gradiant_component.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          _emailInput(),
        ],
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: "Correo electrónico",
          focusColor: kBaseColor,
        ),
      ),
    );
  }
}
