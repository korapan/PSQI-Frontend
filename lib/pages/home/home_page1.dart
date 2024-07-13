import 'package:flutter/material.dart';
import 'package:projectmobile/pages/log/routes.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:projectmobile/pages/testAPI/API.dart';


class Homepage1 extends StatefulWidget {
  const Homepage1({super.key});
  @override
  State<Homepage1> createState() => _Homepage1State();
}

class _Homepage1State extends State<Homepage1> {
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
        actions: <Widget>[
          IconButton(
            icon: Row(
              children: [
                Icon(Icons.output_sharp), // ไอคอนของปุ่ม
                SizedBox(width: 5), // ระยะห่างระหว่างไอคอนกับข้อความ
                Text("ออกจากระบบ"), // ข้อความที่ต้องการจะแสดง
              ],
            ),
            onPressed: () {
              _login(context);
            },
            tooltip: "Home", // ข้อความ tooltip สำหรับปุ่ม
          ),
        ],
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
                          color: Color.fromARGB(255, 128, 159, 90), // สีแดง
                          fontFamily: 'Kanit'
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          IconButton(
                            icon: SizedBox(
                              width: 40,
                              height: 40,
                              child: Image.asset('assets/img_1.png'),
                            ),
                            onPressed: () {
                              _editer(context);
                            },
                          ),
                          Text(
                            'ค้นหา',
                            style: TextStyle(
                              fontSize: 10, // ปรับขนาดตัวอักษรตามที่ต้องการ
                              color: Colors.black, // เลือกสีตามที่ต้องการ
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          IconButton(
                            icon: SizedBox(
                              width: 40,
                              height: 40,
                              child: Image.asset('assets/img_7.png'),
                            ),
                            onPressed: () {
                              _newediter(context);
                            },
                          ),
                          Text(
                            'แก้ไขข้อมูล',
                            style: TextStyle(
                              fontSize: 10, // ปรับขนาดตัวอักษรตามที่ต้องการ
                              color: Colors.black, // เลือกสีตามที่ต้องการ
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                child : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          IconButton(
                            icon: SizedBox(
                              width: 40,
                              height: 40,
                              child: Image.asset('assets/img_3.png'),
                            ),
                            onPressed: () {
                              _General(context);
                            },
                          ),
                          Text(
                            'ข้อมูลทั่วไป',
                            style: TextStyle(
                              fontSize: 10, // ปรับขนาดตัวอักษรตามที่ต้องการ
                              color: Colors.black, // เลือกสีตามที่ต้องการ
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          IconButton(
                            icon: SizedBox(
                              width: 40,
                              height: 40,
                              child: Image.asset('assets/img_5.png'),
                            ),
                            onPressed: () {
                              _seemdt5(context);
                            },
                          ),
                          Text(
                            'ความเครียด',
                            style: TextStyle(
                              fontSize: 10, // ปรับขนาดตัวอักษรตามที่ต้องการ
                              color: Colors.black, // เลือกสีตามที่ต้องการ
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          IconButton(
                            icon: SizedBox(
                              width: 40,
                              height: 40,
                              child: Image.asset('assets/img_6.png'),
                            ),
                            onPressed: () {
                              _seemsassv(context);
                            },
                          ),
                          Text(
                            'การติดมือถือ',
                            style: TextStyle(
                              fontSize: 10, // ปรับขนาดตัวอักษรตามที่ต้องการ
                              color: Colors.black, // เลือกสีตามที่ต้องการ
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          IconButton(
                            icon: SizedBox(
                              width: 40,
                              height: 40,
                              child: Image.asset('assets/img_4.png'),
                            ),
                            onPressed: () {
                              _seempsqi(context);
                            },
                          ),
                          Text(
                            'คุณภาพการนอนหลับ',
                            style: TextStyle(
                              fontSize: 10, // ปรับขนาดตัวอักษรตามที่ต้องการ
                              color: Colors.black, // เลือกสีตามที่ต้องการ
                            ),
                          ),
                        ],
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
  //final response = await http.get(Uri.parse(AppRoute.ipaddress+'/get_person'));
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

  void _hand() {
    Navigator.pushNamed(context, AppRoute.drec);
  }

  buidmenu() {
    return [
      ElevatedButton(
        onPressed: _handpsqi,
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all<Size>(Size(50,80)), // กำหนดขนาดของปุ่ม
          backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 127, 97, 166)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0), // กำหนดความโค้งของมุม
            ),
          ),
          elevation: MaterialStateProperty.all<double>(50), // กำหนดความสูงของเงา
        ),
        child: Text("กรอกข้อมูล",
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Kanit',
            //fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(height: 30),
      ElevatedButton(
        onPressed: _handleinputdata,
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all<Size>(Size(50,80)),
          backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 127, 97, 166)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          elevation: MaterialStateProperty.all<double>(50),
        ),
        child: Text("IMPORT EXCEL FILE",
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Kanit',
            //fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(height: 30),
      ElevatedButton(
        onPressed: () {
          _foroutfile(context);
        },
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all<Size>(Size(50,80)),
          backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 127, 97, 166)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          elevation: MaterialStateProperty.all<double>(50),
        ),
        child: Text("EXPORT EXCEL FILE",
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Kanit',
            //fontWeight: FontWeight.bold,
          ),
        ),
      ),


      // ElevatedButton(
      //   onPressed: () {
      //     _hand();
      //   },
      //   style: ButtonStyle(
      //     fixedSize: MaterialStateProperty.all<Size>(Size(50,80)),
      //     backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 127, 97, 166)),
      //     foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      //       RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(20.0),
      //       ),
      //     ),
      //     elevation: MaterialStateProperty.all<double>(50),
      //   ),
      //   child: Text(" ",
      //     style: TextStyle(
      //       fontSize: 20,
      //       fontFamily: 'Kanit',
      //       //fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
    ];
  }

  void _General(BuildContext context) {
    Navigator.pushNamed(context, AppRoute.general);
  }

  void _seemdt5(BuildContext context) {
    Navigator.pushNamed(context, AppRoute.showST5);
  }
  void _seemsassv(BuildContext context) {
    Navigator.pushNamed(context, AppRoute.showSASSV);
  }

  void _seempsqi(BuildContext context) {
    Navigator.pushNamed(context, AppRoute.showPSQI);
  }

  void _editer(BuildContext context) {
    Navigator.pushNamed(context, AppRoute.edit);
  }

  void _foroutfile(BuildContext context) {
    Navigator.pushNamed(context, AppRoute.foroutfile);
  }

  void _newediter(BuildContext context) {
    Navigator.pushNamed(context, AppRoute.newotheredit);
  }

  void _login(BuildContext context) {
    Navigator.pushNamed(context, AppRoute.log);
  }
}
