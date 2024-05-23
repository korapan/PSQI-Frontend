import 'package:flutter/material.dart';
import 'package:projectmobile/pages/log/routes.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:projectmobile/pages/testAPI/API.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  //void initState() {
    // TODO: implement initState
    //super.initState();
    //fetchData();
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Effect of sleep quality",
          style: TextStyle(
            fontFamily: 'Kanit',
            fontSize: 20, // ขนาดตัวอักษรตามที่ต้องการ
            color: Colors.black, // สีตัวอักษรตามที่ต้องการ
            // คุณยังสามารถกำหนดคุณสมบัติอื่นๆ ของ TextStyle ตามต้องการ
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white, // กำหนดสีของพื้นหลัง
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "A smartphone addiction assessment system",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                          fontFamily: 'Anton'
                      ),
                    ),
                    Text(
                      "On the effect of sleep quality",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                          fontFamily: 'Anton'
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "ระบบประเมินการเสพติดการใช้สมาร์ทโฟนที่ส่งผลต่อคุณภาพการนอนหลับ",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 243, 136, 30), // สีแดง
                        fontFamily: 'Kanit'
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              ...buidmenu(),
            ],
          ),
        ),
      ),
    );
  }

  //Future<Map<String, dynamic>> fetchData() async {
    //final response = await http.get(Uri.parse('http://127.0.0.1:5000/get_person'));
    //if (response.statusCode == 200) {
      //print(response.body);
      //return jsonDecode(response.body);
    //} else {
      //throw Exception('Failed to load data');
    //}
  //}

  void _handpsqi() {
    Navigator.pushNamed(context, AppRoute.scan);
  }
  void _handleinputdata() {
    Navigator.pushNamed(context, AppRoute.inputdata);
  }
  void _handledata() {
    Navigator.pushNamed(context, AppRoute.data);
  }

  buidmenu() {
    return [
      ElevatedButton(
        onPressed: _handpsqi,
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all<Size>(Size(50,80)), // กำหนดขนาดของปุ่ม
          backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 243, 136, 30)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0), // กำหนดความโค้งของมุม
            ),
          ),
          elevation: MaterialStateProperty.all<double>(20), // กำหนดความสูงของเงา
        ),
        child: Text("กรอกข้อมูล"),
      ),
      SizedBox(height: 30),
      ElevatedButton(
        onPressed: _handleinputdata,
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all<Size>(Size(50,80)),
          backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 243, 136, 30)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          elevation: MaterialStateProperty.all<double>(20),
        ),
        child: Text("IMPORT EXCEL FILE"),
      ),
      SizedBox(height: 30),
      ElevatedButton(
        onPressed: _handledata,
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all<Size>(Size(50,80)),
          backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 243, 136, 30)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          elevation: MaterialStateProperty.all<double>(20),
        ),
        child: Text("ข้อมูล"),
      ),
    ];
  }
}
