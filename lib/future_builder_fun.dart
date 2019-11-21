import 'package:flutter/material.dart';
import 'package:test_1/person_container.dart';

import 'model.dart';

class FutureBuilderFun extends StatelessWidget {
  const FutureBuilderFun(this.future);
  final Future future;

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<Person>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return  PersonContainer(person: snapshot.data);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        });
  }
}