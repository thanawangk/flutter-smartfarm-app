import 'package:flutter/material.dart';
import 'package:minihydrov1/src/api.dart';

class ActionScreen extends StatefulWidget {
  @override
  _ActionScreenState createState() => _ActionScreenState();
}

class _ActionScreenState extends State<ActionScreen> {
  bool statusp = false;
  bool statusl = false;
  var textValuep = 'OFF';
  var textValuel = 'OFF';
  String _selected = '00';

  List<Map> _myJson = [
    {"id": '00', "image": "assets/images/kale.png", "name": "Kale"},
    {"id": '01', "image": "assets/images/greenoak.png", "name": "Green Oak"},
    {"id": '10', "image": "assets/images/redoak.png", "name": "Red Oak"},
    {"id": '11', "image": "assets/images/butterhead.png", "name": "Butterhead"},
    //{"id": '0A', "image": "assets/banks/h4.png", "name": "Default"},
  ];

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
                    Text(
                      "โปรดเลือกชนิดผัก",
                      style: TextStyle(fontSize: 25),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey[800]),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton<String>(
                                  isDense: true,
                                  //hint: new Text("โปรดเลือกชนิดผัก"),
                                  value: _selected,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      _selected = newValue;
                                    });
                                    print(_selected);
                                  },
                                  items: _myJson.map((Map map) {
                                    return new DropdownMenuItem<String>(
                                      value: map["id"].toString(),
                                      // value: _mySelection,
                                      child: Row(
                                        children: <Widget>[
                                          Image.asset(
                                            map["image"],
                                            width: 25,
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(left: 10),
                                              child: Text(map["name"])),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //================================================================================================================//
                    Container(
                      height: 60.0,
                      width: 240.0,
                      margin: const EdgeInsets.all(10.0),
                      child: FloatingActionButton.extended(
                        label: Text('PUMP'),
                        backgroundColor: Colors.blue,
                        onPressed: () {
                          if (statusp == false) {
                            setState(() {
                              statusp = true;
                              textValuep = 'ON';
                              postDownlink(result, _selected);
                            });
                          } else {
                            setState(() {
                              statusp = false;
                              textValuep = 'OFF';
                            });
                          }
                        },
                        icon: Icon(Icons.wash),
                        shape: RoundedRectangleBorder(),
                      ),
                    ),
                    Text(
                      'STATUS: $textValuep',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 50),
                    Container(
                      height: 60.0,
                      width: 240.0,
                      margin: const EdgeInsets.all(10.0),
                      child: FloatingActionButton.extended(
                        label: Text('LIGHT'),
                        backgroundColor: Colors.amber[400],
                        onPressed: () {
                          if (statusl == false) {
                            setState(() {
                              statusl = true;
                              textValuel = 'ON';
                              postDownlink(result, _selected);
                            });
                          } else {
                            setState(() {
                              statusl = false;
                              textValuel = 'OFF';
                            });
                          }
                        },
                        icon: Icon(Icons.wb_twighlight),
                        shape: RoundedRectangleBorder(),
                      ),
                    ),
                    Text(
                      'STATUS: $textValuel',
                      style: TextStyle(fontSize: 20),
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
