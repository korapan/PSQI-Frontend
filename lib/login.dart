import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projectmobile/pages/home/home_page.dart';
import 'package:projectmobile/pages/log/routes.dart';
import 'package:http/http.dart' as http;

class Login_page extends StatefulWidget {
  const Login_page({Key? key}) : super(key: key);

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  final username = TextEditingController();
  final password = TextEditingController();
  String stage = '';

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 127, 97, 166),
      body: Center(
        child: Container(
          width: 300,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/img_4.png'),
              ),
              SizedBox(height: 20),
              Text(
                'ยืนยันแก้ไขข้อมูล',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                controller: username,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: password,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _login();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text(
                  'ยืนยัน',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 20),
              IconButton(
                icon: Icon(Icons.home), // ไอคอนของปุ่ม
                onPressed: () {
                  _handHome(context);
                },
              ),
              SizedBox(height: 20),
              Text(
                stage,
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _login() async {
    // ข้อมูลที่จะส่งไปยัง API
    Map<String, dynamic> data = {
      "username": username.text,
      "password": password.text,
    };
    // แปลงข้อมูลเป็น JSON
    String jsonData = jsonEncode(data);

    // URL ของ API
    String apiUrl = AppRoute.ipaddress+'/post_login'; // เปลี่ยน URL ให้ถูกต้อง

    // สร้างคำขอ POST
    http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonData,
    );

    // ตรวจสอบสถานะการตอบกลับจาก API
    if (response.statusCode == 200) {
      // ดำเนินการหลังจากเข้าสู่ระบบสำเร็จ
      Map<String, dynamic> responseJson = jsonDecode(response.body);
      int user = responseJson['user'];
      print('User: $user');

      print('Login successful');
      if(user == 1){
        _newediter(context);
      }
      else if(user == 2)
         //_start(context);
        setState(() {
          stage = 'กรุณาใส่รหัสผ่านใหม่';
        });
    } else {
      setState(() {
        stage = 'กรุณาใส่รหัสผ่านใหม่';
      });
      print('Login failed. Status code: ${response.statusCode}');
    }
  }
}
void _start(BuildContext context) {
  Navigator.pushNamed(context, AppRoute.home);

}
void _start1(BuildContext context) {
  Navigator.pushNamed(context, AppRoute.home1);
}
void _newediter(BuildContext context) {
  Navigator.pushNamed(context, AppRoute.newotheredit);
}
void _handHome(BuildContext context) {
  Navigator.pushNamed(context, AppRoute.Home);
}