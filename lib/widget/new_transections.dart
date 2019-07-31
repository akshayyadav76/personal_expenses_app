import 'package:flutter/material.dart';

class NewTransections extends StatelessWidget {
  final titleEditor = TextEditingController();
  final moneyEditor = TextEditingController();
  final Function userMethod;

  NewTransections(this.userMethod);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: "Enter title"),
            controller: titleEditor,
          ),
          TextField(
            decoration: InputDecoration(labelText: "Enter title"),
            controller: moneyEditor,
          ),
          FlatButton(
            child: Text("Add Transction",
                style: TextStyle(color: Colors.deepPurple)),
            onPressed: () {
              userMethod(titleEditor.text, double.parse(moneyEditor.text));
            },
          )
        ],
      ),
    );
  }
}
