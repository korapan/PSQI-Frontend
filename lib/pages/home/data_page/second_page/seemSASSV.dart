import 'package:flutter/material.dart';
import 'package:projectmobile/pages/log/routes.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class seemSASSV extends StatefulWidget {
  const seemSASSV({Key? key}) : super(key: key);

  @override
  State<seemSASSV> createState() => _seemSASSVState();
}

class _seemSASSVState extends State<seemSASSV> {
  late Future<List<dynamic>> futureData;
  final ScrollController _verticalScrollController = ScrollController();
  final ScrollController _horizontalScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  void dispose() {
    _verticalScrollController.dispose();
    _horizontalScrollController.dispose();
    super.dispose();
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
        backgroundColor: Colors.white,
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
            return Scrollbar(
              controller: _verticalScrollController,
              thumbVisibility: true,
              child: SingleChildScrollView(
                controller: _verticalScrollController,
                scrollDirection: Axis.vertical,
                child: Scrollbar(
                  controller: _horizontalScrollController,
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    controller: _horizontalScrollController,
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columnSpacing: 80,
                      columns: [
                        DataColumn(label: Center(child: Text('รหัส', style: TextStyle(color: Colors.green, fontFamily: 'Kanit', fontSize: 18, fontWeight: FontWeight.bold),))),
                        DataColumn(label: Center(child: Text('ความถี่ในการใช้', style: TextStyle(color: Colors.green, fontFamily: 'Kanit', fontSize: 18, fontWeight: FontWeight.bold)))),
                        DataColumn(label: Center(child: Text('ชั่วโมงต่อวัน', style: TextStyle(color: Colors.green, fontFamily: 'Kanit', fontSize: 18, fontWeight: FontWeight.bold)))),
                        DataColumn(label: Center(child: Text('สาเหตุ', style: TextStyle(color: Colors.green, fontFamily: 'Kanit', fontSize: 18, fontWeight: FontWeight.bold)))),
                        DataColumn(label: Center(child: Text('เวลาเฉลี่ย', style: TextStyle(color: Colors.green, fontFamily: 'Kanit', fontSize: 18, fontWeight: FontWeight.bold)))),
                        DataColumn(label: Center(child: Text('แอปพลิเคชั่น', style: TextStyle(color: Colors.green, fontFamily: 'Kanit', fontSize: 18, fontWeight: FontWeight.bold)))),
                        DataColumn(label: Center(child: Text('คะแนนข้อที่ 1', style: TextStyle(color: Colors.green, fontFamily: 'Kanit', fontSize: 18, fontWeight: FontWeight.bold)))),
                        DataColumn(label: Center(child: Text('คะแนนข้อที่ 2', style: TextStyle(color: Colors.green, fontFamily: 'Kanit', fontSize: 18, fontWeight: FontWeight.bold)))),
                        DataColumn(label: Center(child: Text('คะแนนข้อที่ 3', style: TextStyle(color: Colors.green, fontFamily: 'Kanit', fontSize: 18, fontWeight: FontWeight.bold)))),
                        DataColumn(label: Center(child: Text('คะแนนข้อที่ 4', style: TextStyle(color: Colors.green, fontFamily: 'Kanit', fontSize: 18, fontWeight: FontWeight.bold)))),
                        DataColumn(label: Center(child: Text('คะแนนข้อที่ 5', style: TextStyle(color: Colors.green, fontFamily: 'Kanit', fontSize: 18, fontWeight: FontWeight.bold)))),
                        DataColumn(label: Center(child: Text('คะแนนข้อที่ 6', style: TextStyle(color: Colors.green, fontFamily: 'Kanit', fontSize: 18, fontWeight: FontWeight.bold)))),
                        DataColumn(label: Center(child: Text('คะแนนข้อที่ 7', style: TextStyle(color: Colors.green, fontFamily: 'Kanit', fontSize: 18, fontWeight: FontWeight.bold)))),
                        DataColumn(label: Center(child: Text('คะแนนข้อที่ 8', style: TextStyle(color: Colors.green, fontFamily: 'Kanit', fontSize: 18, fontWeight: FontWeight.bold)))),
                        DataColumn(label: Center(child: Text('คะแนนข้อที่ 9', style: TextStyle(color: Colors.green, fontFamily: 'Kanit', fontSize: 18, fontWeight: FontWeight.bold)))),
                        DataColumn(label: Center(child: Text('คะแนนข้อที่ 10', style: TextStyle(color: Colors.green, fontFamily: 'Kanit', fontSize: 18, fontWeight: FontWeight.bold)))),
                        DataColumn(label: Center(child: Text('คะแนนรวม', style: TextStyle(color: Colors.green, fontFamily: 'Kanit', fontSize: 18, fontWeight: FontWeight.bold)))),
                        DataColumn(label: Center(child: Text('ผลลัพธ์', style: TextStyle(color: Colors.green, fontFamily: 'Kanit', fontSize: 18, fontWeight: FontWeight.bold)))),
                      ],
                      rows: data.map((item) {
                        return DataRow(
                          cells: [
                            DataCell(Center(child: Text('${item[0]}', style: TextStyle(fontFamily: 'Kanit', fontWeight: FontWeight.bold)))),
                            DataCell(Center(child: Text('${item[7]}', style: TextStyle(fontFamily: 'Kanit', fontWeight: FontWeight.bold)))),
                            DataCell(Center(child: Text('${item[8]}', style: TextStyle(fontFamily: 'Kanit', fontWeight: FontWeight.bold)))),
                            DataCell(Center(child: Text('${item[9]}', style: TextStyle(fontFamily: 'Kanit', fontWeight: FontWeight.bold)))),
                            DataCell(Center(child: Text('${item[10]}', style: TextStyle(fontFamily: 'Kanit', fontWeight: FontWeight.bold)))),
                            DataCell(Center(child: Text('${item[11]}', style: TextStyle(fontFamily: 'Kanit', fontWeight: FontWeight.bold)))),
                            DataCell(Center(child: Text('${item[12]}', style: TextStyle(fontFamily: 'Kanit', fontWeight: FontWeight.bold)))),
                            DataCell(Center(child: Text('${item[13]}', style: TextStyle(fontFamily: 'Kanit', fontWeight: FontWeight.bold)))),
                            DataCell(Center(child: Text('${item[14]}', style: TextStyle(fontFamily: 'Kanit', fontWeight: FontWeight.bold)))),
                            DataCell(Center(child: Text('${item[15]}', style: TextStyle(fontFamily: 'Kanit', fontWeight: FontWeight.bold)))),
                            DataCell(Center(child: Text('${item[16]}', style: TextStyle(fontFamily: 'Kanit', fontWeight: FontWeight.bold)))),
                            DataCell(Center(child: Text('${item[17]}', style: TextStyle(fontFamily: 'Kanit', fontWeight: FontWeight.bold)))),
                            DataCell(Center(child: Text('${item[18]}', style: TextStyle(fontFamily: 'Kanit', fontWeight: FontWeight.bold)))),
                            DataCell(Center(child: Text('${item[19]}', style: TextStyle(fontFamily: 'Kanit', fontWeight: FontWeight.bold)))),
                            DataCell(Center(child: Text('${item[20]}', style: TextStyle(fontFamily: 'Kanit', fontWeight: FontWeight.bold)))),
                            DataCell(Center(child: Text('${item[21]}', style: TextStyle(fontFamily: 'Kanit', fontWeight: FontWeight.bold)))),
                            DataCell(Center(child: Text('${item[22]}', style: TextStyle(fontFamily: 'Kanit', fontWeight: FontWeight.bold)))),
                            DataCell(Center(child: Text('${item[23]}', style: TextStyle(fontFamily: 'Kanit', fontWeight: FontWeight.bold)))),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
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
    final response = await http.get(Uri.parse(AppRoute.ipaddress + '/get_data_SASSV'));

    if (response.statusCode == 200) {
      return json.decode(response.body)['data'];
    } else {
      throw Exception('Failed to load data');
    }
  }
}