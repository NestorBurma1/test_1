import 'package:flutter/material.dart';
import 'package:test_1/model.dart';
import 'package:test_1/person_provaider.dart';

import 'future_builder_fun.dart';
import 'image_details.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final personProvider = PersonProvider();
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
  Future future = PersonProvider().getCurrentPerson();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Random Person',
              style: TextStyle(
                color: Colors.yellowAccent,
                fontSize: 30.0,
                fontFamily: 'BowlbyOneSC',
              ))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilderFun(future),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new FloatingActionButton(
                    heroTag: "btn1",
                    child: Icon(Icons.autorenew),
                    backgroundColor: Colors.blue,
                    onPressed: () {
                      setState(() {
                        FutureBuilderFun(
                            future = PersonProvider().getCurrentPerson());
                      });
                    }),
                new FloatingActionButton(
                    heroTag: "btn2",
                    child: Icon(Icons.arrow_forward),
                    backgroundColor: Colors.blue,
                    onPressed: () {
                      Navigator.push<dynamic>(
                          context,
                          MaterialPageRoute<dynamic>(
                            builder: (context) => ImageDetails(future: future, context: context),
                          ));
                      {}
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
