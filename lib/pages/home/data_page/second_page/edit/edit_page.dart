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
final down = TextEditingController();
final phone = TextEditingController();
final deleteid = TextEditingController();

class _EditorState extends State<Editor> {
  List<int?> myArray = List<int?>.filled(5, null);
  late Future<List<dynamic>> futureData;
  String nulldata = '';
  String toppic1 = '';
  String toppic2 = '';
  String toppic3 = '';
  String apiResponse = '';
  String combined1 = '';
  String combined2 = '';
  String combined3 = '';
  String combined4 = '';
  String combined5 = '';
  String combined6 = '';
  String com = '';
  List newList = [];
  List guide1 =['รหัส','เพศ','อายุ','ชั้นปี','สาขาวิชา','จำนวนหน่วยกิตต่อภาคการศึกษา','จำนวนชั่วโมงเรียนต่อสัปดาห์',];
  List guide2 =['ST5_1','ST5_2','ST5_3','ST5_4','ST5_5','คะแนนความเครียด','ระดับความเครียด'];
  List guide3 =['ความถี่การใช้งานมือถือ','ประมาณการใช้งาน','สาเหตุ','เวลาเฉลี่ย','แอปพลิเคชั่น'];
  List guide4 =['SV_1','SV_2','SV_3','SV_4','SV_5','SV_6','SV_7','SV_8','SV_9','SV_10','คะแนนการติดมือถือ','ผลการติดมือถือ'];
  List guide5 =['DURAT','DISTB','LATEN','DAYDYS','HSE','SLPQUAL','MEDS','คะแนนPSQI','ผลPSQI'];
  List guide6 =['P1','P2','P3','P4','P5A','P5B','P5C','P5D','P5E','P5F','P5G','P5H','P5I','P5J','P6','P7','P8','P9',];


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
                    color: Color.fromARGB(255, 128, 159, 90),
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(15.0),
            //   child: OutlinedButton(
            //     onPressed: () {
            //       E_ST5();
            //     },
            //     style: ButtonStyle(
            //       backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
            //       foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            //       side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
            //     ),
            //     child: Text(
            //       "แก้ไขข้อมูล ST5",
            //       style: TextStyle(
            //         fontSize: 25,
            //         fontFamily: 'Kanit',
            //         fontWeight: FontWeight.bold,
            //         color: Color.fromARGB(255, 128, 159, 90),
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(15.0),
            //   child: OutlinedButton(
            //     onPressed: () {
            //       E_SASSV();
            //     },
            //     style: ButtonStyle(
            //       backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
            //       foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            //       side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
            //     ),
            //     child: Text(
            //       "แก้ไขข้อมูล SASSV",
            //       style: TextStyle(
            //         fontSize: 25,
            //         fontFamily: 'Kanit',
            //         fontWeight: FontWeight.bold,
            //         color: Color.fromARGB(255, 128, 159, 90),
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(15.0),
            //   child: OutlinedButton(
            //     onPressed: () {
            //       E_PSQI();
            //     },
            //     style: ButtonStyle(
            //       backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
            //       foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            //       side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
            //     ),
            //     child: Text(
            //       "แก้ไขข้อมูล PSQI",
            //       style: TextStyle(
            //         fontSize: 25,
            //         fontFamily: 'Kanit',
            //         fontWeight: FontWeight.bold,
            //         color: Color.fromARGB(255, 128, 159, 90),
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(15.0),
            //   child: OutlinedButton(
            //     onPressed: () {
            //       _postDelete();
            //     },
            //     style: ButtonStyle(
            //       backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
            //       foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            //       side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
            //     ),
            //     child: Text(
            //       "ลบข้อมูล",
            //       style: TextStyle(
            //         fontSize: 25,
            //         fontFamily: 'Kanit',
            //         fontWeight: FontWeight.bold,
            //         color: Colors.red,
            //       ),
            //     ),
            //   ),
            // ),
            Text(nulldata,style: TextStyle(fontFamily: "Kanit", color: Colors.red,fontSize: 21,fontWeight: FontWeight.bold,)),
            ...buidtext(),//ข้อมูลจากการค้นหา
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
      if (responseData['ทั่วไป'][0][0] != 'ไม่พบข้อมูล') {
        setState(() {
                combined1 = guide1[0] + ' : '+ "${responseData['ทั่วไป'][0][0]}".toString()+ '\n' +
                    guide1[1] + ' : '+ "${responseData['ทั่วไป'][0][1]}".toString()+ '\n' +
                    guide1[2] + ' : '+ "${responseData['ทั่วไป'][0][2]}".toString()+ '\n' +
                    guide1[3] + ' : '+ "${responseData['ทั่วไป'][0][3]}".toString()+ '\n' +
                    guide1[4] + ' : '+ "${responseData['ทั่วไป'][0][4]}".toString()+ '\n' +
                    guide1[5] + ' : '+ "${responseData['ทั่วไป'][0][5]}".toString()+ '\n' +
                    guide1[6] + ' : '+ "${responseData['ทั่วไป'][0][6]}".toString();
                nulldata = '';
              });
      }
      else{
        setState(() {
          combined1 = '';
          nulldata = 'ไม่พบข้อมูล';
        });
      }

