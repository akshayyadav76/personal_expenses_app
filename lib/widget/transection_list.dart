import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transections.dart';

class TransectionList extends StatelessWidget {
  final List<Transections> data;
  Function delete;

  TransectionList(this.data, this.delete);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: data.isEmpty
            ? Column(
                children: <Widget>[
                  Text("no transection add yet!"),
                  SizedBox(height: 25),
                  Container(
                    height: 200,
                    child: Image.asset(
                      "assets/images/waiting.png",
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              )
            : ListView.builder(
                itemBuilder: (contex, index) {
                  return Card(
                      child: ListTile(
                    trailing: IconButton(
                        icon: Icon(
                          Icons.delete_forever,
                          color: Theme.of(context).errorColor,
                        ),
                        onPressed: () => delete(data[index].id)),
                    title: Text(
                      data[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle:
                        Text(DateFormat('dd/MM/yyyy').format(data[index].date)),
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: FittedBox(
                          child: Text(
                            "\$ ${data[index].money.toStringAsFixed(2)}",
                          ),
                        ),
                      ),
                    ),
                  ));
                },
                itemCount: data.length,
              ));
  }
}
