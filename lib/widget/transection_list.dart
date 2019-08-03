import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transections.dart';

class TransectionList extends StatelessWidget {
  final List<Transections> data;

  TransectionList(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: data.isEmpty? Column(
          children: <Widget>[
            Text("no transection add yet!"),
            SizedBox(height: 25),
     Container(
       height: 200,
       child: Image.asset("assets/images/waiting.png",fit: BoxFit.cover,),)
          ],
        ):ListView.builder(
          itemBuilder: (contex, index) {
            return Card(
                child: ListTile(
              title: Text(
                data[index].title,
                style: Theme.of(context).textTheme.title,
              ),
              subtitle: Text(DateFormat('dd/MM/yyyy').format(data[index].date)),
              leading: Text(
                "\$ ${data[index].money.toStringAsFixed(2)}",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    decoration: TextDecoration.underline,
                    color: Theme.of(context).primaryColorDark),
              ),
            ));
          },
          itemCount: data.length,
        ));
  }
}