      if (responseData['ความเครียด'][0][0] != 'ไม่พบข้อมูล') {
        setState(() {
          toppic1 = 'ข้อมูลการประเมินความเครียด ( ST-5)';
          combined2 = guide2[0] + ' : '+ "${responseData['ความเครียด'][0][7]}".toString()+ '\n' +
              guide2[1] + ' : '+ "${responseData['ความเครียด'][0][8]}".toString()+ '\n' +
              guide2[2] + ' : '+ "${responseData['ความเครียด'][0][9]}".toString()+ '\n' +
              guide2[3] + ' : '+ "${responseData['ความเครียด'][0][10]}".toString()+ '\n' +
              guide2[4] + ' : '+ "${responseData['ความเครียด'][0][11]}".toString()+ '\n' +
              guide2[5] + ' : '+ "${responseData['ความเครียด'][0][12]}".toString()+ '\n' +
              guide2[6] + ' : '+ "${responseData['ความเครียด'][0][13]}".toString();
        });
      }
      else{
        setState(() {
          combined2 = '';
          toppic1 = '';
        });
      }

      if (responseData['มือถือ'][0][0] != 'ไม่พบข้อมูล') {
        setState(() {
          setState(() {
            toppic2 = 'ข้อมูลการประเมินการติดสมาร์ทโฟน ( SAS-SV )';
                  combined3 = guide3[0] + ' : '+ responseData['มือถือ'][0][7].toString()+ '\n' +
                      guide3[1] + ' : '+ responseData['มือถือ'][0][8].toString()+ '\n' +
                      guide3[2] + ' : '+ responseData['มือถือ'][0][9].toString()+ '\n' +
                      guide3[3] + ' : '+ responseData['มือถือ'][0][10].toString()+ '\n' +
                      guide3[4] + ' : '+ responseData['มือถือ'][0][11].toString();

                  setState(() {
                          combined4 = guide4[0] + ' : '+ responseData['มือถือ'][0][12].toString()+ '\n' +
                              guide4[1] + ' : '+ responseData['มือถือ'][0][13].toString()+ '\n' + guide4[2] + ' : '+ responseData['มือถือ'][0][14].toString()+ '\n' +
                              guide4[3] + ' : '+ responseData['มือถือ'][0][15].toString()+ '\n' + guide4[4] + ' : '+ responseData['มือถือ'][0][16].toString()+ '\n' +
                              guide4[5] + ' : '+ responseData['มือถือ'][0][17].toString()+ '\n' + guide4[6] + ' : '+ responseData['มือถือ'][0][18].toString()+ '\n' +
                              guide4[7] + ' : '+ responseData['มือถือ'][0][19].toString()+ '\n' + guide4[8] + ' : '+ responseData['มือถือ'][0][20].toString()+ '\n' +
                              guide4[9] + ' : '+ responseData['มือถือ'][0][21].toString()+ '\n' + guide4[10] + ' : '+ responseData['มือถือ'][0][22].toString()+ '\n' +
                              guide4[11] + ' : '+ responseData['มือถือ'][0][23].toString();
                        });
          });
        });
      }
      else{
        setState(() {
          combined3 = '';
          combined4 = '';
          toppic2 = '';
        });
      }

