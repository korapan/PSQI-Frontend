import 'package:flutter/material.dart';
import 'package:projectmobile/pages/log/routes.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';
import 'package:permission_handler/permission_handler.dart';

import 'dart:core';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.storage.request();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: fileOut(),
    );
  }
}

class fileOut extends StatefulWidget {
  const fileOut({Key? key}) : super(key: key);

  @override
  State<fileOut> createState() => _fileOutState();
}

class _fileOutState extends State<fileOut> {
  List<dynamic> make = [];
  List<String> sum = [];
  List<ChecklistItem> _items = [
    ChecklistItem(title: 'ข้อมูลส่วนตัว'),
    ChecklistItem(title: 'ข้อมูลความเครียด'),
    ChecklistItem(title: 'ข้อมูลการติดสมาร์ทโฟน'),
    ChecklistItem(title: 'ข้อมูลคุณภาพการนอนหลับ'),
    ChecklistItem(title: 'ข้อมูลทั้งหมด')
  ];

  final start = TextEditingController();
  final stop = TextEditingController();

  @override
  void initState() {
    super.initState();
    start.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {});
  }

  void _toggleItem(int index) {
    setState(() {
      _items[index].isChecked = !_items[index].isChecked;
      if (_items[index].isChecked) {
        sum.add(_items[index].title);
      } else {
        sum.remove(_items[index].title);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ผลกระทบของคุณภาพการนอนหลับ",
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
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '  ระบุช่วงของข้อมูล',
                style: TextStyle(
                  fontFamily: 'Kanit',
                  fontSize: 21,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 118,
              child: TextField(
                controller: start,
                decoration: InputDecoration(
                  labelText: 'รหัส ID เริ่มต้น',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 5.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 118,
              child: TextField(
                controller: stop,
                decoration: InputDecoration(
                  labelText: 'รหัส ID สุดท้าย',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 5.0),
                ),
              ),
            ),
          ),
          if (start.text.isEmpty) ...buildCheck(),
          IconButton(
            icon: SizedBox(
              width: 100,
              height: 100,
              child: Image.asset('assets/excellogo1.png'),
            ),
            onPressed: () {
              if (start.text.isNotEmpty)
              sendScope(start.text,stop.text);
              else if (start.text.isEmpty){
                sendSum(sum);
              };
              _handHome(context);
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'ไฟล์ที่ต้องการ : ${sum.join(', ')}',
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

  Future<void> saveFile(Uint8List responseBodyBytes, String fileName) async {
    try {
      Directory directory = await getApplicationDocumentsDirectory();
      String filePath = '${directory.path}/$fileName';
      File savedFile = File(filePath);
      await savedFile.writeAsBytes(responseBodyBytes);
      print('ไฟล์ถูกบันทึกที่ $filePath');
    } catch (e) {
      print('เกิดข้อผิดพลาดขณะพยายามบันทึกไฟล์: $e');
    }
  }

  void sendSum(List<String> data) async {
    final apiUrl = AppRoute.ipaddress + '/receive_excel';
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{'data': data}),
      );
      if (response.statusCode == 200) {
        print('ข้อมูลได้รับการตอบกลับใน response body');
        print('ส่งข้อมูลสำเร็จ!');

        Uint8List bytes = Uint8List.fromList(response.bodyBytes);
        await saveFile(bytes, 'response_file.xlsx');
      } else {
        print('Failed to send data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending data: $e');
    }
  }
  void sendScope(String start, String stop) async {
    final response = await http.get(Uri.parse('${AppRoute.ipaddress}/receive_excelspecifix?start=$start&stop=$stop'));
    if (response.statusCode == 200) {
      // แปลงข้อมูล JSON ที่ได้รับเป็น List<dynamic>
    } else {
      // จัดการข้อผิดพลาด
      throw Exception('Failed to load data');
    }
  }

  List<Widget> buildCheck() {
    return [
      Expanded(
        child: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                _items[index].title,
                style: TextStyle(
                  fontFamily: 'Kanit',
                  fontSize: 21,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
    ];
  }

  @override
  void dispose() {
    start.removeListener(_onTextChanged);
    start.dispose();
    stop.dispose();
    super.dispose();
  }
}

class ChecklistItem {
  String title;
  bool isChecked;

  ChecklistItem({required this.title, this.isChecked = false});
}