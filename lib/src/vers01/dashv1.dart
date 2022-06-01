import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:convert/convert.dart';
//import 'package:minihydrov1/database/db.dart';

import 'Box.dart';

class DashScreen extends StatefulWidget {
  @override
  _DashScreenState createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  void initState() {
    super.initState();
    //startDB();
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
        //future: startDB(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          // ดึงข้อมูลจาก LoraSen มาครบจะให้ทำอะไร
          if (snapshot.connectionState == ConnectionState.done) {
            var result = snapshot.data;
            var decode = ascii.decode(hex.decode(result['payload_hex']));
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // Box(" id ", result['_id'], Icons.brightness_medium,
                  //     Colors.red[400], 100),
                  // SizedBox(height: 10),
                  Box(" Value", decode,
                      Icons.device_thermostat, Colors.red[400], 100),
                  SizedBox(height: 10),
                  Box(" TIME", result['Time'].toString().substring(0, 19),
                      Icons.wb_twighlight, Colors.blue[400], 100),

                  // ListView.builder(
            //     itemCount: mongoList.length,
            //     itemBuilder: (context, int index) {
            //       return Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Column(
            //           children: [
            //             Card(
            //               elevation: 5,
            //               margin: const EdgeInsets.symmetric(
            //                   vertical: 1, horizontal: 4),
            //               child: ListTile(
            //                 leading: CircleAvatar(
            //                     radius: 30, child: Icon(Icons.wb_twighlight)),
            //                 title: Text(payloadtext),
            //                 subtitle: Text(date),
            //               ),
            //             ),
            //           ],
            //         ),
            //       );
            //     });
                ],
              ),
            );
          }
          // else โหลดต่อ
          return LinearProgressIndicator();
        },
      ),
    );
  }
}
