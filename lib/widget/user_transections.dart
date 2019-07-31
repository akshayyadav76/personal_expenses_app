import 'package:flutter/material.dart';

import 'new_transections.dart';
import 'transection_list.dart';
import '../model/transections.dart';

class UserTransections extends StatefulWidget {
  @override
  _UserTransectionsState createState() => _UserTransectionsState();
}

class _UserTransectionsState extends State<UserTransections> {
  void _addNewTransection(String title, double money) {
    final newTx = Transections(
        title: title,
        money: money,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransection.add(newTx);
    });
  }

  final List<Transections> _userTransection = [
    Transections(
        id: "1", title: "buy shoes ", money: 250.5, date: DateTime.now()),
    Transections(
        id: "1", title: "buy banana ", money: 20.0, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransections(_addNewTransection),
        TransectionList(_userTransection),
      ],
    );
  }
}
