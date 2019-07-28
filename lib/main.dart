import 'package:flutter/material.dart';

import 'transections.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transections> transection = [
    Transections(
        id: "1", title: "buy shoes ", money: 250.5, date: DateTime.now()),
    Transections(
        id: "1", title: "buy banana ", money: 20.0, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                width: double.infinity,
                child: Card(
                  child: Text("seeee"),
                )),
            Column(
                children: transection.map((tx) {
              return Card(
                  child: ListTile(
                title: Text(tx.title),
                subtitle: Text(tx.date.toString()),
                leading: Text(tx.money.toString()),
              ));
            }).toList())
          ],
        ));
  }
}
