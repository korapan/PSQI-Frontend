import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:projectmobile/pages/log/routes.dart';

class Datageneral extends StatefulWidget {
  const Datageneral({Key? key}) : super(key: key);

  @override
  State<Datageneral> createState() => _datageneralState();
}

class _datageneralState extends State<Datageneral> {
  late Future<List<dynamic>> futureData;

  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(AppRoute.ipaddress+'/get_data_ST5'));

    if (response.statusCode == 200) {
      // หากเรียก API สำเร็จ
      // แปลงข้อมูล JSON เป็น List<dynamic>
      return json.decode(response.body)['data'];
    } else {
      // หากมีข้อผิดพลาดในการเรียก API
      throw Exception('Failed to load data');
    }
  }

  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Effect of sleep quality",
          style: TextStyle(
            fontFamily: 'Kanit',
            fontSize: 21, // ขนาดตัวอักษรตามที่ต้องการ
            color: Colors.black,
            fontWeight: FontWeight.bold, // สีตัวอักษรตามที่ต้องการ
            // คุณยังสามารถกำหนดคุณสมบัติอื่นๆ ของ TextStyle ตามต้องการ
          ),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home), // ไอคอนของปุ่ม
            onPressed: () {
              _handHome(context);
            },
          ),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final List<dynamic> data = snapshot.data!;
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 80, // กำหนดระยะห่างระหว่างคอลัมน์ใน DataTable
                  columns: [
                    DataColumn(label: Center(child: Text(' รหัส', style: TextStyle(color: Colors.green,fontFamily: 'Kanit',fontSize: 18,fontWeight: FontWeight.bold,)))),
                    DataColumn(label: Center(child: Text('เพศ', style: TextStyle(color: Colors.green,fontFamily: 'Kanit',fontSize: 18,fontWeight: FontWeight.bold,)))),
                    DataColumn(label: Center(child: Text('อายุ', style: TextStyle(color: Colors.green,fontFamily: 'Kanit',fontSize: 18,fontWeight: FontWeight.bold,)))),
                    DataColumn(label: Center(child: Text('ชั้นปีที่ศึกษา', style: TextStyle(color: Colors.green,fontFamily: 'Kanit',fontSize: 18,fontWeight: FontWeight.bold,)))),
                    DataColumn(label: Center(child: Text('สาขาวิชา', style: TextStyle(color: Colors.green,fontFamily: 'Kanit',fontSize: 18,fontWeight: FontWeight.bold,)))),
                    DataColumn(label: Center(child: Text('จำนวนหน่วยกิจต่อภาคเรียนการศึกษา', style: TextStyle(color: Colors.green,fontFamily: 'Kanit',fontSize: 18,fontWeight: FontWeight.bold,)))),
                    DataColumn(label: Center(child: Text('จำนวนชั่วฌโมงเรียนต่อภาคเรียนการศึกษา', style: TextStyle(color: Colors.green,fontFamily: 'Kanit',fontSize: 18,fontWeight: FontWeight.bold,)))),
                  ],
                  rows: [
                    for (var i = 0; i < data.length; i++)
                      DataRow(
                        cells: [
                          DataCell(Center(child: Text('${data[i][0]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 3 (index 2)
                          DataCell(Center(child: Text('${data[i][1]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 6 (index 5)
                          DataCell(Center(child: Text('${data[i][2]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 7 (index 6)
                          DataCell(Center(child: Text('${data[i][3]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 7 (index 6)
                          DataCell(Center(child: Text('${data[i][4]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 7 (index 6)
                          DataCell(Center(child: Text('${data[i][5]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 7 (index 6)
                          DataCell(Center(child: Text('${data[i][6]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 7 (index 6)
                        ],
                      ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

// สร้างฟังก์ชันสำหรับการร้องขอข้อมูลจาก API
// Future fetchData() async {
//   // URL ของ API
//   Uri apiUrl = Uri.parse (AppRoute.ipaddress+'/get_data_ST5');
//
//   // ทำการร้องขอข้อมูลจาก API ด้วยเมธอด get()
//   final response = await http.get(apiUrl);
//
//   // ตรวจสอบสถานะการร้องขอ (HTTP status code)
//   if (response.statusCode == 200) {
//     // ถ้าสำเร็จ แปลงข้อมูล JSON เป็น Dart objects
//     return json.decode(response.body);
//   } else {
//     // ถ้าไม่สำเร็จ ให้ throw exception เพื่อจัดการข้อผิดพลาด
//     throw Exception('Failed to load data');
//   }
// }

  void _handHome(BuildContext context) {
    Navigator.pushNamed(context, AppRoute.Home);
  }
}

// () async { // เพิ่ม async เพื่อให้สามารถใช้ await ได้
// await fetchData(); // เรียกใช้ fetchData() โดยใช้ await
// },

//responseData.isEmpty
//? Center(child: CircularProgressIndicator())
//: ListView.builder(
//itemCount: responseData.length,
//itemBuilder: (context, index) {
//return ListTile(
//subtitle: Row(
//crossAxisAlignment: CrossAxisAlignment.start,
//children: [
//Container(child: Text('${responseData[index][0]}')),
//Container(child: Text('${responseData[index][1]}')),
//Container(child: Text('${responseData[index][2]}')),
//Container(child: Text('${responseData[index][3]}')),
//Container(child: Text('${responseData[index][4]}')),
//Container(child: Text('${responseData[index][5]}')),
//Container(child: Text('${responseData[index][6]}')),

// Add more fields as needed
//],
//),
// Add more fields as needed
//);
//},
//),


