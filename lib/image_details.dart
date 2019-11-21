import 'dart:async';
import 'package:flutter/material.dart';
import 'package:test_1/get_my_location.dart';
import 'package:test_1/model.dart';
import 'package:flutter/foundation.dart';

class ImageDetails extends StatelessWidget {
  const ImageDetails({Key key, this.context, this.future}) : super(key: key);
  final BuildContext context;
  final Future future;

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
                    return Column(
                      children: <Widget>[
                        Image.network(person.pictureUrl),
                        GetMyLocation(person1: person),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                })),
          ],
        ),
      ),
    );
  }
}
