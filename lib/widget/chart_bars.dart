import 'package:flutter/material.dart';


class ChartBars extends StatelessWidget {

  final String lable;
  final double amount;
  final double amountPercentage;

  ChartBars(this.lable,this.amount,this.amountPercentage
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("\$${amount.toStringAsFixed(0)}"),
        SizedBox(height: 4),
         Container(
           height: 60,
           width: 10,
           child: Stack(children: <Widget>[
             Container(
               decoration: BoxDecoration(
                 border: Border.all(color: Colors.green,width: 1.0),
                 color: Color.fromRGBO(220, 20, 220, 9),
                 borderRadius: BorderRadius.circular(10)),),
                FractionallySizedBox(
                 heightFactor:  amountPercentage,
                 child: Container(decoration: BoxDecoration(
                   color: Theme.of(context).primaryColor,
                   borderRadius: BorderRadius.circular(10),

                 ),),

             ),
           ],),
         ),
        SizedBox(height: 6,),
        Text("$lable"),
      ],
    );
  }
}
