import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../log/routes.dart';

class homescan extends StatefulWidget {
  const homescan({Key? key}) : super(key: key);

  @override
  State<homescan> createState() => _homescanState();
}

class _homescanState extends State<homescan> {
  final ID = TextEditingController();
  final sex = TextEditingController();
  final ofAge = TextEditingController();
  final year = TextEditingController();
  final numoflearn = TextEditingController();
  final learnforweek = TextEditingController();

  @override
  void dispose() {
    ID.dispose();
    sex.dispose();
    ofAge.dispose();
    year.dispose();
    numoflearn.dispose();
    learnforweek.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("INPUT DATA"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 26, 161, 210)
            ],
          ),
        ),
        child: Column(
          children: [
            ...bulidText(),
            ...authorbuid(),
          ],
        ),
      ),
    );
  }

  bulidText() {
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: ID,
          decoration: InputDecoration(
            labelText: "รหัส",
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: sex,
          decoration: InputDecoration(
            labelText: "เพศ",
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: ofAge,
          decoration: InputDecoration(
            labelText: "อายุ",
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: year,
          decoration: InputDecoration(
            labelText: "ชั้นปี",
            labelStyle: TextStyle(color: Colors.white),
            //filled: true,
            // กำหนดให้มีการเติมสีพื้นหลัง
            //fillColor: Colors.grey,
            border: OutlineInputBorder(),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: numoflearn,
          decoration: InputDecoration(
            labelText: "จำนวนหน่วยกิจในเทอมการศึกษา",
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: learnforweek,
          decoration: InputDecoration(
            labelText: "จำนวนชั่วโมงเรียน",
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(),
          ),
        ),
      ),
    ];
  }

  void _ST5() {
    Navigator.pushNamed(context, AppRoute.ST5);
  }

  void _SASSV() {
    Navigator.pushNamed(context, AppRoute.SASSV);
  }

  void _PSQI() {
    Navigator.pushNamed(context, AppRoute.PSQI);
  }

  void _printValues() {
    print('ID: ${ID.text}');
    print('Sex: ${sex.text}');
    print('Age: ${ofAge.text}');
    print('Year: ${year.text}');
    print('Number of Learn: ${numoflearn.text}');
    print('Learn for Week: ${learnforweek.text}');
  }

  authorbuid() {
    return [
      ElevatedButton(
        onPressed: _ST5,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          // กำหนดสีพื้นหลังเมื่อปุ่มอยู่ในสถานะปกติ
          foregroundColor: MaterialStateProperty.all<Color>(
              Colors.white), // กำหนดสีของตัวอักษรเมื่อปุ่มอยู่ในสถานะปกติ
        ),
        child: Text("        แบบประเมินความเครียด (ST-5)        "),
      ),

      OutlinedButton(
        onPressed: _SASSV,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          // กำหนดสีพื้นหลังเมื่อปุ่มอยู่ในสถานะปกติ
          foregroundColor: MaterialStateProperty.all<Color>(
              Colors.white), // กำหนดสีของตัวอักษรเมื่อปุ่มอยู่ในสถานะปกติ
        ),
        child: Text("แบบประเมินการติดสมาร์ทโฟน (SAS-SV)"),
      ),
      OutlinedButton(
        onPressed: _PSQI,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          // กำหนดสีพื้นหลังเมื่อปุ่มอยู่ในสถานะปกติ
          foregroundColor: MaterialStateProperty.all<Color>(
              Colors.white), // กำหนดสีของตัวอักษรเมื่อปุ่มอยู่ในสถานะปกติ
        ),
        child: Text(" แบบประเมินคุณภาพการนอนหลับ PSQI "),
      ),
      OutlinedButton(
          onPressed: _postData, // เรียกใช้ฟังก์ชัน _printValues เมื่อปุ่มถูกกด
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          child: Text("     SUCCES     "), // เปลี่ยนข้อความบนปุ่มเป็น "Print Values"
      ),
    ];
  }

  Future<void> _postData() async {
    // ข้อมูลที่จะโพสต์ไปยัง API
    Map<String, dynamic> data = {
      "ID" : int.parse(ID.text),
      "sex" : sex.text,
      "ofAge" : int.parse(ofAge.text),
      "year" : int.parse(year.text),
      "numoflearn" : int.parse(numoflearn.text),
      "learnforweek" : int.parse(learnforweek.text),
    };
    // แปลงข้อมูลเป็น JSON
    String jsonData = jsonEncode(data);
    // URL ของ API ที่ต้องการโพสต์ข้อมูลไป
    String apiUrl = 'http://127.0.0.1:5000/receive-data';
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
}
