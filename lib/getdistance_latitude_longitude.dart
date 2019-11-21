import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'model.dart';

class GetDistance extends StatelessWidget {
  const GetDistance({Key key, this.position1, this.person1}) : super(key: key);
  final Position position1;
  final Person person1;

  Future<double> getPersonLocation(Position position1, Person person1) async {
    final double distanceInMeters = await Geolocator().distanceBetween(
        position1.latitude,
        position1.longitude,
        person1.latitude,
        person1.longitude);
    return distanceInMeters;
  }

  @override
  Widget build(BuildContext context) {
    final Future future = getPersonLocation(position1, person1);

    return FutureBuilder<double>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final String distance = (snapshot.data/1000).toStringAsFixed(2);
            return Text('Distance to this person $distance kilomiters',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 18.0,
                  fontFamily: 'BowlbyOneSC',
                ));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        });
  }
}
