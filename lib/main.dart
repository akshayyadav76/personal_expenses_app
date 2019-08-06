import 'package:flutter/material.dart';

import 'widget/transection_list.dart';
import './model/transections.dart';
import './widget/new_transections.dart';
import './widget/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: "Quicksands",
        textTheme: ThemeData.light()
            .textTheme
            .copyWith(title: TextStyle(fontFamily: "OpenSans", fontSize: 30)),
        appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                      fontFamily: "OpenSans",
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                )),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _addNewTransection(String title, double money, DateTime getDate) {
    final newTx = Transections(
        title: title,
        money: money,
        date: getDate,
        id: DateTime.now().toString());

    setState(() {
      _userTransection.add(newTx);
    });
    Navigator.of(context).pop();
  }

  void deltetx(String id) {
    setState(() {
      _userTransection.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  final List<Transections> _userTransection = [
//    Transections(
//        id: "1", title: "buy shoes ", money: 250.5, date: DateTime.now()),
//    Transections(
//        id: "1", title: "buy banana ", money: 20.0, date: DateTime.now()),
  ];

  void _modelSheet(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addNewTransection);
        });
  }

  List<Transections> get _sevenPreviousTransactions {
    return _userTransection.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Flutter App',
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _modelSheet(context);
          },
          child: Icon(Icons.add),
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_sevenPreviousTransactions),
            TransectionList(_userTransection, deltetx),
          ],
        )));
  }
}
