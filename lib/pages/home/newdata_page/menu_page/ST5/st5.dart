import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projectmobile/pages/log/routes.dart';

class st5 extends StatefulWidget {
  const st5({Key? key}) : super(key: key);

  @override
  State<st5> createState() => _st5State();
}

class _st5State extends State<st5> {
  @override
  List<int> myArray = List<int>.filled(5, 0);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Effect of sleep quality",
          style: TextStyle(
            fontFamily: 'Kanit',
            fontSize: 21, // ขนาดตัวอักษรตามที่ต้องการ
            color: Colors.black,
            fontWeight: FontWeight.bold,// สีตัวอักษรตามที่ต้องการ
            // คุณยังสามารถกำหนดคุณสมบัติอื่นๆ ของ TextStyle ตามต้องการ
          ),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
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
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start, // กำหนดให้ Column จัดวางตามด้านบน
              crossAxisAlignment: CrossAxisAlignment.start,
              // จัดวาง children ใน Column ไปทางด้านซ้าย
              children: [
                Text("ST-5",
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Kanit",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
                Text("แบบประเมินความเครียด",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Kanit",
                      color: Color.fromARGB(255, 243, 136, 30),
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                          "ความเครียดเกิดขึ้นได้กับทุกคน สาเหตุที่ทำให้เกิดความเครียดมีหลายอย่าง "
                          "ความเครียดมีทั้งมีทั้งประโยชน์และโทษ หากมากเกินไปจะเกิดผลเสียต่อร่างกายและจิตใจของท่าน "
                          "ขอให้ท่านลองประเมินตนเองโดยให้คะแนน 0-3 ที่ตรงกับความรู้สึกของท่าน",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Kanit",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(children: [
                  Text("คะแนน 0 หมายถึง แทบไม่มี",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Kanit",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ))
                ]),
                Row(children: [
                  Text("คะแนน 1 หมายถึง เป็นบางครัง",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Kanit",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ))
                ]),
                Row(children: [
                  Text("คะแนน 2 หมายถึง บ่อยครั้ง",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Kanit",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ))
                ]),
                Row(
                  children: [
                    Text(
                      "คะแนน 3 หมายถึง เป็นประจำ",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Kanit",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30), // Adjust the height as needed
                Row(children: [
                  Text("ข้อที่ 1 มีปัญหาการนอน นอนไม่หลับหรือนอนมาก",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Kanit",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ))
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _oneclickadd,
                      icon: Icon(Icons.add),
                    ),
                    Text(" ${myArray[0]} คะแนน "),
                    IconButton(
                      onPressed: _oneclickremove,
                      icon: Icon(Icons.remove),
                    )
                  ],
                ),
                Row(children: [
                  Text("ข้อที่ 2 มีสมาธิน้อยลง",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Kanit",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ))
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _twoclickadd,
                      icon: Icon(Icons.add),
                    ),
                    Text(" ${myArray[1]} คะแนน "),
                    IconButton(
                      onPressed: _twoclickremove,
                      icon: Icon(Icons.remove),
                    ),
                  ],
                ),
                Row(children: [
                  Text("ข้อที่ 3 หงุดหงิด/กระวนกระวาย/ว้าวุ่นใจ",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Kanit",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ))
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _threeclickadd,
                      icon: Icon(Icons.add),
                    ),
                    Text(" ${myArray[2]} คะแนน "),
                    IconButton(
                      onPressed: _threeclickremove,
                      icon: Icon(Icons.remove),
                    )
                  ],
                ),
                Row(children: [
                  Text("ข้อที่ 4 รู้สึกเบื่อ เซ็ง",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Kanit",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ))
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _fourclickadd,
                      icon: Icon(Icons.add),
                    ),
                    Text(" ${myArray[3]} คะแนน "),
                    IconButton(
                      onPressed: _fourclickremove,
                      icon: Icon(Icons.remove),
                    )
                  ],
                ),
                Row(children: [
                  Text("ข้อที่ 5 ไม่อยากพบปะผู้คน",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Kanit",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ))
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _fiveclickadd,
                      icon: Icon(Icons.add),
                    ),
                    Text(" ${myArray[4]} คะแนน "),
                    IconButton(
                      onPressed: _fiveclickremove,
                      icon: Icon(Icons.remove),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _postDataST5(); // เรียกใช้ _postDataST5 เมื่อปุ่มถูกกด
                        //_handback(); // กลับไปที่หน้า _homescanState
                        _SASSV();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Color.fromARGB(255, 243, 136, 30)),
                        // กำหนดสีพื้นหลังเมื่อปุ่มอยู่ในสถานะปกติ
                        foregroundColor: MaterialStateProperty.all<Color>(Colors
                            .white),
                        elevation: MaterialStateProperty.all<double>(20),// กำหนดสีของตัวอักษรเมื่อปุ่มอยู่ในสถานะปกติ
                      ),
                      child: Text("ยืนยัน"),
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

  void _handback() {
    Navigator.pushNamed(context, AppRoute.scan);
  }

  void _oneclickadd() {
    setState(() {
      myArray[0] += 1;
    });
  }

  void _oneclickremove() {
    setState(() {
      myArray[0] -= 1;
    });
  }

  void _twoclickadd() {
    setState(() {
      myArray[1] = myArray[1] + 1;
    });
  }

  void _twoclickremove() {
    setState(() {
      myArray[1] += 1;
    });
  }

  void _threeclickadd() {
    setState(() {
      myArray[2] += 1;
    });
  }

  void _threeclickremove() {
    setState(() {
      myArray[2] -= 1;
    });
  }

  void _fourclickadd() {
    setState(() {
      myArray[3] += 1;
    });
  }

  void _fourclickremove() {
    setState(() {
      myArray[3] -= 1;
    });
  }

  void _fiveclickadd() {
    setState(() {
      myArray[4] += 1;
    });
  }

  void _fiveclickremove() {
    setState(() {
      myArray[4] -= 1;
    });
  }

  Future<void> _postDataST5() async {
    // ข้อมูลที่จะโพสต์ไปยัง API
    Map<String, dynamic> data = {
      "ns1": int.parse(myArray[0].toString()),
      "ns2": int.parse(myArray[1].toString()),
      "ns3": int.parse(myArray[2].toString()),
      "ns4": int.parse(myArray[3].toString()),
      "ns5": int.parse(myArray[4].toString()),
    };
    // แปลงข้อมูลเป็น JSON
    String jsonData = jsonEncode(data);
    // URL ของ API ที่ต้องการโพสต์ข้อมูลไป
    String apiUrl = 'http://127.0.0.1:5000//receive-dataST5';
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
    } else {
      print('Failed to post data. Status code: ${response.statusCode}');
    }
  }
  void _SASSV() {
    Navigator.pushNamed(context, AppRoute.SASSV);
  }
}
