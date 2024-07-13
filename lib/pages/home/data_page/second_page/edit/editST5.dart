import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projectmobile/pages/log/routes.dart';

class e_st5 extends StatefulWidget {
  const e_st5({Key? key}) : super(key: key);

  @override
  State<e_st5> createState() => _e_st5State();
}

class _e_st5State extends State<e_st5> {
  @override
  List<int?> myArray = List<int?>.filled(5, null);
  String last = '';

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
              _handHome();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start, // กำหนดให้ Column จัดวางตามด้านบน
              crossAxisAlignment: CrossAxisAlignment.start,
              // จัดวาง children ใน Column ไปทางด้านซ้าย
              children: [
                Text("ST-5",
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Kanit",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
                Text("แบบประเมินความเครียด",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Kanit",
                      color: Color.fromARGB(255, 128, 159, 90),
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                          "แก้ไขข้อมูล",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Kanit",
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 30), // Adjust the height as needed
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Expanded(
                      child: Text("ข้อที่ 1 มีปัญหาการนอน นอนไม่หลับหรือนอนมาก",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Kanit",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                    )
                  ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...point(0),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text("ข้อที่ 2 มีสมาธิน้อยลง",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Kanit",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ))
                  ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...point(1),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text("ข้อที่ 3 หงุดหงิด/กระวนกระวาย/ว้าวุ่นใจ",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Kanit",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ))
                  ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...point(2),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text("ข้อที่ 4 รู้สึกเบื่อ เซ็ง",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Kanit",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ))
                  ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...point(3),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text("ข้อที่ 5 ไม่อยากพบปะผู้คน",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Kanit",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ))
                  ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...point(4),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          bool containsNull = myArray.contains(null);
                          if (containsNull) {
                            print('no');
                          } else {
                            testprint();
                            _posteditST5();
                            //_postDataST5();
                            // กลับไปที่หน้า _homescanState
                            //_postDataST5();
                            //_postDataST5();
                          }
                          //_postDataST5(); // เรียกใช้ _postDataST5 เมื่อปุ่มถูกกด
                          //testprint();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 127, 97, 166)),
                          // กำหนดสีพื้นหลังเมื่อปุ่มอยู่ในสถานะปกติ
                          foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                          elevation: MaterialStateProperty.all<double>(
                              20), // กำหนดสีของตัวอักษรเมื่อปุ่มอยู่ในสถานะปกติ
                        ),
                        child: Text("แก้ไข"),
                      ),
                    ),
                    Column(
                      children: [
                        Center(child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(last,style: TextStyle(fontFamily: "Kanit", color: Colors.red,fontSize: 21,fontWeight: FontWeight.bold,)),
                        )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  testprint(){
    return[
      //print(myArray[0]),
      print(myArray[1]),
      //print(myArray[2]),
      //print(myArray[3]),
      //print(myArray[4])
    ];
  }

  Future<void> _posteditST5() async {
    // ข้อมูลที่จะโพสต์ไปยัง API
    Map<String, dynamic> data = {
      "ns1": int.parse(myArray[0].toString()),
      "ns2": int.parse(myArray[1].toString()),
      "ns3": int.parse(myArray[2].toString()),
      "ns4": int.parse(myArray[3].toString()),
      "ns5": int.parse(myArray[4].toString()),
    };
    // แปลงข้อมูลเป็น JSON
    String jsonData = jsonEncode(data);
    // URL ของ API ที่ต้องการโพสต์ข้อมูลไป
    String apiUrl = AppRoute.ipaddress + '/edit-dataST5';
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
      print('Post successful!');
      print('Response: ${response.body}');
      setState(() {
        _editer(context);
        last = '';
      });
    } else {
      setState(() {
        last = 'ยังไม่ได้กำหนด ID ของข้อมูล';
      });
      print('Failed to post data. Status code: ${response.statusCode}');
    }
  }

  point(int i) {
    int? selectedIndex = myArray[i]; // Get the current selected index
    return [
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (index) { // Should generate 4 for 0-3
            return GestureDetector(
              onTap: () {
                setState(() {
                  myArray[i] = index; // Update the score for the specific item
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: selectedIndex == index ? Color.fromARGB(255, 128, 159, 90) : Colors.grey[100],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10), // Set borderRadius for rectangle
                  ),
                  child: Center(
                    child: selectedIndex == index
                        ? Icon(Icons.check, color: Colors.white)
                        : Text(index.toString()),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    ];
  }
  void _editer(BuildContext context) {
    Navigator.pushNamed(context, AppRoute.edit);
  }
  void _handHome() {
    Navigator.pushNamed(context, AppRoute.Home);
  }
}