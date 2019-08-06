import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime _choseDate;

  void _addtx() {
    final gettitle = titleController.text;
    final getamount = amountController.text;

    if (gettitle == null || getamount == null) {
      return;
    } else {
      widget.addTx(gettitle, double.parse(getamount),
          _choseDate == null ? DateTime.now() : _choseDate);
    }
  }

  void pickedData() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((Date) {
      if (Date == DateTime.now()) {
        return;
      } else {
        setState(() {
          _choseDate = Date;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              // onChanged: (val) => amountInput = val,
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Text(_choseDate == null
                        ? ("Current Data")
                        : "Picked Date: ${DateFormat.yMd().format(_choseDate)}")),
                FlatButton(
                  child: Text("Chose Date"),
                  onPressed: pickedData,
                ),
              ],
            ),
            RaisedButton(
                child: Text('Add Transaction'),
                textColor: Colors.purple,
                onPressed: _addtx),
          ],
        ),
      ),
    );
  }
}
