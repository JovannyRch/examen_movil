import 'dart:math';

class People {
  List<Person> people = new List();

  People.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    jsonList.forEach((item) {
      final person = Person.fromJsonMap(item);
      people.add(person);
    });
  }

  People.fromDB(List<dynamic> jsonList) {
    if (jsonList == null) return;

    jsonList.forEach((item) {
      final person = Person.fromJsonMap(item);
      people.add(person);
    });
  }
}

class Person {
  String name;
  String image;
  String email;
  String street;
  String city;
  String state;
  String postcode;
  String phone;
  double rating;
  Random _random;

  Person({
    this.name,
    this.image,
    this.email,
    this.street,
    this.city,
    this.state,
    this.postcode,
    this.phone,
    this.rating = -1,
  }) {
    if (rating == -1) {
      this.rating = _createRating();
    }
  }

  Person.fromJsonMap(Map<String, dynamic> json) {
    final nameData = json["name"];
    final picture = json["picture"]["medium"];
    final location = json["location"];
    final streetData = location["street"];
    name = "${nameData['title']} ${nameData['first']} ${nameData['last']} ";
    image = picture;
    email = json["email"];
    street = streetData["number"].toString() + " " + streetData["name"];
    city = location["city"];
    state = location["state"];
    postcode = location["postcode"].toString();
    phone = json["phone"];
    rating = _createRating();
  }

  Person.fromDB(Map<String, dynamic> json) {
    name = json["name"];
    image = json["image"];
    email = json["email"];
    street = json["street"];
    city = json["city"];
    state = json["state"];
    postcode = json["postcode"];
    phone = json["phone"];
    rating = json["ratin"];
  }

  double _createRating() {
    _random = new Random();
    int sum = 0;
    for (int i = 0; i < 10; ++i) {
      sum += _random.nextInt(5);
    }
    return double.parse((sum / 10).toStringAsFixed(1));
  }
}
