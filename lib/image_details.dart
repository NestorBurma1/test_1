import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:test_1/model.dart';
import 'package:test_1/person_container.dart';
import 'package:test_1/person_provaider.dart';

class ImageDetails extends StatelessWidget {
  final BuildContext context;
  final Future future;

  const ImageDetails({Key key, this.context, this.future}) : super(key: key);

  @override
  Widget build(context) {
    Person person;
    return Scaffold(
      appBar: AppBar(
        title: Text('Distance to this person',
            style: TextStyle(
              color: Colors.yellowAccent,
              fontSize: 18.0,
              fontFamily: 'BowlbyOneSC',
            )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            (FutureBuilder<Person>(
                future: future,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    person = snapshot.data;
                    return Image.network(person.pictureUrl);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                })),
            GetDistance(person: person),
          ],
        ),
      ),
    );
  }
}

class GetDistance extends StatelessWidget {
  final Person person;

  const GetDistance({Key key, this.person}) : super(key: key);
  Future<Position> getLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    return position;
  }
  Future<double> getPersonLocation(Position position1, Position position2) async {
    double distanceInMeters = await Geolocator().
    distanceBetween(position1.latitude, position1.longitude, this.person.latitude, this.person.longitude);
    return distanceInMeters;
  }

  @override
  Widget build(BuildContext context) {
    Future _future = getLocation();
    Position _myPosition;
    return FutureBuilder<Position>(
//        Text('${myPosition.latitude}, ${myPosition.longitude}');
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _myPosition = snapshot.data;
            return Text('${_myPosition.latitude}, ${_myPosition.longitude}');
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        });
  }
}
