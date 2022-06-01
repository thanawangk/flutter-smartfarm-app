import 'package:flutter/material.dart';

class Cardd extends StatelessWidget {
  String payloadtext;
  String date;

  Cardd(this.payloadtext,this.date);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      child: ListTile(
        leading: CircleAvatar(radius: 30, child: Icon(Icons.thermostat_outlined)),
        title: Text(payloadtext),
        subtitle: Text(date),
      ),
    );
  }
}
