import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:test_1/model.dart';

class PersonProvider  {
  Future<Person> getCurrentPerson() async {
    final response = await http.get('https://randomuser.me/api/');
    if (response.statusCode == 200) {
      print(Person.fromJson(json.decode(response.body)));
      return Person.fromJson(json.decode(response.body));

    } else {
      throw Exception('Failed to load person');
    }
  }
}
