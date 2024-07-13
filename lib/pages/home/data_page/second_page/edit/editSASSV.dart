import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projectmobile/pages/log/routes.dart';
import 'package:projectmobile/pages/home/newdata_page/indata.dart';

class e_sassv extends StatefulWidget {
  const e_sassv({Key? key}) : super(key: key);

  @override
  State<e_sassv> createState() => _e_sassvState();
}

class _e_sassvState extends State<e_sassv> {
  List<String> sum = [];
  String? frequency;
  String? usetime;
  String? reason;
  String last = '';

  List<String> Frequency = ['ทุกวัน', 'เกือบทุกวัน', 'นานๆ ครั้ง', 'ไม่เคย'];
  List<String> Usetime = [
    'ไม่เกิน 1 ชั่วโมง',
    '1-3 ชั่วโมง',
    '4-6 ชั่วโมง',
    'มากกว่า 6 ชั่วโมง'
  ];
  List<String> Reason = [
    'ทำงาน',
    'เล่นเกม',
    'ดูหนัง,รายการโปรด,ซีรี่ย์,การ์ตูน',
    'เล่นโซเชียล(Facebook, Instragram, Twitter)'
  ];

  String fre = '';
  String use = '';
  String rea = '';
  final time = TextEditingController();
  String application = '';

  @override
  void dispose() {
    time.dispose();
    super.dispose();
  }

