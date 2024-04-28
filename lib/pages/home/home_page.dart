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
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Effect of sleep quality"),
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
              //Color.fromARGB(255, 49, 250, 170),
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 26, 161, 210)
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...buidmenu(),
          ],
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> fetchData() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:5000/get_person'));
    if (response.statusCode == 200) {
      print(response.body);
      //print("hello");
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

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
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), // กำหนดสีพื้นหลังเมื่อปุ่มอยู่ในสถานะปกติ
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // กำหนดสีของตัวอักษรเมื่อปุ่มอยู่ในสถานะปกติ
        ),
        child: Text("นำเข้าข้อมูล"),
      ),
      OutlinedButton(
        onPressed: _handleinputdata,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), // กำหนดสีพื้นหลังเมื่อปุ่มอยู่ในสถานะปกติ
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // กำหนดสีของตัวอักษรเมื่อปุ่มอยู่ในสถานะปกติ
        ),
        child: Text("import Excel file"),
      ),
      OutlinedButton(
        onPressed: _handledata,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), // กำหนดสีพื้นหลังเมื่อปุ่มอยู่ในสถานะปกติ
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // กำหนดสีของตัวอักษรเมื่อปุ่มอยู่ในสถานะปกติ
        ),
        child: Text("ฐานข้อมูล"),
      ),
      /*OutlinedButton(
        onPressed: _po,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), // กำหนดสีพื้นหลังเมื่อปุ่มอยู่ในสถานะปกติ
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // กำหนดสีของตัวอักษรเมื่อปุ่มอยู่ในสถานะปกติ
        ),
        child: Text("Test to API"),
      ),*/
    ];
  }


}
