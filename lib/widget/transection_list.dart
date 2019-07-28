import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transections.dart';

class TransectionList extends StatelessWidget {

  final List<Transections>data;

  TransectionList(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: SingleChildScrollView(

          child: Column(
          children: data.map((tx) {
            return Card(
                child: ListTile(
                  title: Text(
                    tx.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(DateFormat('dd/MM/yyyy').format(tx.date)),
                  leading: Text(
                    "\$ ${tx.money}",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                        color: Colors.deepPurple),
                  ),
                ));
          }).toList()),
        ));
  }
}
