import 'package:mongo_dart/mongo_dart.dart';
//ดึงข้อมูล รอ //await คือต้องรอให้เสร็จก่อนถึงจะไปทำอย่างอื่น

Future<dynamic> startDB(String date) async {
  // Log into database
  var db = await Db.create(
      'mongodb+srv://test:password8@loraiot.kffbg.mongodb.net/loraiot?retryWrites=true&w=majority');
  await db.open();
  var coll = db.collection('sensors');
  //var datadb = await coll.find(where.sortBy('Time')).toList();

  String d2 = 'T23:59:59.000+07:00';
  dynamic dd = date+d2;

  var val = await coll.find(where.sortBy('Time').lte('Time', dd)).toList();
  //print(val.last);
  
  return val;
}


// void main() {

//   startDB();
// }
