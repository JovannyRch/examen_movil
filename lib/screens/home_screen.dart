import 'package:examen_movil/screens/person/person_details.dart';
import 'package:examen_movil/widgets/custom_widgets.dart';
import 'package:examen_movil/widgets/person_card.dart';
import 'package:flutter/material.dart';

enum ActionsMenu { logout }

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ActionsMenu _selection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        "Lista de doctores",
        actions: [
          _popUpMenu(),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, item) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, PersonDetailsScreen.routeName);
            },
            child: PersonCard(),
          );
        },
        itemCount: 5,
      ),
    );
  }

  Widget _popUpMenu() {
    return PopupMenuButton<ActionsMenu>(
      child: Padding(
        padding: EdgeInsets.only(right: 15),
        child: Icon(
          Icons.more_horiz,
          color: Colors.white,
        ),
      ),
      onSelected: (ActionsMenu result) {
        setState(() {
          _selection = result;
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<ActionsMenu>>[
        const PopupMenuItem<ActionsMenu>(
          value: ActionsMenu.logout,
          child: Text('Cerrar sesión'),
        ),
      ],
    );
  }
}
