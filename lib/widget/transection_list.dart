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
        child: ListView.builder(
           itemBuilder: (contex,index){
             return Card(
                 child: ListTile(
                   title: Text(
                     data[index].title,
                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                   ),
                   subtitle: Text(DateFormat('dd/MM/yyyy').format(data[index].date)),
                   leading: Text(
                     "\$ ${data[index].money}",
                     style: TextStyle(
                         fontWeight: FontWeight.w600,
                         fontSize: 18,
                         decoration: TextDecoration.underline,
                         color: Colors.deepPurple),
                   ),
                 ));
           },
            itemCount: data.length,
          )
        );
  }
}
