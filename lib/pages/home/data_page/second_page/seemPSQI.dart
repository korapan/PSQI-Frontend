import 'package:flutter/material.dart';
import 'package:projectmobile/pages/log/routes.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class seemPSQI extends StatefulWidget {
  const seemPSQI({Key? key}) : super(key: key);

  @override
  State<seemPSQI> createState() => _seemPSQIState();
}

class _seemPSQIState extends State<seemPSQI> {
  late Future<List<dynamic>> futureData;
  @override
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
                    DataColumn(label: Center(child: Text(' รหัส', style: TextStyle(color: Colors.green,fontFamily: 'Kanit',fontSize: 18,fontWeight: FontWeight.bold,),))),
                    DataColumn(label: Center(child: Text(' DURAT', style: TextStyle(color: Colors.green,fontFamily: 'Kanit',fontSize: 18,fontWeight: FontWeight.bold,)))),
                    DataColumn(label: Center(child: Text('DISTB', style: TextStyle(color: Colors.green,fontFamily: 'Kanit',fontSize: 18,fontWeight: FontWeight.bold,)))),
                    DataColumn(label: Center(child: Text(' LATEN', style: TextStyle(color: Colors.green,fontFamily: 'Kanit',fontSize: 18,fontWeight: FontWeight.bold,)))),
                    DataColumn(label: Center(child: Text('DAYDYS', style: TextStyle(color: Colors.green,fontFamily: 'Kanit',fontSize: 18,fontWeight: FontWeight.bold,)))),
                    DataColumn(label: Center(child: Text('HSE', style: TextStyle(color: Colors.green,fontFamily: 'Kanit',fontSize: 18,fontWeight: FontWeight.bold,)))),
                    DataColumn(label: Center(child: Text('SLPQUAL', style: TextStyle(color: Colors.green,fontFamily: 'Kanit',fontSize: 18,fontWeight: FontWeight.bold,)))),
                    DataColumn(label: Center(child: Text('MEDS', style: TextStyle(color: Colors.green,fontFamily: 'Kanit',fontSize: 18,fontWeight: FontWeight.bold,)))),
                    DataColumn(label: Center(child: Text('คะแนนรวม', style: TextStyle(color: Colors.green,fontFamily: 'Kanit',fontSize: 18,fontWeight: FontWeight.bold,)))),
                    DataColumn(label: Center(child: Text('ผลลัพธ์', style: TextStyle(color: Colors.green,fontFamily: 'Kanit',fontSize: 18,fontWeight: FontWeight.bold,)))),
                  ],
                  rows: [
                    for (var i = 0; i < data.length; i++)
                      DataRow(
                        cells: [
                          DataCell(Center(child: Text('${data[i][0]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 3 (index 2)
                          DataCell(Center(child: Text('${data[i][7]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 6 (index 5)
                          DataCell(Center(child: Text('${data[i][8]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 7 (index 6)
                          DataCell(Center(child: Text('${data[i][9]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 7 (index 6)
                          DataCell(Center(child: Text('${data[i][10]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 7 (index 6)
                          DataCell(Center(child: Text('${data[i][11]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 7 (index 6)
                          DataCell(Center(child: Text('${data[i][12]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 7 (index 6)
                          DataCell(Center(child: Text('${data[i][13]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 7 (index 6)
                          DataCell(Center(child: Text('${data[i][14]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 7 (index 6)
                          DataCell(Center(child: Text('${data[i][15]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 7 (index 6)// แสดงข้อมูลในคอลัมน์ที่ 7 (index 6)
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

  void _handHome(BuildContext context) {
    Navigator.pushNamed(context, AppRoute.Home);
  }

  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:5000/get_data_PSQI'));

    if (response.statusCode == 200) {
      // หากเรียก API สำเร็จ
      // แปลงข้อมูล JSON เป็น List<dynamic>
      return json.decode(response.body)['data'];
    } else {
      // หากมีข้อผิดพลาดในการเรียก API
      throw Exception('Failed to load data');
    }
  }
}
