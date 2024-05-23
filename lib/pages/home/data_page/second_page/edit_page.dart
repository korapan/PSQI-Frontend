import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projectmobile/pages/log/routes.dart';

class Editor extends StatefulWidget {
  const Editor({Key? key}) : super(key: key);

  @override
  State<Editor> createState() => _EditorState();
}

final id = TextEditingController();
final deleteid = TextEditingController();

class _EditorState extends State<Editor> {
  late Future<List<dynamic>> futureData;
  String apiResponse = '';
  String combinedStressLevels = '';
  String com = '';

  @override
  void initState() {
    super.initState();
    futureData = Future.value([]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ผลกระทบจากคุณภาพการนอน",
          style: TextStyle(
            fontFamily: 'Kanit',
            fontSize: 21,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              _handleHome(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: id,
                decoration: InputDecoration(
                  labelText: 'รหัสที่ต้องการค้นหา',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: OutlinedButton(
                onPressed: () {
                  _postFind();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                  side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
                ),
                child: Text(
                  "ค้นหา",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Kanit',
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 243, 136, 30),
                  ),
                ),
              ),
            ),
            ...buidtext(),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: OutlinedButton(
                onPressed: () {
                  _postDelete();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                  side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
                ),
                child: Text(
                  "ลบข้อมูล",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Kanit',
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 243, 136, 30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleHome(BuildContext context) {
    Navigator.pushNamed(context, AppRoute.Home);
  }

  Future<void> _postFind() async {
    // ข้อมูลที่จะโพสต์ไปยัง API
    Map<String, dynamic> data = {
      "idST5": int.parse(id.text), // ใช้ "idST5" แทน "ID"
    };
    // แปลงข้อมูลเป็น JSON
    String jsonData = jsonEncode(data);
    // URL ของ API ที่ต้องการโพสต์ข้อมูลไป
    String apiUrl = 'http://127.0.0.1:5000/post_id';
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
      print('โพสต์สำเร็จ!');
      var jsonString = utf8.decode(response.bodyBytes); // แปลง bytes เป็น String ด้วย utf8.decode
      setState(() {
        apiResponse = jsonString; // อัปเดตค่าของตัวแปร apiResponse
        var responseJson = jsonDecode(apiResponse);
        combinedStressLevels = responseJson['combined_stress_levels']; // กำหนดค่าให้กับ combinedStressLevels
      });
      print(combinedStressLevels);
    } else {
      print('การโพสต์ข้อมูลล้มเหลว. รหัสสถานะ: ${response.statusCode}');
    }
  }

  Future<void> _postDelete() async {
    // ข้อมูลที่จะส่งไปยัง API
    Map<String, dynamic> data = {
      "id": int.parse(id.text),
    };

    // แปลงข้อมูลเป็น JSON
    String jsonData = jsonEncode(data);

    // URL ของ API
    String apiUrl = 'http://127.0.0.1:5000/post_deleteid';

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
      print('ส่งค่า ID เรียบร้อยแล้ว');
      setState(() {
        apiResponse = jsonDecode(response.body)['message'];
      });
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('ลบข้อมูลสำเร็จ'))
      );
    } else {
      print('การส่งค่า ID ล้มเหลว. รหัสสถานะ: ${response.statusCode}');
    }
  }

  buidtext() {
    return [
      Text(combinedStressLevels,
        style: TextStyle(
          fontFamily: 'Kanit',
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    ];
  }
}
