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
    street = streetData["number"] + " " + streetData["name"];
    city = location["city"];
    state = location["state"];
    postcode = location["postcode"];
    phone = json["phone"];
  }

  double _createRating() {
    int sum = 0;
    for (int i = 0; i < 10; ++i) {
      sum = _random.nextInt(10);
    }
    return double.parse((sum / 10).toStringAsFixed(1));
  }
}

/*
{
            "gender": "female",
            "name": {
                "title": "Mrs",
                "first": "Ellen",
                "last": "Hanka"
            },
            "location": {
                "street": {
                    "number": 341,
                    "name": "Pispalan Valtatie"
                },
                "city": "Lempäälä",
                "state": "Southern Savonia",
                "country": "Finland",
                "postcode": 84018,
                "coordinates": {
                    "latitude": "-7.5682",
                    "longitude": "118.9655"
                },
                "timezone": {
                    "offset": "-3:30",
                    "description": "Newfoundland"
                }
            },
            "email": "ellen.hanka@example.com",
            "login": {
                "uuid": "2185097d-d037-4704-ba86-876207aa931a",
                "username": "greenleopard532",
                "password": "laetitia",
                "salt": "alBCatCO",
                "md5": "39d6ec9047968db93ffa40c90205e4e6",
                "sha1": "485a6c45e7013c7b8e5f6577c598431bda1ae417",
                "sha256": "dd7f94b517f160e5cc60f9031a034eb9f3206e0ab267138a4894a6f96d668193"
            },
            "dob": {
                "date": "1966-10-09T20:12:06.523Z",
                "age": 54
            },
            "registered": {
                "date": "2004-07-30T03:01:33.881Z",
                "age": 16
            },
            "phone": "05-665-206",
            "cell": "046-474-70-36",
            "id": {
                "name": "HETU",
                "value": "NaNNA032undefined"
            },
            "picture": {
                "large": "https://randomuser.me/api/portraits/women/0.jpg",
                "medium": "https://randomuser.me/api/portraits/med/women/0.jpg",
                "thumbnail": "https://randomuser.me/api/portraits/thumb/women/0.jpg"
            },
            "nat": "FI"
        },


*/
