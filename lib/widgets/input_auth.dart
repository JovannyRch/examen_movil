import 'package:flutter/material.dart';

class InputAuth extends StatelessWidget {
  final TextInputType type;
  final TextEditingController controller;
  final String labeltext;
  final IconData icon;
  final bool isPassword;
  Size _size;

  InputAuth(this.type, this.controller, this.labeltext, this.icon,
      {this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    final noBorder = BorderSide(
      color: Colors.transparent,
    );
    _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width * 0.80,
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
      margin: EdgeInsets.only(bottom: 30.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: Colors.white,
          )),
      child: TextField(
        obscureText: isPassword,
        keyboardType: type,
        controller: controller,
        style: TextStyle(color: Colors.green),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: noBorder,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: noBorder,
          ),
          focusColor: Colors.white,
          labelText: labeltext,
          labelStyle: TextStyle(color: Colors.white),
          prefixIcon: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
