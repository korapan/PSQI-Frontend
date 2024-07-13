import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:projectmobile/pages/log/routes.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class e_psqi extends StatefulWidget {
  const e_psqi({Key? key}) : super(key: key);

  @override
  State<e_psqi> createState() => _e_psqiState();
}
var AAA ;
class _e_psqiState extends State<e_psqi> {
  final ImagePicker _picker = ImagePicker();
  String last = '';
  File? file;
  List<XFile> photo = <XFile>[];
  List<XFile> itemImagesList = <XFile>[];
  XFile? camera;
  double bedtimr = 0.0;
  double numofmi = 0.0;
  double getup = 0.0;
  double housesl = 0.0;
  double fa = 0.0;
  double fb = 0.0;
  double fc = 0.0;
  double fd = 0.0;
  double fe = 0.0;
  double ff = 0.0;
  double fg = 0.0;
  double fh = 0.0;
  double fi = 0.0;
  double fj = 0.0;
  double si = 0.0;
  double se = 0.0;
  double e = 0.0;
  double n = 0.0;


  final e1 = TextEditingController();
  final e2 = TextEditingController();
  final e3 = TextEditingController();
  final e4 = TextEditingController();
  final e5a = TextEditingController();
  final e5b = TextEditingController();
  final e5c = TextEditingController();
  final e5d = TextEditingController();
  final e5e = TextEditingController();
  final e5f = TextEditingController();
  final e5g = TextEditingController();
  final e5h = TextEditingController();
  final e5i = TextEditingController();
  final e5j = TextEditingController();
  final e6 = TextEditingController();
  final e7 = TextEditingController();
  final e8 = TextEditingController();
  final e9 = TextEditingController();

  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  void _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _cameraController = CameraController(
      firstCamera,
      ResolutionPreset.high,
    );

