import 'package:examen_movil/widgets/person_card.dart';
import 'package:flutter/material.dart';

enum ActionsMenu { logout }

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ActionsMenu _selection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: ListView.builder(
        itemBuilder: (context, item) {
          return PersonCard();
        },
        itemCount: 5,
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        "Lista doctores",
        style: TextStyle(color: Colors.white),
      ),
      actions: <Widget>[
        _popUpMenu(),
      ],
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
