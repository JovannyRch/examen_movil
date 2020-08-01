import 'dart:isolate';

import 'package:examen_movil/models/person_model.dart';
import 'package:examen_movil/providers/data_provider.dart';
import 'package:examen_movil/providers/db_provider.dart';
import 'package:examen_movil/screens/person/person_details_screen.dart';
import 'package:examen_movil/widgets/custom_widgets.dart';
import 'package:examen_movil/widgets/person_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shared/user_preferences.dart';
import 'auth/login_screen.dart';

enum ActionsMenu { logout }

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ActionsMenu _selection;
  UserPrefrences _userPrefrences = new UserPrefrences();
  DataProvider _dataProvider = DataProvider();
  bool isLoading = true;

  @override
  void initState() {
    //Verify Data From DB
    checkDB();
    super.initState();
  }

  void checkDB() async {
    isLoading = true;
    int total = await DBProvider.db.total();
    if (total == 0) {
      List<Person> newData = await _dataProvider.getPeople();
      newData.forEach((p) {
        DBProvider.db.newPerson(p);
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        "Lista de doctores",
        actions: [
          _popUpMenu(),
        ],
      ),
      body: isLoading ? _loader() : _listPeople(),
    );
  }

  Widget _loader() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _listPeople() {
    return FutureBuilder<List<Person>>(
        future: DBProvider.db.getPeople(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            List<Person> people = snapshot.data;

            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: people.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: PersonCard(people[index]),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      PersonDetailsScreen.routeName,
                      arguments: people[index],
                    );
                  },
                );
              },
            );
          }
        });
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
        if (_selection == ActionsMenu.logout) {
          _userPrefrences.email = '';
          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        }
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
