import 'package:flutter/material.dart';
import 'package:projectmobile/pages/log/routes.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:excel/excel.dart';
import 'dart:io';

class fileOut extends StatefulWidget {
  const fileOut({Key? key}) : super(key: key);

  @override
  State<fileOut> createState() => _fileOutState();
}

class _fileOutState extends State<fileOut> {
  List<dynamic> make = [];
  List<String> sum = []; // ตัวแปรที่เก็บค่ารายการที่ถูกเช็ค
  List<ChecklistItem> _items = [
    ChecklistItem(title: 'ข้อมูลส่วนตัว'),
    ChecklistItem(title: 'ข้อมูลความเครียด'),
    ChecklistItem(title: 'ข้อมูลการติดสมาร์ทโฟน'),
    ChecklistItem(title: 'ข้อมูลคุณภาพการนอนหลับ'),
    ChecklistItem(title: 'เฉพาะผลลัพธ์')
  ];


  void _toggleItem(int index) {
    setState(() {
      _items[index].isChecked = !_items[index].isChecked;
      if (_items[index].isChecked) {
        sum.add(_items[index].title); // เพิ่มรายการที่ถูกเช็คเข้าไปใน sum
      } else {
        sum.remove(_items[index].title); // เอารายการที่ถูกยกเลิกการเช็คออกจาก sum
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Effect of sleep quality",
          style: TextStyle(
            fontFamily: 'Kanit',
            fontSize: 21,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              _handHome(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            child: SizedBox(height: 100,),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_items[index].title,
                    style: TextStyle(
                      fontFamily: 'Kanit',
                      fontSize: 21,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),),
                  leading: Checkbox(
                    value: _items[index].isChecked,
                    onChanged: (value) {
                      _toggleItem(index);
                    },
                  ),
                );
              },
            ),
          ),
          Container(
            child: IconButton(
              icon: SizedBox(
                width: 100, // กำหนดความกว้างที่ต้องการ
                height: 100, // กำหนดความสูงที่ต้องการ
                child: Image.asset('assets/excellogo1.png'),
              ),
              onPressed: () {
                sendsum(sum);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'ไฟล์ที่ต้องการ : ${sum.join(',')}', // แสดงรายการที่ถูกเช็คในตัวแปร sum
              style: TextStyle(
                fontFamily: 'Kanit',
                fontSize: 21,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handHome(BuildContext context) {
    Navigator.pushNamed(context, AppRoute.Home);
  }

  void sendsum(List<String> data) async {
    final apiUrl = 'http://127.0.0.1:5000/receive_excel'; // แทนที่ URL ของ API ที่คุณต้องการใช้งาน

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{'data': data}),
      );

      if (response.statusCode == 200) {
        // สำเร็จ
        print('Data sent successfully!');
        make = json.decode(response.body);
      } else {
        // ไม่สำเร็จ
        print('Failed to send data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // มีข้อผิดพลาดในการส่งข้อมูล
      print('Error sending data: $e');
    }
  }
}
class ChecklistItem {
  String title;
  bool isChecked;

  ChecklistItem({required this.title, this.isChecked = false});
}
