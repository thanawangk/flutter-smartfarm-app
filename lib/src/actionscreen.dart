import 'package:flutter/material.dart';
import 'package:minihydrov1/src/api.dart';

class ActionScreen extends StatefulWidget {
  @override
  _ActionScreenState createState() => _ActionScreenState();
}

class _ActionScreenState extends State<ActionScreen> {
  bool statusma = false;
  bool statusmm = false;
  bool statusp = false;
  bool statusf = false;
  bool statusl = false;
  var textValuep = 'OFF';
  var textValuef = 'OFF';
  var textValuel = 'OFF';
  String _selected = '00';
  String _mode = 'MANUAL';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ACTIONS',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.green[300],
      body: FutureBuilder(
        future: getToken(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var result = snapshot.data;
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Text(
                        "SELECT MODE : $_mode",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Container(
                      height: 60.0,
                      width: 240.0,
                      margin: const EdgeInsets.all(10.0),
                      child: FloatingActionButton.extended(
                        label: Text('AUTOMATIC'),
                        backgroundColor: Colors.green[900],
                        onPressed: () {
                          if (statusma == false) {
                            setState(() {
                              statusma = true;
                              _selected = '11';
                              _mode = 'AUTO';
                              postDownlink(result, _selected);
                            });
                          } else {
                            setState(() {
                              statusma = false;
                              _selected = '10';
                              _mode = 'DEFAULT';
                              postDownlink(result, _selected);
                            });
                          }
                        },
                        icon: Icon(Icons.wash),
                        shape: RoundedRectangleBorder(),
                      ),
                    ),
                    Container(
                      height: 60.0,
                      width: 240.0,
                      margin: const EdgeInsets.all(10.0),
                      child: FloatingActionButton.extended(
                        label: Text('MANUAL'),
                        backgroundColor: Colors.redAccent,
                        onPressed: () {
                          if (statusmm == false) {
                            setState(() {
                              statusmm = true;
                              statusp = false;
                              statusf = false;
                              statusl = false;
                              textValuep = 'OFF';
                              textValuef = 'OFF';
                              textValuel = 'OFF';
                              _selected = '01';
                              _mode = 'MANUAL';
                              //print(statusp);
                              postDownlink(result, _selected);
                            });
                          } else {
                            setState(() {
                              statusmm = false;
                              _mode = 'DEFAULT';
                              _selected = '00';
                              postDownlink(result, _selected);
                            });
                          }
                        },
                        icon: Icon(Icons.wash),
                        shape: RoundedRectangleBorder(),
                      ),
                    ),
                    //================================================================================================================//
                    SizedBox(height: 50),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(10.0),
                            child: FloatingActionButton.extended(
                              label: Text('PUMP'),
                              backgroundColor: Colors.blue,
                              onPressed: () {
                                if (statusp == false) {
                                  setState(() {
                                    statusp = true;
                                    textValuep = 'ON';
                                    _selected = 'A0';
                                    postDownlink(result, _selected);
                                  });
                                } else {
                                  setState(() {
                                    statusp = false;
                                    textValuep = 'OFF';
                                    _selected = '0A';
                                    postDownlink(result, _selected);
                                  });
                                }
                              },
                              icon: Icon(Icons.wash),
                              shape: RoundedRectangleBorder(),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(10.0),
                            child: FloatingActionButton.extended(
                              label: Text('FOXY'),
                              backgroundColor: Colors.lightBlueAccent,
                              onPressed: () {
                                if (statusf == false) {
                                  setState(() {
                                    statusf = true;
                                    textValuef = 'ON';
                                    _selected = 'B0';
                                    postDownlink(result, _selected);
                                  });
                                } else {
                                  setState(() {
                                    statusf = false;
                                    textValuef = 'OFF';
                                    _selected = '0B';
                                    postDownlink(result, _selected);
                                  });
                                }
                              },
                              icon: Icon(Icons.wash),
                              shape: RoundedRectangleBorder(),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(10.0),
                            child: FloatingActionButton.extended(
                              label: Text('LIGHT'),
                              backgroundColor: Colors.amber[400],
                              onPressed: () {
                                if (statusl == false) {
                                  setState(() {
                                    statusl = true;
                                    textValuel = 'ON';
                                    _selected = 'C0';
                                    postDownlink(result, _selected);
                                  });
                                } else {
                                  setState(() {
                                    statusl = false;
                                    textValuel = 'OFF';
                                    _selected = '0C';
                                    postDownlink(result, _selected);
                                  });
                                }
                              },
                              icon: Icon(Icons.wb_twighlight),
                              shape: RoundedRectangleBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(15.0),
                            child: Text(
                              'STATUS: $textValuep',
                              //style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(10.0),
                            child: Text(
                              'STATUS: $textValuef',
                              //style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(10.0),
                            child: Text(
                              'STATUS: $textValuel',
                              //style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
