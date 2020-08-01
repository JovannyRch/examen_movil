import 'package:examen_movil/const/const.dart';
import 'package:examen_movil/models/person_model.dart';
import 'package:examen_movil/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

class PersonDetailsScreen extends StatelessWidget {
  static const routeName = '/person-details';
  Size _size;
  Person person;

  @override
  Widget build(BuildContext context) {
    person = ModalRoute.of(context).settings.arguments;

    _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: customAppBar("Detalle de contacto"),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _topCard(),
              _directionCard(),
              _locationCard(),
            ],
          ),
          _buttonContact(),
        ],
      ),
    );
  }

  Widget _buttonContact() {
    return Positioned(
      bottom: 10.0,
      right: _size.width * (0.1 / 2),
      child: GestureDetector(
        child: Container(
          width: _size.width * 0.9,
          height: 60.0,
          decoration: BoxDecoration(
            color: kBaseColor,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Center(
            child: Text(
              "Contactar",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _locationCard() {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      width: _size.width * 0.9,
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                Icons.pin_drop,
                color: Colors.grey,
              ),
              SizedBox(width: 5.0),
              Text(
                "Ubicación:",
                style: TextStyle(
                  color: kBaseColor,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Container(
            color: Colors.grey,
            height: 200,
            width: _size.width * 0.9,
          ),
        ],
      ),
    );
  }

  Widget _directionCard() {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      width: _size.width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Dirección:",
            style: TextStyle(
              color: kBaseColor,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          _row("Calle", person.street),
          _row("Ciudad", person.city),
          _row("Estado", person.state),
          _row("Código postal", person.postcode),
          _row("Teléfono", person.phone),
        ],
      ),
    );
  }

  Widget _row(String key, String value) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: <Widget>[
          Text(
            "$key: ",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }

  Widget _topCard() {
    return Center(
      child: Container(
        width: _size.width * 0.9,
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade400,
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          children: <Widget>[
            _picture(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _name(person.name),
                SizedBox(height: 5.0),
                _email(person.email),
                SizedBox(height: 5.0),
                _rating(person.rating),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _rating(double value) {
    List<Widget> stars = [];
    int total = value.toInt();

    int halfs = 0;
    double rest = value - total;

    if (rest >= 0.24) {
      if (rest >= .69)
        total += 1;
      else
        halfs += 1;
    }
    for (int i = 0; i < total; ++i) {
      stars.add(Icon(
        Icons.star,
        color: Colors.yellow.shade700,
      ));
    }

    if (halfs == 1) {
      stars.add(Icon(Icons.star_half, color: Colors.yellow.shade700));
    }

    return Row(
      children: <Widget>[
        ...stars,
        SizedBox(width: 5.0),
        Text(
          "$value",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }

  Widget _name(String name) {
    return Container(
      child: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 23.0,
        ),
      ),
    );
  }

  Widget _picture() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        width: 75.0,
        height: 75.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(person.image),
          ),
        ),
      ),
    );
  }

  Widget _email(String value) {
    return Text(
      value,
      style: TextStyle(
        color: kBaseColor,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
