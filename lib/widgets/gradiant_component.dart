import 'package:examen_movil/constants/constants.dart';
import 'package:flutter/material.dart';

class GradiantWidget extends StatelessWidget {
  const GradiantWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            kBaseColor,
            kBaseColor.withOpacity(0.9),
            kBaseColor.withOpacity(0.8),
            kBaseColor.withOpacity(0.7),
          ],
        ),
      ),
    );
  }
}
