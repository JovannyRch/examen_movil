import 'package:examen_movil/const/const.dart';
import 'package:flutter/material.dart';

class PersonCard extends StatelessWidget {
  const PersonCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.0,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          _picture(),
          _details(),
        ],
      ),
    );
  }

  Widget _details() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[_name("Jovanny Rchasdh"), _rating(4.5)],
          ),
          SizedBox(height: 5.0),
          _email("jovannyrch@gmail.com"),
          SizedBox(height: 15.0),
          _address("St. Bronxlyn 212"),
        ],
      ),
    );
  }

  Widget _address(String value) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.pin_drop,
          color: Colors.grey,
        ),
        Text(
          value,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
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

  Widget _rating(double value) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.star,
          color: Colors.yellow.shade700,
        ),
        Text(
          "$value",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20.0,
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
            image: NetworkImage(
                "https://randomuser.me/api/portraits/med/men/4.jpg"),
          ),
        ),
      ),
    );
  }
}
