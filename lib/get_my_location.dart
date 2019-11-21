import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:test_1/getdistance_latitude_longitude.dart';

import 'model.dart';

class GetMyLocation extends StatelessWidget {
  const GetMyLocation({Key key, this.person1}) : super(key: key);
  final Person person1;

  Future<Position> getLocation() async {
    final Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    return position;
  }

  @override
  Widget build(BuildContext context) {
    final Future _future = getLocation();
    Position _myPosition;
    return FutureBuilder<Position>(
//        Text('${myPosition.latitude}, ${myPosition.longitude}');
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _myPosition = snapshot.data;
            return GetDistance(position1: _myPosition, person1: person1);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        });
  }
}
