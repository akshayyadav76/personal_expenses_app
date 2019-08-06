import 'package:flutter/material.dart';

class ChartBars extends StatelessWidget {
  final String lable;
  final double amount;
  final double amountPercentage;

  ChartBars(this.lable, this.amount, this.amountPercentage);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx,constrains){
      return Column(
        children: <Widget>[
          Container(
              height: constrains.maxHeight * 0.15,
              child: FittedBox(child: Text("\$${amount.toStringAsFixed(0)}"))),
          SizedBox(height: constrains.maxHeight * 0.05),
          Container(
            height: constrains.maxHeight * 0.6,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 9),
                      borderRadius: BorderRadius.circular(10)),
                ),
                FractionallySizedBox(
                  heightFactor: amountPercentage,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: constrains.maxHeight * 0.05,
          ),
          Container(
            height: constrains.maxHeight * 0.15,
              child: FittedBox(child: Text("$lable"))),
        ],
      );
    });



  }
}