    _initializeControllerFuture = _cameraController.initialize().then((_) {
      if (!mounted) return;
      setState(() {
        _isCameraInitialized = true;
      });
    });
  }

  @override
  void dispose() {
    e1.dispose();
    e2.dispose();
    e3.dispose();
    e4.dispose();
    e5a.dispose();
    e5b.dispose();
    e5c.dispose();
    e5d.dispose();
    e5e.dispose();
    e5f.dispose();
    e5g.dispose();
    e5h.dispose();
    e5i.dispose();
    e5j.dispose();
    e6.dispose();
    e7.dispose();
    e8.dispose();
    e9.dispose();
    _cameraController.dispose();
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
              _handHome();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10,),
              Text('Pittsburgh Sleep Quality Index: PSQI',style: TextStyle(
                fontSize: 30,
                fontFamily: "Kanit",
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),
              SizedBox(height: 10,),
              Text('แบบประเมินคุณภาพการนอนหลับของพิตต์สเบิร์ก',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Kanit",
                    color: Color.fromARGB(255, 128, 159, 90),
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 20,),
              Text('แก้ไขข้อมูล',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Kanit",
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  )),
              ...build1_4(),
              SizedBox(height: 20), // เพิ่มระยะห่างระหว่าง Container และ Text
              ...build5a_5c(),
              SizedBox(height: 20), // เพิ่มระยะห่างระหว่าง Container และ Text
              SizedBox(height: 20),
              ...build5d_6(),
              SizedBox(height: 20), // เพิ่มระยะห่างระหว่าง Container และ Text
              SizedBox(height: 20),
              ...build7_9(),
              SizedBox(height: 20), // เพิ่มระยะห่างระหว่าง Container และ Text
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  if (e1.text.isNotEmpty) {
                    bedtimr = double.parse(e1.text);
                  } else {}
                  if (e2.text.isNotEmpty) {
                    numofmi = double.parse(e2.text);
                  } else {}
                  if (e3.text.isNotEmpty) {
                    getup = double.parse(e3.text);
                  } else {}
                  if (e4.text.isNotEmpty) {
                    housesl = double.parse(e4.text);
                  } else {}
                  if (e5a.text.isNotEmpty) {
                    fa = double.parse(e5a.text);
                  } else {}
                  if (e5b.text.isNotEmpty) {
                    fb = double.parse(e5b.text);
                  } else {}
                  if (e5c.text.isNotEmpty) {
                    fc = double.parse(e5c.text);
                  } else {}
                  if (e5d.text.isNotEmpty) {
                    fd = double.parse(e5d.text);
                  } else {}
                  if (e5e.text.isNotEmpty) {
                    fe = double.parse(e5e.text);
                  } else {}
                  if (e5f.text.isNotEmpty) {
                    ff = double.parse(e5f.text);
                  } else {}
                  if (e5g.text.isNotEmpty) {
                    fg = double.parse(e5g.text);
                  } else {}
                  if (e5h.text.isNotEmpty) {
                    fh = double.parse(e5h.text);
                  } else {}
                  if (e5i.text.isNotEmpty) {
                    fi = double.parse(e5i.text);
                  } else {}
                  if (e5j.text.isNotEmpty) {
                    fj = double.parse(e5j.text);
                  } else {}
                  if (e6.text.isNotEmpty) {
                    si = double.parse(e6.text);
                  } else {}
                  if (e7.text.isNotEmpty) {
                    se = double.parse(e7.text);
                  } else {}
                  if (e8.text.isNotEmpty) {
                    e = double.parse(e8.text);
                  } else {}
                  if (e9.text.isNotEmpty) {
                    n = double.parse(e9.text);
                  } else {}
                  _posteditPSQI();
                },
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Color.fromARGB(255, 127, 97, 166)),
                  // กำหนดสีพื้นหลังเมื่อปุ่มอยู่ในสถานะปกติ
                  foregroundColor: MaterialStateProperty.all<Color>(Colors
                      .white),
                  elevation: MaterialStateProperty.all<double>(20),// กำหนดสีของตัวอักษรเมื่อปุ่มอยู่ในสถานะปกติ
                ),
                child: Text("แก้ไข"),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(last,style: TextStyle(fontFamily: "Kanit", color: Colors.red,fontSize: 21,fontWeight: FontWeight.bold,)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handHome() {
    Navigator.pushNamed(context, AppRoute.Home);
  }

  void _showSuccessSnackBar() {
    final snackBar = SnackBar(content: Text('บันทึกข้อมูลสำเร็จ'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  void _editer(BuildContext context) {
    Navigator.pushNamed(context, AppRoute.edit);
  }

  build1_4() {
    return [
      Container(alignment: Alignment.centerLeft,
        child: Text('1. ในช่วงระยะเวลา 1 เดือนที่ผ่านมา โดยปกติแล้วท่านมักเข้านอนเวลาประมาณกี่โมง',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text('เวลาเข้านอนอน : ${bedtimr.toString()} นาฬิกา',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
            )),
          ),
          Container(
            width: 80,
            child: TextField(
              controller: e1,
              decoration: InputDecoration(labelText: 'แก้ไข', labelStyle: TextStyle(color: Colors.black), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
              ),
            ),
          ),
        ],
      ),
      Container(alignment: Alignment.centerLeft,
        child: Text('2. ในช่วงระยะเวลา 1 เดือนที่ผ่านมา โดยปกติแล้วท่านต้องใช้เวลานานเท่าไรจึงจะนอนหลับ',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text('จำนวน : ${numofmi.toString()} นาที',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
            )),
          ),
          Container(
            width: 80,
            child: TextField(
              controller: e2,
              decoration: InputDecoration(labelText: 'แก้ไข', labelStyle: TextStyle(color: Colors.black), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
              ),
            ),
          ),
        ],
      ),
      Container(alignment: Alignment.centerLeft,
        child: Text('3. ในช่วงระยะเวลา 1 เดือนที่ผ่านมา โดยปกติแล้วท่านตื่นนอนตอนเช้าเวลากี่โมง',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text('เวลาที่ตื่นนอนตอนเช้า : ${getup.toString()} นาฬิกา',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
            )),
          ),
          Container(
            width: 80,
            child: TextField(
              controller: e3,
              decoration: InputDecoration(labelText: 'แก้ไข', labelStyle: TextStyle(color: Colors.black), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
              ),
            ),
          ),
        ],
      ),
      Container(alignment: Alignment.centerLeft,
        child: Text('4. ในช่วงระยะเวลา 1 เดือนที่ผ่านมา ท่านนอนหลับได้จริงเป็นเวลากี่ชั่วโมงต่าคืน',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text('จำนวนที่หลับจริงต่อคืน : ${housesl.toString()} ชั่วโมง',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
            )),
          ),
          Container(
            width: 80,
            child: TextField(
              controller: e4,
              decoration: InputDecoration(labelText: 'แก้ไข', labelStyle: TextStyle(color: Colors.black), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
              ),
            ),
          ),
        ],
      ),
    ];
  }

  build5a_5c() {
    return [
      Container(alignment: Alignment.centerLeft,
        child: Text('5A. นอนไม่หลับหลังจากเข้านอนไปแล้วนานกว่า 30 นาที',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            child: TextField(
              controller: e5a,
              decoration: InputDecoration(labelText: 'แก้ไข', labelStyle: TextStyle(color: Colors.black), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
              ),),),],),
      Container(
        alignment: Alignment.centerLeft,
        child: Text('5B. ตื่นขึ้นมากลางดึกหรือตื่นขึ้นมาก่อนจะเช้า',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(
            width: 80,
            child: TextField(
              controller: e5b,
              decoration: InputDecoration(labelText: 'แก้ไข', labelStyle: TextStyle(color: Colors.black), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
              ),),),],),
      Container(
        alignment: Alignment.centerLeft,
        child: Text('5C. ตื่นเพื่อไปเข้าห้องน้ำ',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            child: TextField(
              controller: e5c,
              decoration: InputDecoration(labelText: 'แก้ไข', labelStyle: TextStyle(color: Colors.black), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
              ),),),],),
    ];
  }

  build5d_6() {
    return [
      Container(
        alignment: Alignment.centerLeft,
        child: Text('5D. หายใจไม่สะดวก',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            child: TextField(
              controller: e5d,
              decoration: InputDecoration(labelText: 'แก้ไข', labelStyle: TextStyle(color: Colors.black), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
              ),),),],),
      Container(
        alignment: Alignment.centerLeft,
        child: Text('5E. ไอหรือกรยเสียงดัง',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(
            width: 80,
            child: TextField(
              controller: e5e,
              decoration: InputDecoration(labelText: 'แก้ไข', labelStyle: TextStyle(color: Colors.black), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
              ),),),],),
      Container(
        alignment: Alignment.centerLeft,
        child: Text('5F. รู้สึกหนาวเกินไป',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            child: TextField(
              controller: e5f,
              decoration: InputDecoration(labelText: 'แก้ไข', labelStyle: TextStyle(color: Colors.black), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
              ),),),],),
      Container(
        alignment: Alignment.centerLeft,
        child: Text('5G. รู้สึกร้อนเกินไป',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(
            width: 80,
            child: TextField(
              controller: e5g,
              decoration: InputDecoration(labelText: 'แก้ไข', labelStyle: TextStyle(color: Colors.black), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
              ),),),],),
      Container(
        alignment: Alignment.centerLeft,
        child: Text('5H. ฝันร้าย ละเมอ',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(
            width: 80,
            child: TextField(
              controller: e5h,
              decoration: InputDecoration(labelText: 'แก้ไข', labelStyle: TextStyle(color: Colors.black), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
              ),),),],),
      Container(
        alignment: Alignment.centerLeft,
        child: Text('5I. รู้สึกปวดเมื่อยกล้ามเนื้อ',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            child: TextField(
              controller: e5i,
              decoration: InputDecoration(labelText: 'แก้ไข', labelStyle: TextStyle(color: Colors.black), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
              ),),),],),
      Container(
        alignment: Alignment.centerLeft,
        child: Text('5J. อื่นๆ',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            child: TextField(
              controller: e5j,
              decoration: InputDecoration(labelText: 'แก้ไข', labelStyle: TextStyle(color: Colors.black), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
              ),),),],),
      Container(
        alignment: Alignment.centerLeft,
        child: Text('6. ในระยะเวลา 1 เดือนที่ผ่านมา คุณภาพโดยรวมเป็นอย่างไร',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            child: TextField(
              controller: e6,
              decoration: InputDecoration(labelText: 'แก้ไข', labelStyle: TextStyle(color: Colors.black), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
              ),),),],),
    ];
  }

  build7_9() {
    return [
      Container(
        alignment: Alignment.centerLeft,
        child: Text('7. ในระยะเวลา 1 เดือนที่ผ่านมา ท่านใช้ยาเพื่อช่วยในการนอนหลับบ่อยเพียงใด',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            child: TextField(
              controller: e7,
              decoration: InputDecoration(labelText: 'แก้ไข', labelStyle: TextStyle(color: Colors.black), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
              ),),),],),
      Container(
        alignment: Alignment.centerLeft,
        child: Text('8. ในช่วงระยะเวลา 1 เดือนที่ผ่านมา ท่านมีปัญหาง่วงนอนในขณะทำกิจวัตรประจำวันต่างๆ บ่อยเพียงใด',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            child: TextField(
              controller: e8,
              decoration: InputDecoration(labelText: 'แก้ไข', labelStyle: TextStyle(color: Colors.black), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
              ),),),],),
      Container(
        alignment: Alignment.centerLeft,
        child: Text('9. ในช่วง 1 เดือรที่ผ่านมา ท่านมีปัญหาเกี่ยวกับความกระตือรือร้นในการทำงานให้สำเร็จมากน้อยเพียงใด',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            child: TextField(
              controller: e9,
              decoration: InputDecoration(labelText: 'แก้ไข', labelStyle: TextStyle(color: Colors.black), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
              ),),),],),
    ];
  }

  Future<void> _posteditPSQI() async {

    // ข้อมูลที่จะโพสต์ไปยัง API
    Map<String, dynamic> data = {
      "s1": bedtimr, "s2": numofmi, "s3": getup, "s4": housesl, "s51": fa,
      "s52": fb, "s53": fc, "s54": fd, "s55": fe, "s56": ff, "s57": fg,
      "s58": fh, "s59": fi, "s50": fj, "s6": si, "s7": se, "s8": e, "s9": n,

    };
    // แปลงข้อมูลเป็น JSON
    String jsonData = jsonEncode(data);
    // URL ของ API ที่ต้องการโพสต์ข้อมูลไป
    String apiUrl = AppRoute.ipaddress+'/edit-dataPSQI';
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
      _editer(context);
    }
    else if(response.statusCode == 500){
      setState(() {
        last = 'ยังไม่ได้กำหนด ID ของข้อมูล';
      });
    }else {
      print('Failed to post data. Status code: ${response.statusCode}');
    }
  }
}