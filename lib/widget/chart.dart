import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transections.dart';
import './chart_bars.dart';

class Chart extends StatelessWidget {

  final List<Transections>recentTransections;
  Chart(this.recentTransections);

   List<Map<String, Object>> get groupedTransectionValue{
     return List.generate(7, (index){
       final weekDays=DateTime.now().subtract(Duration(days: index));
       double amount=0.0;
       for(int i=0; i < recentTransections.length;i++){
         if(recentTransections[i].date.day == weekDays.day &&
         recentTransections[i].date.month == weekDays.month &&
         recentTransections[i].date.year == weekDays.year
         ){
            amount += recentTransections[i].money;
         }
       }

       return {
         "day": DateFormat.E().format(weekDays).substring(0,1),
         "amount": amount,
       };
     });
   }

   double get amountPercentage{
     return groupedTransectionValue.fold(0.0, (sum,item){
       return sum+=item['amount'];
     });
   }
  @override
  Widget build(BuildContext context) {

    return Card(elevation: 6,margin: EdgeInsets.all(20),
    child: Row(
      children: groupedTransectionValue.map((data){
        return ChartBars(data["day"],data['amount'],
            amountPercentage == 0.0 ? 0.0:(data['amount']as double) / amountPercentage);
      }).toList(),
    ),);
  }
}
