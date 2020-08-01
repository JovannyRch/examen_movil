import 'package:flutter/material.dart';

Widget customAppBar(String title, {List<Widget> actions}) {
  return AppBar(
    iconTheme: IconThemeData(
      color: Colors.white, //change your color here
    ),
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(color: Colors.white),
    ),
    actions: actions,
  );
}
