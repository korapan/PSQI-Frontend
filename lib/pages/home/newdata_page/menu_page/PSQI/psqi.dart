import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:projectmobile/pages/log/routes.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class psqi extends StatefulWidget {
  const psqi({Key? key}) : super(key: key);

  @override
  State<psqi> createState() => _PsqiState();
}
var AAA ;
class _PsqiState extends State<psqi> {
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
              Text('ทำการถ่ายภาพแบบสอบถามให้ครบทั้ง 3 หน้ากระดาษ',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Kanit",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 20,),
              ...build1_4(),
              SizedBox(height: 20), // เพิ่มระยะห่างระหว่าง Container และ Text
              Container(
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      AAA =  210/100;
                      pickerCamera(1);
                    },
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset('assets/img_8.png'),
                    ),
                  ),
                ),
              ),
              ...build5a_5c(),
              SizedBox(height: 20), // เพิ่มระยะห่างระหว่าง Container และ Text
              Container(
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      AAA =  210/297;
                      pickerCamera(2);
                    },
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset('assets/img_8.png'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ...build5d_6(),
              SizedBox(height: 20), // เพิ่มระยะห่างระหว่าง Container และ Text
              Container(
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      AAA =  210/297;
                      pickerCamera(3);
                    },
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset('assets/img_8.png'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ...build7_9(),
              SizedBox(height: 20), // เพิ่มระยะห่างระหว่าง Container และ Text
              Container(
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      AAA =  210/297;
                      pickerCamera(4);
                    },
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset('assets/img_8.png'),
                    ),
                  ),
                ),
              ),SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  // if (e1.text.isNotEmpty && int.tryParse(e1.text) != null && int.parse(e1.text) < 4 && int.parse(e1.text) >=0) {
                     bedtimr = double.parse(e1.text);
                  // } else {}
                  // if (e2.text.isNotEmpty && int.tryParse(e2.text) != null && int.parse(e2.text) < 4 && int.parse(e2.text) >=0) {
                     numofmi = double.parse(e2.text);
                  // } else {}
                  // if (e3.text.isNotEmpty && int.tryParse(e3.text) != null && int.parse(e3.text) < 4 && int.parse(e3.text) >=0) {
                     getup = double.parse(e3.text);
                  // } else {}
                  // if (e4.text.isNotEmpty && int.tryParse(e4.text) != null && int.parse(e4.text) < 4 && int.parse(e4.text) >=0) {
                     housesl = double.parse(e4.text);
                  // } else {}
                  if (e5a.text.isNotEmpty && int.tryParse(e5a.text) != null && int.parse(e5a.text) < 4 && int.parse(e5a.text) >=0) {
                    fa = double.parse(e5a.text);
                  } else {}
                  if (e5b.text.isNotEmpty && int.tryParse(e5b.text) != null && int.parse(e5b.text) < 4 && int.parse(e5b.text) >=0) {
                    fb = double.parse(e5b.text);
                  } else {}
                  if (e5c.text.isNotEmpty && int.tryParse(e5c.text) != null && int.parse(e5c.text) < 4 && int.parse(e5c.text) >=0) {
                    fc = double.parse(e5c.text);
                  } else {}
                  if (e5d.text.isNotEmpty && int.tryParse(e5d.text) != null && int.parse(e5d.text) < 4 && int.parse(e5d.text) >=0) {
                    fd = double.parse(e5d.text);
                  } else {}
                  if (e5e.text.isNotEmpty && int.tryParse(e5e.text) != null && int.parse(e5e.text) < 4 && int.parse(e5e.text) >=0) {
                    fe = double.parse(e5e.text);
                  } else {}
                  if (e5f.text.isNotEmpty && int.tryParse(e5f.text) != null && int.parse(e5f.text) < 4 && int.parse(e5f.text) >=0) {
                    ff = double.parse(e5f.text);
                  } else {}
                  if (e5g.text.isNotEmpty && int.tryParse(e5g.text) != null && int.parse(e5g.text) < 4 && int.parse(e5g.text) >=0) {
                    fg = double.parse(e5g.text);
                  } else {}
                  if (e5h.text.isNotEmpty && int.tryParse(e5h.text) != null && int.parse(e5h.text) < 4 && int.parse(e5h.text) >=0) {
                    fh = double.parse(e5h.text);
                  } else {}
                  if (e5i.text.isNotEmpty && int.tryParse(e5i.text) != null && int.parse(e5i.text) < 4 && int.parse(e5i.text) >=0) {
                    fi = double.parse(e5i.text);
                  } else {}
                  if (e5j.text.isNotEmpty && int.tryParse(e5j.text) != null && int.parse(e5j.text) < 4 && int.parse(e5j.text) >=0) {
                    fj = double.parse(e5j.text);
                  } else {}
                  if (e6.text.isNotEmpty && int.tryParse(e6.text) != null && int.parse(e6.text) < 4 && int.parse(e6.text) >=0) {
                    si = double.parse(e6.text);
                  } else {}
                  if (e7.text.isNotEmpty && int.tryParse(e7.text) != null && int.parse(e7.text) < 4 && int.parse(e7.text) >=0) {
                    se = double.parse(e7.text);
                  } else {}
                  if (e8.text.isNotEmpty && int.tryParse(e8.text) != null && int.parse(e8.text) < 4 && int.parse(e8.text) >=0) {
                    e = double.parse(e8.text);
                  } else {}
                  if (e9.text.isNotEmpty && int.tryParse(e9.text) != null && int.parse(e9.text) < 4 && int.parse(e9.text) >=0) {
                    n = double.parse(e9.text);
                  } else {}
                  _postDataPSQI();
                },
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Color.fromARGB(255, 127, 97, 166)),
                  // กำหนดสีพื้นหลังเมื่อปุ่มอยู่ในสถานะปกติ
                  foregroundColor: MaterialStateProperty.all<Color>(Colors
                      .white),
                  elevation: MaterialStateProperty.all<double>(20),// กำหนดสีของตัวอักษรเมื่อปุ่มอยู่ในสถานะปกติ
                ),
                child: Text("ยืนยัน"),
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

  Future<void> pickerCamera(int a) async {
    final int A = a;
    final image = await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CameraOverlayScreen(
        cameraController: _cameraController,
        initializeControllerFuture: _initializeControllerFuture,
      ),
    ));
  if (A == 1) {
    if (image != null) {
      setState(() {
        file = File(image.path);
      });
      if (file != null) {
        await _uploadImage(file!);
        print('ได้ภาพแล้ววววววววววววววววววววว');
      }
    }
  }else if(A == 2){
    if (image != null) {
      setState(() {
        file = File(image.path);
      });
      if (file != null) {
        await _uploadImage1(file!);
        print('ได้ภาพแล้ววววววววววววววววววววว');
      }
    }
  }else if(A == 3){
    if (image != null) {
      setState(() {
        file = File(image.path);
      });
      if (file != null) {
        await _uploadImage2(file!);
        print('ได้ภาพแล้ววววววววววววววววววววว');
      }
    }
  }
  else if(A == 4){
    if (image != null) {
      setState(() {
        file = File(image.path);
      });
      if (file != null) {
        await _uploadImage3(file!);
        print('ได้ภาพแล้ววววววววววววววววววววว');
      }
    }
  }
  }

  Future<void> _uploadImage(File image) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse(AppRoute.ipaddress + '/imageprocess'));
    request.files.add(await http.MultipartFile.fromPath('image', image.path));
    var response = await request.send();

    if (response.statusCode == 200) {
      // อ่านข้อมูลที่เซิร์ฟเวอร์ส่งกลับมา
      var responseData = await response.stream.bytesToString();
      print(responseData); // พิมพ์ค่าที่รับมาใน console

      var jsonResponse = json.decode(responseData);
      String message = jsonResponse['message'];

      print('ข้อความ: $message');
      print('ผลลัพธ์: $bedtimr');
      print('ผลลัพธ์1: $numofmi');
      print('ผลลัพธ์2: $getup');
      print('ผลลัพธ์3: $housesl');
      setState(() {
        bedtimr = jsonResponse['result'];
        numofmi = jsonResponse['result1'];
        getup = jsonResponse['result2'];
        housesl = jsonResponse['result3'];
      });
      _showSuccessSnackBar();
    } else {
      // Handle error
      print("Upload failed with status: ${response.statusCode}");
    }
  }
  Future<void> _uploadImage1(File image) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse(AppRoute.ipaddress + '/image'));
    request.files.add(await http.MultipartFile.fromPath('image', image.path));
    var response = await request.send();

    if (response.statusCode == 200) {
      // อ่านข้อมูลที่เซิร์ฟเวอร์ส่งกลับมา
      var responseData = await response.stream.bytesToString();
      print(responseData); // พิมพ์ค่าที่รับมาใน console

      var jsonResponse = json.decode(responseData);
      String message = jsonResponse['message'];
      setState(() {
        fa = (jsonResponse['a'] as int).toDouble();
        fb = (jsonResponse['b'] as int).toDouble();
        fc = (jsonResponse['c'] as int).toDouble();
      });
      _showSuccessSnackBar();
    } else {
      // Handle error
      print("Upload failed with status: ${response.statusCode}");
    }
  }
  Future<void> _uploadImage2(File image) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse(AppRoute.ipaddress + '/image1'));
    request.files.add(await http.MultipartFile.fromPath('image', image.path));
    var response = await request.send();

    if (response.statusCode == 200) {
      // อ่านข้อมูลที่เซิร์ฟเวอร์ส่งกลับมา
      var responseData = await response.stream.bytesToString();
      print(responseData); // พิมพ์ค่าที่รับมาใน console
      var jsonResponse = json.decode(responseData);
      String message = jsonResponse['message'];
      setState(() {
        fd = (jsonResponse['d'] as int).toDouble();
        fe = (jsonResponse['e'] as int).toDouble();
        ff = (jsonResponse['f'] as int).toDouble();
        fg = (jsonResponse['g'] as int).toDouble();
        fh = (jsonResponse['h'] as int).toDouble();
        fi = (jsonResponse['i'] as int).toDouble();
        fj = (jsonResponse['j'] as int).toDouble();
        si = (jsonResponse['k'] as int).toDouble();
      });
      _showSuccessSnackBar();
    } else {
      // Handle error
      print("Upload failed with status: ${response.statusCode}");
    }
  }
  Future<void> _uploadImage3(File image) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse(AppRoute.ipaddress + '/image2'));
    request.files.add(await http.MultipartFile.fromPath('image', image.path));
    var response = await request.send();

    if (response.statusCode == 200) {
      // อ่านข้อมูลที่เซิร์ฟเวอร์ส่งกลับมา
      var responseData = await response.stream.bytesToString();
      print(responseData); // พิมพ์ค่าที่รับมาใน console
      var jsonResponse = json.decode(responseData);
      String message = jsonResponse['message'];

      setState(() {
        se = (jsonResponse['l'] as int).toDouble();
        e = (jsonResponse['m'] as int).toDouble();
        n = (jsonResponse['n'] as int).toDouble();
      });
      _showSuccessSnackBar();
    } else {
      // Handle error
      print("Upload failed with status: ${response.statusCode}");
    }
  }

  build1_4() {
    return [
      Container(alignment: Alignment.centerLeft,
        child: Text('1. What time you usually gone to bed at night?',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),
      Container(alignment: Alignment.centerLeft,
        child: Text('(Set the time in the range 0.00 to 23.59)',style: TextStyle(fontFamily: "Kanit", color: Colors.grey,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text('BED TIME : ${bedtimr.toString()} ',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
            )),
          ),
          Container(
            width: 80,
            child: TextField(
              controller: e1,
              decoration: InputDecoration(labelText: 'value', labelStyle: TextStyle(color: Colors.grey), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
              ),
            ),
          ),
        ],
      ),
      Container(alignment: Alignment.centerLeft,
        child: Text('2. How long (in minute) has it usually taken you tofall asleep?',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),Container(alignment: Alignment.centerLeft,
        child: Text('(In minute)',style: TextStyle(fontFamily: "Kanit", color: Colors.grey,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text('NUMBER OF MINUTES : ${numofmi.toString()} ',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
            )),
          ),
          Container(
            width: 80,
            child: TextField(
              controller: e2,
              decoration: InputDecoration(labelText: 'value', labelStyle: TextStyle(color: Colors.grey), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
              ),
            ),
          ),
        ],
      ),
      Container(alignment: Alignment.centerLeft,
        child: Text('3. What time have you usually gotten up inthe morning?',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),
      Container(alignment: Alignment.centerLeft,
        child: Text('(Set the time in the range 0.00 to 23.59)',style: TextStyle(fontFamily: "Kanit", color: Colors.grey,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text('GETTING UP TIME : ${getup.toString()}',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
            )),
          ),
          Container(
            width: 80,
            child: TextField(
              controller: e3,
              decoration: InputDecoration(labelText: 'value', labelStyle: TextStyle(color: Colors.grey), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
              ),
            ),
          ),
        ],
      ),
      Container(alignment: Alignment.centerLeft,
        child: Text('4. How many hours of actual sleep did you get at night?',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),
      Container(alignment: Alignment.centerLeft,
        child: Text('(In hour)',style: TextStyle(fontFamily: "Kanit", color: Colors.grey,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text('HOURS OF SLEEP PER NIGHT : ${housesl.toString()}',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
            )),
          ),
          Container(
            width: 80,
            child: TextField(
              controller: e4,
              decoration: InputDecoration(labelText: 'value', labelStyle: TextStyle(color: Colors.grey), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
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
        child: Text('5A. Cannot get to sleep whitin 30 minites',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(' : ${fa.toString()} Point',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
            )),),
          Container(
            width: 80,
            child: TextField(
              controller: e5a,
              decoration: InputDecoration(labelText: 'valeu', labelStyle: TextStyle(color: Colors.grey), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
              ),),),],),
      Container(
        alignment: Alignment.centerLeft,
        child: Text('5B. Wake up in the middle of the night or early morning',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(' : ${fb.toString()} Point',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
            )),),
          Container(
            width: 80,
            child: TextField(
              controller: e5b,
              decoration: InputDecoration(labelText: 'value', labelStyle: TextStyle(color: Colors.grey), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
              ),),),],),
      Container(
        alignment: Alignment.centerLeft,
        child: Text('5C. Have to get up to use the bathroom',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(' : ${fc.toString()} Point',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
            )),),
          Container(
            width: 80,
            child: TextField(
              controller: e5c,
              decoration: InputDecoration(labelText: 'value', labelStyle: TextStyle(color: Colors.grey), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
              ),),),],),
    ];
  }

  build5d_6() {
    return [
      Container(
        alignment: Alignment.centerLeft,
        child: Text('5D. Cannot breathe comfortably',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(' : ${fd.toString()} Point',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
            )),),
          Container(
            width: 80,
            child: TextField(
              controller: e5d,
              decoration: InputDecoration(labelText: 'value', labelStyle: TextStyle(color: Colors.grey), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
              ),),),],),
      Container(
        alignment: Alignment.centerLeft,
        child: Text('5E. Cought or snore loudly',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(' : ${fe.toString()} Point',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
            )),),
          Container(
            width: 80,
            child: TextField(
              controller: e5e,
              decoration: InputDecoration(labelText: 'value', labelStyle: TextStyle(color: Colors.grey), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
              ),),),],),
      Container(
        alignment: Alignment.centerLeft,
        child: Text('5F. Feel too cold',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(' : ${ff.toString()} Point',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
            )),),
          Container(
            width: 80,
            child: TextField(
              controller: e5f,
              decoration: InputDecoration(labelText: 'value', labelStyle: TextStyle(color: Colors.grey), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
              ),),),],),
      Container(
        alignment: Alignment.centerLeft,
        child: Text('5G. Feel too hot',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(' : ${fg.toString()} Point',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
            )),),
          Container(
            width: 80,
            child: TextField(
              controller: e5g,
              decoration: InputDecoration(labelText: 'value', labelStyle: TextStyle(color: Colors.grey), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
              ),),),],),
      Container(
        alignment: Alignment.centerLeft,
        child: Text('5H. Had bad breams',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(' : ${fh.toString()} Point',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
            )),),
          Container(
            width: 80,
            child: TextField(
              controller: e5h,
              decoration: InputDecoration(labelText: 'value', labelStyle: TextStyle(color: Colors.grey), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
              ),),),],),
      Container(
        alignment: Alignment.centerLeft,
        child: Text('5I. Have pain',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(' : ${fi.toString()} Point',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
            )),),
          Container(
            width: 80,
            child: TextField(
              controller: e5i,
              decoration: InputDecoration(labelText: 'value', labelStyle: TextStyle(color: Colors.grey), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
              ),),),],),
      Container(
        alignment: Alignment.centerLeft,
        child: Text('5J. other reason',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(' : ${fj.toString()} Point',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
            )),),
          Container(
            width: 80,
            child: TextField(
              controller: e5j,
              decoration: InputDecoration(labelText: 'value', labelStyle: TextStyle(color: Colors.grey), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
              ),),),],),
      Container(
        alignment: Alignment.centerLeft,
        child: Text('6. How would you rate your sleep quality overrall?',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(' : ${si.toString()} Point',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
            )),),
          Container(
            width: 80,
            child: TextField(
              controller: e6,
              decoration: InputDecoration(labelText: 'value', labelStyle: TextStyle(color: Colors.grey), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
              ),),),],),
    ];
  }

  build7_9() {
    return [
      Container(
        alignment: Alignment.centerLeft,
        child: Text('7. How often have you take medicine to help',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(' : ${se.toString()} Point',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
            )),),
          Container(
            width: 80,
            child: TextField(
              controller: e7,
              decoration: InputDecoration(labelText: 'value', labelStyle: TextStyle(color: Colors.grey), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
              ),),),],),
      Container(
        alignment: Alignment.centerLeft,
        child: Text('8. How often have you had trouble staying awake in social activity?',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(' : ${e.toString()} Point',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
            )),),
          Container(
            width: 80,
            child: TextField(
              controller: e8,
              decoration: InputDecoration(labelText: 'value', labelStyle: TextStyle(color: Colors.grey), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
              ),),),],),
      Container(
        alignment: Alignment.centerLeft,
        child: Text('9. How much of a problem has it been for you to keep up enough enthusiasm to get things done?',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(' : ${n.toString()} Point',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
            )),),
          Container(
            width: 80,
            child: TextField(
              controller: e9,
              decoration: InputDecoration(labelText: 'value', labelStyle: TextStyle(color: Colors.grey), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
              ),),),],),
    ];
  }

  Future<void> _postDataPSQI() async {

    // ข้อมูลที่จะโพสต์ไปยัง API
    print(bedtimr);
    print(numofmi);
        print(getup);
        print(housesl);
    Map<String, dynamic> data = {
      "s1": bedtimr, "s2": numofmi, "s3": getup, "s4": housesl, "s51": fa,
      "s52": fb, "s53": fc, "s54": fd, "s55": fe, "s56": ff, "s57": fg,
      "s58": fh, "s59": fi, "s50": fj, "s6": si, "s7": se, "s8": e, "s9": n,

    };
    // แปลงข้อมูลเป็น JSON
    String jsonData = jsonEncode(data);
    // URL ของ API ที่ต้องการโพสต์ข้อมูลไป
    String apiUrl = AppRoute.ipaddress+'/receive-dataPSQI';
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
      _handHome();
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

class CameraOverlayScreen extends StatelessWidget {
  final CameraController cameraController;
  final Future<void> initializeControllerFuture;

  const CameraOverlayScreen({
    Key? key,
    required this.cameraController,
    required this.initializeControllerFuture,
  }) : super(key: key);

  Future<void> _takePicture(BuildContext context) async {
    try {
      await initializeControllerFuture;

      final image = await cameraController.takePicture();
      Navigator.pop(context, image);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                CameraPreview(cameraController),
                CustomPaint(
                  painter: OverlayPainter(),
                  child: Container(),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FloatingActionButton(
                      onPressed: () => _takePicture(context),
                      child: Icon(Icons.camera),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class OverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final width = size.width;
    final height = size.height;

    // A4 aspect ratio: 210mm x 297mm
    var a4AspectRatio = AAA;

    // Calculate A4 size while maintaining aspect ratio
    double a4Width;
    double a4Height;

    if (width / height > a4AspectRatio) {
      a4Height = height * 0.90; // use 90% of screen height
      a4Width = a4Height * a4AspectRatio;
    } else {
      a4Width = width * 0.90; // use 90% of screen width
      a4Height = a4Width / a4AspectRatio;
    }

    final left = (width - a4Width) / 2;
    final top = (height - a4Height) / 2;
    final right = left + a4Width;
    final bottom = top + a4Height;

    // Draw rectangle for A4 size
    canvas.drawRect(
      Rect.fromLTRB(left, top, right, bottom),
      paint,
    );

    // Draw corner lines
    final cornerLength = 30.0;

    // Top left corner
    canvas.drawLine(
      Offset(left, top),
      Offset(left + cornerLength, top),
      paint,
    );
    canvas.drawLine(
      Offset(left, top),
      Offset(left, top + cornerLength),
      paint,
    );

    // Top right corner
    canvas.drawLine(
      Offset(right, top),
      Offset(right - cornerLength, top),
      paint,
    );
    canvas.drawLine(
      Offset(right, top),
      Offset(right, top + cornerLength),
      paint,
    );

    // Bottom left corner
    canvas.drawLine(
      Offset(left, bottom),
      Offset(left + cornerLength, bottom),
      paint,
    );
    canvas.drawLine(
      Offset(left, bottom),
      Offset(left, bottom - cornerLength),
      paint,
    );

    // Bottom right corner
    canvas.drawLine(
      Offset(right, bottom),
      Offset(right - cornerLength, bottom),
      paint,
    );
    canvas.drawLine(
      Offset(right, bottom),
      Offset(right, bottom - cornerLength),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}



