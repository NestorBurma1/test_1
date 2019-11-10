import 'package:flutter/material.dart';
import 'package:test_1/model.dart';
import 'package:test_1/person_container.dart';
import 'package:test_1/person_provaider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random person',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _personProvider = PersonProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Random Person')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<Person>(
                future: _personProvider.getCurrentPerson(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return PersonContainer(person: snapshot.data);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                }),
            FlatButton(child: Icon(Icons.autorenew)),
          ],
        ),
      ),
    );
  }
}