      if (responseData["นอน"][0][0] != 'ไม่พบข้อมูล') {
        setState(() {
          toppic3 = 'ข้อมููลประเมินคุณถาพการนอนหลับ ( PSQI )';
          setState(() {
                  combined5 = guide5[0] + ' : '+ responseData["นอน"][0][7].toString()+ '\n' +
                      guide5[1] + ' : '+ responseData["นอน"][0][8].toString()+ '\n' + guide5[2] + ' : '+ responseData["นอน"][0][9].toString()+ '\n' +
                      guide5[3] + ' : '+ responseData["นอน"][0][10].toString()+ '\n' + guide5[4] + ' : '+ responseData["นอน"][0][11].toString()+ '\n' +
                      guide5[5] + ' : '+ responseData["นอน"][0][12].toString()+ '\n' + guide5[6] + ' : '+ responseData["นอน"][0][13].toString()+ '\n' +
                      guide5[7] + ' : '+ responseData["นอน"][0][32].toString()+ '\n' + guide5[8] + ' : '+ responseData["นอน"][0][33].toString();
                });
          setState(() {
                  combined6 = guide6[0] + ' : '+ responseData["นอน"][0][14].toString()+ '\n' + guide6[1] + ' : '+ responseData["นอน"][0][15].toString()+ '\n' +
                      guide6[2] + ' : '+ responseData["นอน"][0][16].toString()+ '\n' + guide6[3] + ' : '+ responseData["นอน"][0][17].toString()+ '\n' +
                      guide6[4] + ' : '+ responseData["นอน"][0][18].toString()+ '\n' + guide6[5] + ' : '+ responseData["นอน"][0][19].toString()+ '\n' +
                      guide6[6] + ' : '+ responseData["นอน"][0][20].toString()+ '\n' + guide6[7] + ' : '+ responseData["นอน"][0][21].toString()+ '\n' +
                      guide6[8] + ' : '+ responseData["นอน"][0][22].toString()+ '\n' + guide6[9] + ' : '+ responseData["นอน"][0][23].toString()+ '\n' +
                      guide6[10] + ' : '+ responseData["นอน"][0][24].toString()+ '\n' + guide6[11] + ' : '+ responseData["นอน"][0][25].toString()+ '\n' +
                      guide6[12] + ' : '+ responseData["นอน"][0][26].toString()+ '\n' + guide6[13] + ' : '+ responseData["นอน"][0][27].toString()+ '\n' +
                      guide6[14] + ' : '+ responseData["นอน"][0][28].toString()+ '\n' + guide6[15] + ' : '+ responseData["นอน"][0][29].toString()+ '\n' +
                      guide6[16] + ' : '+ responseData["นอน"][0][30].toString();
                });
        });
      }
      else{
        setState(() {
          combined5 = '';
          combined6 = '';
          toppic3 = '';
        });
      }
    }  else {
      print('การโพสต์ข้อมูลล้มเหลว. รหัสสถานะ: ${response.statusCode}');
    }
  }

  Future<void> _postDelete() async {
    // ข้อมูลที่จะส่งไปยัง API
    Map<String, dynamic> data = {
      "id": id.text,
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
      _postFind();
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
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 30,),
            Text(combined1,
              style: TextStyle(
                fontFamily: 'Kanit',
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Text( toppic1 ,style: TextStyle(
              fontFamily: 'Kanit',
              fontSize: 15,
              color: Colors.black,
              ),
              ),
        ),),
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 30,),
            Text(combined2,
              style: TextStyle(
                fontFamily: 'Kanit',
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(toppic2,style: TextStyle(
          fontFamily: 'Kanit',
          fontSize: 15,
          color: Colors.black,
        ),
        ),),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 30,),
            Text(
              combined3,
              style: TextStyle(
                fontFamily: 'Kanit',
                fontSize: 15,
                color: Colors.black,
              ),
            ),
    ],
    ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 30,),
          Text(combined4,
            style: TextStyle(
              fontFamily: 'Kanit',
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(toppic3,style: TextStyle(
          fontFamily: 'Kanit',
          fontSize: 15,
          color: Colors.black,
        ),
        ),),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 30,),
          Text(combined6,
            style: TextStyle(
              fontFamily: 'Kanit',
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 120,),
      Text(combined5,
        style: TextStyle(
          fontFamily: 'Kanit',
          fontSize: 15,
          color: Colors.black,
        ),
      ),
    ],
    ),
    ];
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