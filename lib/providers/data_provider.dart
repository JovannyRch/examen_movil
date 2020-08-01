import 'dart:async';
import 'dart:convert';
import 'package:examen_movil/models/person_model.dart';
import 'package:http/http.dart' as http;

class DataProvider {
  final _url = "https://randomuser.me";

  Future<List<Person>> getPeople() async {
    final resp = await http.get('$_url/api/?results=5');
    final dataDecode = json.decode(resp.body);
    final data = People.fromJsonList(dataDecode['results']);
    return data.people;
  }
}
