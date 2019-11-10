class Person {
  final double latitude;
  final double longitude;
  final String firsName;
  final String lastName;
  final String pictureUrl;

  Person(this.latitude, this.longitude, this.firsName, this.lastName, this.pictureUrl);
  Person.fromJson(Map<String, dynamic> json)
      : firsName = json['results'][0]['name']['first'],
        lastName = json['results'][0]['name']['last'],
        latitude = double.parse(
            json['results'][0]['location']['coordinates']['latitude']),
        longitude = double.parse(
            json['results'][0]['location']['coordinates']['longitude']),
        pictureUrl = json['results'][0]['picture']['large'];
}