  @override
  List<int?> mySASSV = List<int?>.filled(10, null);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Effect of sleep quality",
          style: TextStyle(
            fontFamily: 'Kanit',
            fontSize: 20, // ขนาดตัวอักษรตามที่ต้องการ
            color: Colors.black,
            fontWeight: FontWeight.bold, // สีตัวอักษรตามที่ต้องการ
            // คุณยังสามารถกำหนดคุณสมบัติอื่นๆ ของ TextStyle ตามต้องการ
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home), // ไอคอนของปุ่ม
            onPressed: () {
              _handHome();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Container(
            padding: const EdgeInsets.all(30),
            //height: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Smartphone Addiction Scale Short Version: SAS-SV",
                  style: TextStyle(
                      fontSize: 30, color: Colors.black, fontFamily: 'Anton'),
                ),
                Row(children: [
                  Expanded(
                      child: Text(
                          "แบบประเมินพฤติกรรมการติดโทรศัพท์มือถือสมาร์ทโฟนฉบับสั้น",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 128, 159, 90),
                              fontFamily: 'Kanit'))),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                          "แก้ไขข้อมูล",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Kanit",
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ),
                Row(children: [Text("")]),
                ...buildmore(),
                SizedBox(height: 20),
                Text('แอปพลิเคชั่นที่ใช้มากที่สุด 3 อันดับแรก',style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Kanit",
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
                SizedBox(height: 20),
                Text(
                  'สามอันดับคือ : ${sum.join(',')}',
                  style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 15,
                    color: Color.fromARGB(255, 128, 159, 90),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                _choose('Facebook');
                              },style: ElevatedButton.styleFrom(
                            fixedSize: Size(125, 40), // กำหนดขนาดของปุ่ม
                          ), child: Text('Facebook')),
                          ElevatedButton(
                              onPressed: () {
                                _choose('Instagram');
                              },style: ElevatedButton.styleFrom(
                            fixedSize: Size(125, 40), // กำหนดขนาดของปุ่ม
                          ), child: Text('Instagram')),
                          ElevatedButton(onPressed: () {
                            _choose('Line');
                          },style: ElevatedButton.styleFrom(
                            fixedSize: Size(125, 40), // กำหนดขนาดของปุ่ม
                          ), child: Text('Line')),
                          ElevatedButton(
                              onPressed: () {
                                _choose('Twitter');
                              },style: ElevatedButton.styleFrom(
                            fixedSize: Size(125, 40), // กำหนดขนาดของปุ่ม
                          ), child: Text('Twitter')),
                          ElevatedButton(
                              onPressed: () {
                                _choose('WhatApp');
                              },style: ElevatedButton.styleFrom(
                            fixedSize: Size(125, 40), // กำหนดขนาดของปุ่ม
                          ), child: Text('WhatApp')),
                        ],
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                _choose('TicTok');
                              },style: ElevatedButton.styleFrom(
                            fixedSize: Size(125, 40), // กำหนดขนาดของปุ่ม
                          ), child: Text('TicTok')),
                          ElevatedButton(
                              onPressed: () {
                                _choose('Netfix');
                              },style: ElevatedButton.styleFrom(
                            fixedSize: Size(125, 40), // กำหนดขนาดของปุ่ม
                          ), child: Text('Netfix')),
                          ElevatedButton(
                              onPressed: () {
                                _choose('YouTube');
                              },style: ElevatedButton.styleFrom(
                            fixedSize: Size(125, 40), // กำหนดขนาดของปุ่ม
                          ), child: Text('YouTube')),
                          ElevatedButton(
                              onPressed: () {
                                _choose('Spotify');
                              },style: ElevatedButton.styleFrom(
                            fixedSize: Size(125, 40), // กำหนดขนาดของปุ่ม
                          ), child: Text('Spotify')),
                          ElevatedButton(onPressed: () {
                            _choose('Joox');
                          },style: ElevatedButton.styleFrom(
                            fixedSize: Size(125, 40), // กำหนดขนาดของปุ่ม
                          ), child: Text('Joox')),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Expanded(
                        child: Text(
                            "ข้อที่ 1 ฉันใช้สมาร์ทโฟนจนไม่สามารถทำงานตามแผนที่กำหนดได้",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Kanit",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )))
                  ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...pointSASSV(0),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Expanded(
                        child: Text(
                            "ข้อที่ 2 ฉันไม่มีสมาธิในชั้นเรียน ในขณะที่ทำงานที่ได้รับมอบหมายหรือในขณะทีทำงานอื่นๆ เนื่องจากใช้สมาร์ทโฟน",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Kanit",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )))
                  ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...pointSASSV(1),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Expanded(
                        child: Text(
                            "ข้อที่ 3 รู้สึกปวดข้อมือหรือต้นคอในขณะที่ใช้สมาร์ทโฟน",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Kanit",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )))
                  ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...pointSASSV(2),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Expanded(
                        child:
                        Text("ข้อที่ 4 ฉันรู้สึกทนไม่ได้ถ้าไม่มีสมาร์ทโฟน",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Kanit",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )))
                  ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...pointSASSV(3),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Expanded(
                        child: Text(
                            "ข้อที่ 5 ฉันรู้สึกหงุดหงิดกระวนกระวายถ้าไม้ได้ถือสมาร์ทโฟนอยู่ในมือ",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Kanit",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )))
                  ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...pointSASSV(4),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Expanded(
                        child: Text(
                            "ข้อที่ 6 ฉันจะนึกถึงสมาร์ทโฟนอยู่ตลอดเวลาถึงแม้ว่าจะไม่ได้ใช้มันอยู่ก็ตาม",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Kanit",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )))
                  ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...pointSASSV(5),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Expanded(
                        child: Text(
                            "ข้อที่ 7 ฉันไม่สามารถเลิกใช้สมาร์ทโฟนได้แม้ว่ามันจะมีผลกระทบกับชีวิตประจำวันของฉันอย่างมากมาย้",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Kanit",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )))
                  ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...pointSASSV(6),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Expanded(
                        child: Text(
                            "ข้อที่ 8 ฉันต้องเช็กข้อความในสมาร์ทโฟนตลอดเวลาเพื่อไม่ให้พลาดบทสนทนาระหว่างคนอื่นๆ บน Twitter หรือ Facebook",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Kanit",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )))
                  ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...pointSASSV(7),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Expanded(
                        child:
                        Text("ข้อที่ 9 ฉันใช้สมาร์ทโฟนนานกว่าที่ตั้งใจไว้",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Kanit",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )))
                  ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...pointSASSV(8),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Expanded(
                        child: Text(
                            "ข้อที่ 10 คนรอบข้างบอกฉันว่าฉันใช้สมาร์ทโฟนมากเกินไป",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Kanit",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )))
                  ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...pointSASSV(9),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          bool containsNull = mySASSV.contains(null);
                          if (containsNull) {
                            print('no');
                          } else {
                            testprint();
                            _posteditSASSV();
                            //_handback(); // กลับไปที่หน้า _homescanState
                          }
                          //_postDataST5(); // เรียกใช้ _postDataST5 เมื่อปุ่มถูกกด
                          //testprint();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 127, 97, 166)),
                          // กำหนดสีพื้นหลังเมื่อปุ่มอยู่ในสถานะปกติ
                          foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                          elevation: MaterialStateProperty.all<double>(
                              20), // กำหนดสีของตัวอักษรเมื่อปุ่มอยู่ในสถานะปกติ
                        ),
                        child: Text("แก้ไข"),
                      ),
                    ),
                    Column(
                      children: [
                        Center(child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(last,style: TextStyle(fontFamily: "Kanit", color: Colors.red,fontSize: 21,fontWeight: FontWeight.bold,)),
                        )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handHome() {
    Navigator.pushNamed(context, AppRoute.Home);
  }
  void _editer(BuildContext context) {
    Navigator.pushNamed(context, AppRoute.edit);
  }

  Future<void> _posteditSASSV() async {
    // ข้อมูลที่จะโพสต์ไปยัง API
    double t = double.parse(time.text);
    Map<String, dynamic> data = {

      "fre": fre,
      "use": use,
      "rea": rea,
      "time": t,
      "application": application.toString(), // แปลง application เป็น String
      "n1": mySASSV[0],
      "n2": mySASSV[1],
      "n3": mySASSV[2],
      "n4": mySASSV[3],
      "n5": mySASSV[4],
      "n6": mySASSV[5],
      "n7": mySASSV[6],
      "n8": mySASSV[7],
      "n9": mySASSV[8],
      "n10": mySASSV[9],
    };
    // แปลงข้อมูลเป็น JSON
    String jsonData = jsonEncode(data);
    // URL ของ API ที่ต้องการโพสต์ข้อมูลไป
    String apiUrl = AppRoute.ipaddress + '/edit-dataSASSV';
    // สร้างคำขอโพสต์
    http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonData,
    );
    // ตรวจสอบสถานะการตอบกลับจาก API
    if (response.statusCode == 200) {
      print('Post successful!');
      print('Response: ${response.body}');
      setState(() {
        last = '';
        _editer(context);
      });
    } else {
      setState(() {
        last = 'ยังไม่ได้กำหนด ID ของข้อมูล';
      });
      print('Failed to post data. Status code: ${response.statusCode}');
    }
  }

  testprint() {
    double t = double.parse(time.text);
    return [
      // print(mySASSV[0]),
      // print(mySASSV[1]),
      // print(mySASSV[2]),
      // print(mySASSV[3]),
      // print(mySASSV[4]),
      // print(mySASSV[5]),
      // print(mySASSV[6]),
      // print(mySASSV[7]),
      // print(mySASSV[8]),
      // print(mySASSV[9]),
      print(fre),
      print(use),
      print(rea),
      print(t),
      //print(double.parse(time.text)),
      for (int i = 0; i < sum.length; i++) {
        application += sum[i],
        if (i < sum.length - 1) {
          application += ',',
        }
      },
      print(application),
    ];
  }

  pointSASSV(int i) {
    int? selectedIndex = mySASSV[i]; // Get the current selected index
    return [
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(6, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  mySASSV[i] =
                      index + 1; // Update the score for the specific item
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: selectedIndex == index + 1
                        ? Color.fromARGB(255, 128, 159, 90)
                        : Colors.grey[100],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(
                        10), // Set borderRadius for rectangle
                  ),
                  child: Center(
                    child: selectedIndex == index + 1
                        ? Icon(Icons.check, color: Colors.white)
                        : Text((index + 1).toString()),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    ];
  }

  buildmore() {
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: '',
            labelStyle: TextStyle(color: Colors.black),
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              hint: Text('ความถี่ในการใช้โทรศัพท์มือถือสมาร์ทโฟน'),
              value: frequency,
              onChanged: (newValue) {
                setState(() {
                  frequency = newValue!;
                });
                String AsString = newValue!; // ค่าที่เลือกมาแปลงเป็น String
                fre = AsString;
              },
              items: Frequency.map((String Frequency) {
                return DropdownMenuItem<String>(
                  value: Frequency,
                  child: Text(Frequency),
                );
              }).toList(),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: '',
            labelStyle: TextStyle(color: Colors.black),
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              hint: Text('คุณใช้โทรศัพท์มือถือสมาร์ทโฟนประมาณกี่ชั่วโมงต่อวัน'),
              value: usetime,
              onChanged: (newValue) {
                setState(() {
                  usetime = newValue!;
                });
                String AsString = newValue!; // ค่าที่เลือกมาแปลงเป็น String
                use = AsString;
              },
              items: Usetime.map((String Usetime) {
                return DropdownMenuItem<String>(
                  value: Usetime,
                  child: Text(Usetime),
                );
              }).toList(),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: '',
            labelStyle: TextStyle(color: Colors.black),
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              hint: Text(
                  'เหตุผลส่วนมากในการใช้โทรศัพท์มือถือสมาร์ทโฟนของคุณคืออะไร'),
              value: reason,
              onChanged: (newValue) {
                setState(() {
                  reason = newValue!;
                });
                String AsString = newValue!; // ค่าที่เลือกมาแปลงเป็น String
                rea = AsString;
              },
              items: Reason.map((String Reason) {
                return DropdownMenuItem<String>(
                  value: Reason,
                  child: Text(Reason),
                );
              }).toList(),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: time,
          decoration: InputDecoration(
            labelText: 'ระยะเวลาเฉลี่ยของการใช้มือถือต่อวัน ตัวอย่าง 5.20 (ห้าชั่วโมงยี่สิบนาที)',
            //labelStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(),
          ),
        ),
      ),
    ];
  }

  void _choose(String s) {
    if(sum.length<3) {
      setState(() {
        sum.add(s);
      });
    }
    else if(sum.length>=3){
      setState(() {
        sum = [];
        sum.add(s);
      });
    }
  }
}
