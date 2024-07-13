import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:excel/excel.dart';
import 'package:http/http.dart' as http;
import 'package:projectmobile/pages/log/routes.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';


import 'dart:convert';
import 'dart:io';

class homeinput extends StatefulWidget {
  const homeinput({Key? key}) : super(key: key);

  @override
  State<homeinput> createState() => _homeinputState();
}

class _homeinputState extends State<homeinput> {
  String statusPSQI = '';
  String statusST5 = '';
  String statusSASSV = '';
  String? selectedFileName; // สร้างตัวแปรเพื่อเก็บชื่อไฟล์ที่เลือก
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Effect of sleep quality",
          style: TextStyle(
            fontFamily: 'Kanit',
            fontSize: 20, // ขนาดตัวอักษรตามที่ต้องการ
            color: Colors.black,
            fontWeight: FontWeight.bold, // สีตัวอักษรตามที่ต้องการ
            // คุณยังสามารถกำหนดคุณสมบัติอื่นๆ ของ TextStyle ตามต้องการ
          ),
        ),
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white, // Set the background color
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "A smartphone addiction assessment system",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontFamily: 'Anton',
                      ),
                    ),
                    Text(
                      "On the effect of sleep quality",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontFamily: 'Anton',
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "เลือกไฟล์ Excel",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 128, 159, 90),
                        fontFamily: 'Kanit',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              ...buidimport(),
              // SizedBox(height: 30), // Add spacing between the imported items and the next button
              //...buidnext(),
            ],
          ),
        ),
      ),
    );
  }

  buidnext() {
    return [
      ElevatedButton(
        onPressed: () async {
          String? directoryPath = await FilePicker.platform.getDirectoryPath();
          if (directoryPath != null) {
            // ทำสิ่งที่ต้องการกับ directoryPath ที่ผู้ใช้เลือก
          }
        },
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all<Size>(
            Size(
              MediaQuery
                  .of(context)
                  .size
                  .width,
              170,
            ),),
          backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromARGB(255, 243, 136, 30)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          elevation: MaterialStateProperty.all<double>(20),
        ),
        child: Text('ยืนยัน'),
      ),
    ];
  }

  buidimport() {
    return [
      ElevatedButton(
        onPressed: () {
          sendFilePSQI();
        },
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all<Size>(Size(50, 80)),
          backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromARGB(255, 127, 97, 166)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          elevation: MaterialStateProperty.all<double>(20),
        ),
        child: Text('PSQI'),
      ),
      SizedBox(height: 10),
      Center(
        child: Text(
          statusPSQI,
          style: TextStyle(
            fontSize: 15,
            fontFamily: 'Kanit',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(height: 10), // เพิ่มระยะห่างระหว่างปุ่ม PSQI กับปุ่มอื่น ๆ
      ElevatedButton(
        onPressed: () {
          sendFileST5();
        },
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all<Size>(Size(50, 80)),
          backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromARGB(255, 127, 97, 166)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(21.0),
            ),
          ),
          elevation: MaterialStateProperty.all<double>(20),
        ),
        child: Text('ST5'),
      ),
      SizedBox(height: 10),
      Center(
        child: Text(
          statusST5,
          style: TextStyle(
            fontSize: 15,
            fontFamily: 'Kanit',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(height: 10), // เพิ่มระยะห่างระหว่างปุ่มอื่น ๆ กับเนื้อหาด้านล่าง
      ElevatedButton(
        onPressed: () {
          sendFileSASSV();
        },
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all<Size>(Size(50, 80)),
          backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromARGB(255, 127, 97, 166)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          elevation: MaterialStateProperty.all<double>(20),
        ),
        child: Text('SAS-SV'),
      ),
      SizedBox(height: 10),
      Center(
        child: Text(
          statusSASSV,
          style: TextStyle(
            fontSize: 15,
            fontFamily: 'Kanit',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(height: 10), // เพิ่มระยะห่างระหว่างปุ่มอื่น ๆ กับเนื้อหาด้านล่าง
    ];
  }

// Future<void> selectFile() async {
//   try {
//     final result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['xlsx'],
//     );
//     if (result == null) return;
//
//     final file = result.files.single;
//     final bytes = result.files.single.bytes ?? Uint8List(0); // Handle null bytes
//     final excel = Excel.decodeBytes(bytes);
//
//     // Read the Excel file and count the columns
//     final sheet = excel.sheets.values.first;
//     if (sheet != null) {
//       final columnCount = sheet.maxCols;
//       final columnRow = sheet.maxRows;
//       // print('ไฟล์ที่เลือกคือ: ${file.name}');
//       // print('Number of columns: $columnCount');
//       // print('Number of row: $columnRow');
//     }
//   } catch (e) {
//     print("Error selecting file: $e");
//   }
// }

  Future<void> sendFilePSQI() async {
    try {
    // Select file
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );
    if (result == null) return;

    final file = result.files.single;
    final bytes = result.files.single.bytes ?? Uint8List(0);
    print('File uploaded successfully');
    setState(() {
      statusPSQI = 'ไฟล์ที่เลือกคือ : ${file.name} ทำการบันทึกเรียบร้อย';
    });
    //Create multipart request
      var request = http.MultipartRequest(
          'POST', Uri.parse(AppRoute.ipaddress+'/receivefile-PSQI-data'));
      request.files.add(
          http.MultipartFile.fromBytes('file', bytes, filename: file.name));
      print('Selected file: ${file.name}');

      // Set content-type header
      request.headers['content-type'] = 'multipart/form-data';

      // Send request
      var response = await request.send();

      // Check response status
      if (response.statusCode == 200) {
        print('File uploaded successfully');
        setState(() {
          statusPSQI = 'ไฟล์ที่เลือกคือ : ${file.name} ทำการบันทึกเรียบร้อย';
        });
      } else {
        print('Failed to upload file. Status code: ${response.statusCode}');
        setState(() {
          statusPSQI = 'ไฟล์ที่เลือกคือ : ${file.name} ทำการบันทึกไม่สำเร็จ';
        });
      }
    } catch (e) {
      print('Error sending file: $e');
    }
  }

  Future<void> sendFileST5() async {
    try {
      // Select file
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx'],
      );
      if (result == null) return;

      final file = result.files.single;
      final bytes = result.files.single.bytes ?? Uint8List(0);

      // Create multipart request
      var request = http.MultipartRequest(
          'POST', Uri.parse(AppRoute.ipaddress+'/receivefile-ST5-data'));
      request.files.add(
          http.MultipartFile.fromBytes('file', bytes, filename: file.name));

      // Set content-type header
      request.headers['content-type'] = 'multipart/form-data';

      // Send request
      var response = await request.send();

      // Check response status
      if (response.statusCode == 200) {
        print('File uploaded successfully');
        setState(() {
          statusST5 = 'ไฟล์ที่เลือกคือ : ${file.name} ทำการบันทึกเรียบร้อย';
        });
      } else {
        print('Failed to upload file. Status code: ${response.statusCode}');
        setState(() {
          statusST5 = 'ไฟล์ที่เลือกคือ : ${file.name} ทำการบันทึกไม่สำเร็จ';
        });
      }
    } catch (e) {
      print('Error sending file: $e');
    }
  }

  Future<void> sendFileSASSV() async {
    try {
      // Select file
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx'],
      );
      if (result == null) return;

      final file = result.files.single;
      final bytes = result.files.single.bytes ?? Uint8List(0);

      // Create multipart request
      var request = http.MultipartRequest(
          'POST', Uri.parse(AppRoute.ipaddress+'/receivefile-SASSV-data'));
      request.files.add(
          http.MultipartFile.fromBytes('file', bytes, filename: file.name));

      // Set content-type header
      request.headers['content-type'] = 'multipart/form-data';

      // Send request
      var response = await request.send();

      // Check response status
      if (response.statusCode == 200) {
        print('File uploaded successfully');
        setState(() {
          statusSASSV = 'ไฟล์ที่เลือกคือ : ${file.name} ทำการบันทึกเรียบร้อย';
        });
      } else {
        print('Failed to upload file. Status code: ${response.statusCode}');
        setState(() {
          statusSASSV = 'ไฟล์ที่เลือกคือ : ${file.name} ทำการบันทึกไม่สำเร็จ';
        });
      }
    } catch (e) {
      print('Error sending file: $e');
    }
  }

  void _handHome(BuildContext context) {
    Navigator.pushNamed(context, AppRoute.Home);
  }
}
