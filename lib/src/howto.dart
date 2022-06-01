import 'package:flutter/material.dart';

class HowtoScreen extends StatefulWidget {
  @override
  _HowtoScreenState createState() => _HowtoScreenState();
}

class _HowtoScreenState extends State<HowtoScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            'A BEGINNER’S GUIDE',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: Colors.black87),
          ),
          centerTitle: true,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(
                  Icons.loyalty,
                  color: Colors.orange,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.filter_vintage_rounded,
                  color: Colors.pink[200],
                ), //or filter_vintage_rounded or local_florist
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "สิ่งที่ควรรู้ก่อนปลูก",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Mansalva',
                        ),
                      ),
                      color: Colors.greenAccent[700],
                      transform: Matrix4.rotationZ(0.02),
                    ),

                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text('ธาตุอาหาร A'),
                            ),
                            color: Colors.red,
                            width: 80,
                            height: 80,
                          )),
                          Expanded(
                              child: Container(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text('ธาตุอาหาร B'),
                            ),
                            color: Colors.blue,
                            width: 80,
                            height: 80,
                          )),
                        ],
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "ธาตุอาหารสำหรับผักไฮโดรโปรนิกส์ แบ่งเป็น 2 ชนิด",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    Text(
                        '1.ธาตุอาหารหลักที่จำเป็น ได้แก่ ไนโตรเจน โปแตสเซียม ฟอสฟอรัส'),
                    Text(
                        '2.ธาตุอาหารรองได้แก่ แคลเซียม แมกนีเซียม ฯลฯ ในปริมาณที่พอหมาะ'),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "วิธีผสมธาตุอหาร AB",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                            'ผักสลัด/ผักกินใบ',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.green[900],
                            ),
                          ),
                        )),

                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                            '1.เตรียมธาตุอาหารและน้ำ ตามอัตราส่วน ดังนี้',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.green[900],
                            ),
                          ),
                        )),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                              '- ผักเด็ก (5-20 วัน) ผสมธาตุอาหาร AB เข้าด้วยกันในอัตราส่วน 1:1 ลงในน้ำเปล่า ปริมาณ 200 ส่วน (EC ประมาณ 0.6-0.8 ms/cm)'),
                          Text(
                              '- ผักโต (20 วันขี้นไป) ผสมธาตุอาหาร AB เข้าด้วยกันในอัตราส่วน 1:1 ลงในน้ำเปล่า ปริมาณ 120 ส่วน (EC ประมาณ 1.3 ms/cm)'),
                        ],
                      ),
                    ),
                    Text(
                      '2.แล้วคนให้เข้ากัน หลังจากนั้นนำไปเทลงถาดเพาะรวมทั้งถังบรรจุสารอาหารเพื่อใช้ปลูกผักได้เลย',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.green[900],
                      ),
                    ),
                    Text(
                      '3.เริ่มให้ธาตุอาหารกับต้นกล้าหลังมีอายุ 5 วันโดยใช้ปุ๋ยสูตรผักเด็กนำน้ำเติมลงในถาดเพาะ ให้ระดับน้ำสูงประมาณ 1.5 นิ้ว หรือครึ่งนึงของฟองน้ำ และเติมน้ำเมื่อระดับน้ำในถาดเพาะแห้งหรือลดลง',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.green[900],
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                            '4.เมื่อผักอายุ 20 วันขึ้นไป ให้เปลี่ยนไปใช้สูตรผักโต',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.green[900],
                            ),
                          ),
                        )),

                    SizedBox(height: 10),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                            'ผักกินผล',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.green[900],
                            ),
                          ),
                        )),
                    Text('ให้ผสมธาตุอาหาร AB ตามสัดส่วนที่กำหนดไว้ในตาราง'),

                    //สร้าง รูปภาพ
                    Image.asset(
                      'assets/images/ab1.png',
                      height: 150,
                    ),
                  ],
                ),
              ),
            ),

            //#2 Howto
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "วิธีการปลูก",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      color: Colors.greenAccent[700],
                      transform: Matrix4.rotationZ(0.02),
                    ),

                    Text(
                      "1.นำเมล็ดพันธุ์ ใส่ลงในฟองน้ำตรงรอยบาก ลึกประมาณ 2-3 มม. (ช่องล่ะ 1 เมล็ด) \n2.นำผ้าหรือทิชชู่ที่พรมน้ำจนชุ่มมาปิดคลุม \n3.นำแผ่นทึบแสงหรือแผ่นฟิวเจอร์บอร์ดมาปิดทับอีกชั้นหนึ่ง เพื่อไม่ให้ถูกแสงแดดและรักษาความชื้น \n4.วันที่ 4 เปิดถาดเพาะ และนำต้นกล้าไปรับแดดอ่อนๆตอนเช้า -เย็น ครั้งละ 1 ชั่วโมง  ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            '  - นำต้นกล้าออกมารับแสงทุกวัน จนอายุครบ 20 วัน')),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                            '** ห้ามเปิดแผ่นพลาสติกออกในช่วง 3 วันแรกของการเพาะเมล็ดเพราะแสงสว่างจะขัดขวางกระบวนการงอกของต้นกล้า',
                            style: TextStyle(color: Colors.red))),

                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '5.วันที่ 5 ใส่ธาตุอาหาร AB (ตามสูตรผักเด็ก)',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        )),

                    Text('- ค่อยๆ เทน้ำออกจากถาดเพาะเมล็ด'),
                    Text('- เทน้ำปุ๋ยที่เตรียมไว้ลงในถาดเพาะประมาณครึ่งฟองน้ำ'),
                    Text(
                        '- คอยหมั่นดู เติมน้ำปุ๋ย ทำแบบนี้ไปเรื่อยๆ จนต้นกล้าอายุ 20 วัน'),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '6.วันที่ 20 ย้ายลงถ้วยปลูก',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        )),

                    Text(
                        '- ค่อยๆ แยกฟองน้ำออกจากกัน ระวังอย่าให้รากขาดยกไปใส่ในถ้วยปลูกแล้วนำไปวางในรางปลูก'),

                    //สร้าง รูปภาพ
                    Image.asset(
                      'assets/images/d28.png',
                      height: 150,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '7.วันที่ 28 -35 (สัปดาห์ที่ 4 -5)',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                    Text(
                        '- ลดปริมาณน้ำลง ไม่ให้ฟองน้ำสัมผัสกับน้ำอีกต่อไป (ให้รากมี 1 ส่วนที่สัมผัสกับอากาศ ส่วนที่เหลือแช่อยู่ในน้ำตามเดิม) ระดับน้ำประมาณ 5 mm. ในรางของชุดโต๊ะปลูก '),
                    Image.asset(
                      'assets/images/root.png',
                      height: 300,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '8.วันที่ 42 (สัปดาห์ที่ 6)',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                    
                    Text(
                        '- ถ่ายน้ำเดิมออกจากภาชนะให้หมดโดยใส่แต่น้ำเปล่าเพียงอย่างเดียวแทนและหยุดการใส่ธาตุอาหารอย่างน้อย 3 วัน เพื่อไม่ให้มีสารละลายตกค้างในผัก'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
