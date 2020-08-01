import 'package:examen_movil/screens/auth/login_screen.dart';
import 'package:examen_movil/screens/home_screen.dart';
import 'package:examen_movil/screens/person/person_details_screen.dart';

import '../screens/auth/login_screen.dart';
import '../screens/home_screen.dart';

final routes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  PersonDetailsScreen.routeName: (context) => PersonDetailsScreen(),
};
