import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:convert/convert.dart';
import 'package:minihydrov1/database/db.dart';
import 'package:minihydrov1/src/Carddate.dart';

class DashScreen extends StatefulWidget {
  @override
  _DashScreenState createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  DateTime dateTime;

  // เลือกวัน
  Future<dynamic> chooseDate() async {
    DateTime chooseDateTime = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 2),
      lastDate: DateTime(DateTime.now().year + 2),
      initialDate: dateTime,
    );

    if (chooseDateTime != null) {
      setState(() {
        dateTime = chooseDateTime;
        String date = dateTime.toString().substring(0,10);
        //print(dd);
        return date;
      });
    }
  }

  void initState() {
    super.initState();
    dateTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DASHBOARD',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.green[200],
      body: FutureBuilder(
        future: startDB(dateTime.toString().substring(0,10)),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          // ดึงข้อมูลจาก LoraSen มาครบจะให้ทำอะไร
          if (snapshot.connectionState == ConnectionState.done) {
            var result = snapshot.data;
            var r1 = result[result.length - 1];
            var r2 = result[result.length - 2];
            var r3 = result[result.length - 3];
            var r4 = result[result.length - 4];
            var r5 = result[result.length - 5];
            var r6 = result[result.length - 6];

            // var payloadtext = ascii.decode(hex.decode(r1['payload_hex']));
            // var date = r1['Time'].toString().substring(0, 19);

            return ListView(
              children: [
                Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.date_range),
                      title: Text(
                          '${dateTime.year} - ${dateTime.month} - ${dateTime.day} '),
                      trailing: Icon(Icons.keyboard_arrow_down),
                      onTap: () {
                        chooseDate();
                      },
                    ),
                    SizedBox(height: 10),
                    //  for (var i = 6; i >= 1; i--) Cardd(payloadtext, date),
                    Cardd(ascii.decode(hex.decode(r1['payload_hex'])), r1['Time'].toString().substring(0, 19)),
                    Cardd(ascii.decode(hex.decode(r2['payload_hex'])), r2['Time'].toString().substring(0, 19)),
                    Cardd(ascii.decode(hex.decode(r3['payload_hex'])), r3['Time'].toString().substring(0, 19)),
                    Cardd(ascii.decode(hex.decode(r4['payload_hex'])), r4['Time'].toString().substring(0, 19)),
                    Cardd(ascii.decode(hex.decode(r5['payload_hex'])), r5['Time'].toString().substring(0, 19)),
                    Cardd(ascii.decode(hex.decode(r6['payload_hex'])), r6['Time'].toString().substring(0, 19)),
                  ],
                )
              ],
            );
          }
          // else โหลดต่อ
          return LinearProgressIndicator();
        },
      ),
    );
  }
}
