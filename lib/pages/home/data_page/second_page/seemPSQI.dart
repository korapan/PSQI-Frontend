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
                    DataColumn(label: Center(child: Text(' ข้อ1', style: TextStyle(color: Colors.green,fontFamily: 'Kanit',fontSize: 18,fontWeight: FontWeight.bold,),))),
                    DataColumn(label: Center(child: Text(' ข้อ2', style: TextStyle(color: Colors.green,fontFamily: 'Kanit',fontSize: 18,fontWeight: FontWeight.bold,),))),
                    DataColumn(label: Center(child: Text(' ข้อ3', style: TextStyle(color: Colors.green,fontFamily: 'Kanit',fontSize: 18,fontWeight: FontWeight.bold,),))),
                    DataColumn(label: Center(child: Text(' ข้อ4', style: TextStyle(color: Colors.green,fontFamily: 'Kanit',fontSize: 18,fontWeight: FontWeight.bold,),))),
                    DataColumn(label: Center(child: Text(' ข้อ5A', style: TextStyle(color: Colors.green,fontFamily: 'Kanit',fontSize: 18,fontWeight: FontWeight.bold,),))),
                    DataColumn(label: Center(child: Text(' ข้อ5B', style: TextStyle(color: Colors.green,fontFamily: 'Kanit',fontSize: 18,fontWeight: FontWeight.bold,),))),
                    DataColumn(label: Center(child: Text(' ข้อ5C', style: TextStyle(color: Colors.green,fontFamily: 'Kanit',fontSize: 18,fontWeight: FontWeight.bold,),))),
                    DataColumn(label: Center(child: Text(' ข้อ5D', style: TextStyle(color: Colors.green,fontFamily: 'Kanit',fontSize: 18,fontWeight: FontWeight.bold,),))),
                    DataColumn(label: Center(child: Text(' ข้อ5E', style: TextStyle(color: Colors.green,fontFamily: 'Kanit',fontSize: 18,fontWeight: FontWeight.bold,),))),
                    DataColumn(label: Center(child: Text(' ข้อ5F', style: TextStyle(color: Colors.green,fontFamily: 'Kanit',fontSize: 18,fontWeight: FontWeight.bold,),))),
                    DataColumn(label: Center(child: Text(' ข้อ5G', style: TextStyle(color: Colors.green,fontFamily: 'Kanit',fontSize: 18,fontWeight: FontWeight.bold,),))),
                    DataColumn(label: Center(child: Text(' ข้อ5H', style: TextStyle(color: Colors.green,fontFamily: 'Kanit',fontSize: 18,fontWeight: FontWeight.bold,),))),
                    DataColumn(label: Center(child: Text(' ข้อ5I', style: TextStyle(color: Colors.green,fontFamily: 'Kanit',fontSize: 18,fontWeight: FontWeight.bold,),))),
                    DataColumn(label: Center(child: Text(' ข้อ5J ', style: TextStyle(color: Colors.green,fontFamily: 'Kanit',fontSize: 18,fontWeight: FontWeight.bold,),))),
                    DataColumn(label: Center(child: Text(' ข้อ6', style: TextStyle(color: Colors.green,fontFamily: 'Kanit',fontSize: 18,fontWeight: FontWeight.bold,),))),
                    DataColumn(label: Center(child: Text(' ข้อ7', style: TextStyle(color: Colors.green,fontFamily: 'Kanit',fontSize: 18,fontWeight: FontWeight.bold,),))),
                    DataColumn(label: Center(child: Text(' ข้อ8', style: TextStyle(color: Colors.green,fontFamily: 'Kanit',fontSize: 18,fontWeight: FontWeight.bold,),))),
                    DataColumn(label: Center(child: Text(' ข้อ9', style: TextStyle(color: Colors.green,fontFamily: 'Kanit',fontSize: 18,fontWeight: FontWeight.bold,),))),
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
                          DataCell(Center(child: Text('${data[i][14]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 3 (index 2)
                          DataCell(Center(child: Text('${data[i][15]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 3 (index 2)
                          DataCell(Center(child: Text('${data[i][16]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 3 (index 2)
                          DataCell(Center(child: Text('${data[i][17]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 3 (index 2)
                          DataCell(Center(child: Text('${data[i][18]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 3 (index 2)
                          DataCell(Center(child: Text('${data[i][19]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 3 (index 2)
                          DataCell(Center(child: Text('${data[i][20]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 3 (index 2)
                          DataCell(Center(child: Text('${data[i][21]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 3 (index 2)
                          DataCell(Center(child: Text('${data[i][22]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 3 (index 2)
                          DataCell(Center(child: Text('${data[i][23]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 3 (index 2)
                          DataCell(Center(child: Text('${data[i][24]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 3 (index 2)
                          DataCell(Center(child: Text('${data[i][25]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 3 (index 2)
                          DataCell(Center(child: Text('${data[i][26]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 3 (index 2)
                          DataCell(Center(child: Text('${data[i][27]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 3 (index 2)
                          DataCell(Center(child: Text('${data[i][28]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 3 (index 2)
                          DataCell(Center(child: Text('${data[i][29]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 3 (index 2)
                          DataCell(Center(child: Text('${data[i][30]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 3 (index 2)
                          DataCell(Center(child: Text('${data[i][31]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 3 (index 2)
                          DataCell(Center(child: Text('${data[i][7]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 6 (index 5)
                          DataCell(Center(child: Text('${data[i][8]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 7 (index 6)
                          DataCell(Center(child: Text('${data[i][9]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 7 (index 6)
                          DataCell(Center(child: Text('${data[i][10]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 7 (index 6)
                          DataCell(Center(child: Text('${data[i][11]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 7 (index 6)
                          DataCell(Center(child: Text('${data[i][12]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 7 (index 6)
                          DataCell(Center(child: Text('${data[i][13]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 7 (index 6)
                          DataCell(Center(child: Text('${data[i][32]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 7 (index 6)
                          DataCell(Center(child: Text('${data[i][33]}', style: TextStyle(fontFamily: 'Kanit',fontWeight: FontWeight.bold,)))),  // แสดงข้อมูลในคอลัมน์ที่ 7 (index 6)// แสดงข้อมูลในคอลัมน์ที่ 7 (index 6)
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
    final response = await http.get(Uri.parse(AppRoute.ipaddress+'/get_data_PSQI'));

    if (response.statusCode == 200) {
      print(response.body);
      // หากเรียก API สำเร็จ
      // แปลงข้อมูล JSON เป็น List<dynamic>
      return json.decode(response.body)['data'];
    } else {
      // หากมีข้อผิดพลาดในการเรียก API
      throw Exception('Failed to load data');
    }
  }
}
