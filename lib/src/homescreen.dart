import 'package:flutter/material.dart';
import 'package:minihydrov1/src/mainscreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // void initState() {

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[400],
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 60),

                Text("WELCOME",
                    style: TextStyle(
                      fontSize: 48,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400,
                    )),
                SizedBox(height: 60),
                //สร้าง รูปภาพ
                Image.asset(
                  'assets/images/h5.png',
                  height: 300,
                  //width: 100,
                ),
                SizedBox(height: 20),

                Text('HYDROPONICS',
                    style: TextStyle(
                      fontSize: 34,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400,
                    )),
                SizedBox(height: 90),

                //สร้าง ปุ่มSTART
                Container(
                  height: 60.0,
                  width: 240.0,
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MainScreen();
                      }));
                    },
                    label: const Text(
                      'START',
                      style: TextStyle(fontSize: 20),
                    ),
                    icon: const Icon(Icons.eco),
                    backgroundColor: Colors.grey,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
