import 'package:flutter/material.dart';

class NewTransections extends StatelessWidget {
  final titleEditor = TextEditingController();
  final moneyEditor = TextEditingController();
  final Function userMethod;

  NewTransections(this.userMethod);

  void submitData() {
    if (titleEditor.text.isEmpty || moneyEditor.text.isEmpty) {
      return;
    } else {
      userMethod(titleEditor.text, double.parse(moneyEditor.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: "Enter title"),
            controller: titleEditor,
            onSubmitted: (_) { 
              submitData();
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: "Enter title"),
            controller: moneyEditor,
            keyboardType: TextInputType.number,
            onSubmitted: (_) {
              submitData();
            },
          ),
          FlatButton(
              child: Text("Add Transction",
                  style: TextStyle(color: Colors.deepPurple)),
              onPressed: submitData ,
          ),
        ],
      ),
    );
  }
}
