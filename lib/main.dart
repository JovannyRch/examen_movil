import 'package:examen_movil/const/const.dart';
import 'package:examen_movil/routes/routes.dart';
import 'package:examen_movil/shared/user_preferences.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  UserPrefrences userPrefrences = new UserPrefrences();
  await userPrefrences.initPrefs();

  //Validamos si el usuario esta ya autentificado
  String initialRoute;
  if (userPrefrences.isLogged) {
    initialRoute = "/home";
  } else {
    initialRoute = "/login";
  }

  runApp(MyApp(initialRoute));
}

class MyApp extends StatelessWidget {
  final initialRoute;
  MyApp(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kBaseColor,
        scaffoldBackgroundColor: Colors.grey.shade200,
      ),
      title: 'Examen móvil - Jovanny Rch',
      initialRoute: initialRoute,
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
