import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:projectmobile/pages/log/routes.dart';

class otheredit extends StatefulWidget {
  const otheredit({Key? key}) : super(key: key);

  @override
  State<otheredit> createState() => _othereditState();
}
final id = TextEditingController();
final iid = TextEditingController();

class _othereditState extends State<otheredit> {
  String apiResponse = '';
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
              controller: iid,
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
                E_ST5();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
              ),
              child: Text(
                "แก้ไขข้อมูล ST5",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Kanit',
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 128, 159, 90),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: OutlinedButton(
              onPressed: () {
                E_SASSV();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
              ),
              child: Text(
                "แก้ไขข้อมูล SASSV",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Kanit',
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 128, 159, 90),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: OutlinedButton(
              onPressed: () {
                E_PSQI();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
              ),
              child: Text(
                "แก้ไขข้อมูล PSQI",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Kanit',
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 128, 159, 90),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: id,
              decoration: InputDecoration(
                labelText: 'รหัสที่ต้องการลบ',
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
                  color: Colors.red,
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(15.0),
          //   child: OutlinedButton(
          //     onPressed: () {
          //       _Delete();
          //     },
          //     style: ButtonStyle(
          //       backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          //       foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          //       side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
          //     ),
          //     child: Text(
          //       "ลบข้อมูลทั้งหมด",
          //       style: TextStyle(
          //         fontSize: 25,
          //         fontFamily: 'Kanit',
          //         fontWeight: FontWeight.bold,
          //         color: Colors.red,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    ),

    );
  }
  Future<void> _Delete() async {
    String apiUrl = AppRoute.ipaddress + '/post_deleteall'; // แทนที่ด้วย URL ของ API ที่คุณต้องการส่งคำขอ
    final url = Uri.parse(apiUrl); // สร้าง Uri จาก apiUrl

    try {
      final response = await http.delete(url);
      if (response.statusCode == 200) {
        print('Data deleted successfully');
        // ทำสิ่งที่คุณต้องการหลังจากลบข้อมูลสำเร็จ เช่น แสดงข้อความหรืออัปเดต UI
      } else {
        print('Failed to delete data');
        // แสดงข้อผิดพลาดหรือแจ้งผู้ใช้ว่าการลบข้อมูลไม่สำเร็จ
      }
    } catch (e) {
      print('Error: $e');
      // จัดการข้อผิดพลาดในการส่งคำขอ
    }
  }

  Future<void> _postDelete() async {
    // ข้อมูลที่จะส่งไปยัง API
    Map<String, dynamic> data = {
      "id": int.parse(iid.text),
    };

    // แปลงข้อมูลเป็น JSON
    String jsonData = jsonEncode(data);

    // URL ของ API
    String apiUrl = AppRoute.ipaddress+'/post_deleteid';

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

  Future<void> _postFind() async {
    // ข้อมูลที่จะโพสต์ไปยัง API
    Map<String, dynamic> data = {
      //"idST5": int.parse(id.text), // ใช้ "idST5" แทน "ID"
      "idST5": id.text,
    };
    // แปลงข้อมูลเป็น JSON
    String jsonData = jsonEncode(data);
    // URL ของ API ที่ต้องการโพสต์ข้อมูลไป
    String apiUrl = AppRoute.ipaddress+'/post_id';
    // สร้างคำขอโพสต์
    http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonData,
    );
    //ตรวจสอบสถานะการตอบกลับจาก API
    if (response.statusCode == 200) {
      print('โพสต์สำเร็จ!');
      Map<String, dynamic> responseData = jsonDecode(response.body);
      // แสดงข้อมูลที่ได้รับจาก API
      print("${responseData['ความเครียด'][0][1]}");
      // if (responseData['ทั่วไป'][0][0]== 'ไม่พบข้อมูล' && responseData['ความเครียด'][0][0]== 'ไม่พบข้อมูล' && responseData['มือถือ'][0][0]== 'ไม่พบข้อมูล' && responseData["นอน"][0][0] == 'ไม่พบข้อมูล'){
      //   toppic1 = 'ไม่พบข้อมูล';
      //   print('ไม่มี');
      // }
      } else {
      print('การโพสต์ข้อมูลล้มเหลว. รหัสสถานะ: ${response.statusCode}');
    }
  }


  void _handleHome(BuildContext context) {
    Navigator.pushNamed(context, AppRoute.Home);
  }
  void _gHome(BuildContext context) {
    Navigator.pushNamed(context, AppRoute.log);
  }
  void E_ST5() {
    Navigator.pushNamed(context, AppRoute.E_ST5);
  }

  void E_SASSV() {
    Navigator.pushNamed(context, AppRoute.E_SASSV);
  }

  void E_PSQI() {
    Navigator.pushNamed(context, AppRoute.E_PSQI);
  }
}
