import 'package:flutter/material.dart';
import 'package:test_1/model.dart';

class PersonContainer extends StatelessWidget {
  const PersonContainer({Key key, @required this.person})
      : assert(person != null),
        super(key: key);
  final Person person;
  @override
  Widget build(context) {
    return showPerson(context, person);
  }
}

Column showPerson(BuildContext context, Person _person) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Image.network(_person.pictureUrl),
      Text(
        '${_person.firsName} ${_person.lastName}',
        style: Theme.of(context).textTheme.display1,
      )
    ],
  );
}
