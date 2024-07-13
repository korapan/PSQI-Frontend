import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:projectmobile/pages/log/routes.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? file;
  File? done;

  double bedtimr = 0.0;
  double numofmi = 0.0;
  double getup = 0.0;
  double housesl = 0.0;
  double fa = 0;
  double fb = 0;
  double fc = 0;
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


  void _showSuccessSnackBar() {
    final snackBar = SnackBar(content: Text('บันทึกข้อมูลสำเร็จ'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  Future<void> _getFromCamera1() async {
    print('ได้1');
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      assert(pickedFile != null, 'pickedFile should not be null');
      file = File(pickedFile!.path);
      var newPath = '${file!.path}.png';
      file = file!.renameSync(newPath);
      assert(file != null, 'file should not be null');
      _uploadImagenewPSQI(file!);
    });
  }
  Future<void> _getFromCamera2() async {
    print('ได้2');
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      assert(pickedFile != null, 'pickedFile should not be null');
      file = File(pickedFile!.path);
      var newPath = '${file!.path}.png';
      file = file!.renameSync(newPath);
      assert(file != null, 'file should not be null');
      _uploadImagenewPSQI1(file!);
    });
  }
  Future<void> _getFromCamera3() async {
    print('ได้3');
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      assert(pickedFile != null, 'pickedFile should not be null');
      file = File(pickedFile!.path);
      var newPath = '${file!.path}.png';
      file = file!.renameSync(newPath);
      assert(file != null, 'file should not be null');
      _uploadImagenewPSQI2(file!);
    });
  }


  Widget showImage() {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 50.0),
              height: 200,
              child: file != null ? Image.file(file!) : SizedBox(), // เช็คว่ามีภาพหรือไม่ก่อนแสดง
            ),
          )
        ],
      ),
    );
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
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
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
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
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
                // ElevatedButton(
                //   onPressed: _getFromCamera,
                //   child: Text(''),
                // ),
                ...listPSQI(),
                showImage(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _uploadImagenewPSQI(File image) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(AppRoute.ipaddress + '/image'),
      );
      request.files.add(
        await http.MultipartFile.fromPath('image', image.path),
      );
      var response = await request.send();

      if (response.statusCode == 200) {
        // การส่งภาพผ่าน API สำเร็จ
        print('Upload successful');
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
          fa = (jsonResponse['a'] as int).toDouble();
          fb = (jsonResponse['b'] as int).toDouble();
          fc = (jsonResponse['c'] as int).toDouble();
        });
        _showSuccessSnackBar();
        // ใส่โค้ดเพิ่มเติมตามความต้องการ เช่น การอ่านข้อมูลที่เซิร์ฟเวอร์ส่งกลับมา
      } else {
        // การส่งภาพผ่าน API ไม่สำเร็จ
        print('Upload failed with status code: ${response.statusCode}');

        // ใส่โค้ดเพิ่มเติมตามความต้องการ เช่น การจัดการข้อผิดพลาด
      }
    } catch (e) {
      // การส่งภาพผ่าน API ไม่สำเร็จ เกิดข้อผิดพลาด
      print('Error uploading image: $e');

      // ใส่โค้ดเพิ่มเติมตามความต้องการ เช่น การจัดการข้อผิดพลาด
    }
  }

  Future<void> _uploadImagenewPSQI1(File image) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(AppRoute.ipaddress + '/image1'),
      );
      request.files.add(
        await http.MultipartFile.fromPath('image', image.path),
      );
      var response = await request.send();

      if (response.statusCode == 200) {
        // การส่งภาพผ่าน API สำเร็จ
        print('Upload successful');
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
        // ใส่โค้ดเพิ่มเติมตามความต้องการ เช่น การอ่านข้อมูลที่เซิร์ฟเวอร์ส่งกลับมา
      } else {
        // การส่งภาพผ่าน API ไม่สำเร็จ
        print('Upload failed with status code: ${response.statusCode}');

        // ใส่โค้ดเพิ่มเติมตามความต้องการ เช่น การจัดการข้อผิดพลาด
      }
    } catch (e) {
      // การส่งภาพผ่าน API ไม่สำเร็จ เกิดข้อผิดพลาด
      print('Error uploading image: $e');

      // ใส่โค้ดเพิ่มเติมตามความต้องการ เช่น การจัดการข้อผิดพลาด
    }
  }

  Future<void> _uploadImagenewPSQI2(File image) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(AppRoute.ipaddress + '/image2'),
      );
      request.files.add(
        await http.MultipartFile.fromPath('image', image.path),
      );
      var response = await request.send();

      if (response.statusCode == 200) {
        // การส่งภาพผ่าน API สำเร็จ
        print('Upload successful');
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
        // ใส่โค้ดเพิ่มเติมตามความต้องการ เช่น การอ่านข้อมูลที่เซิร์ฟเวอร์ส่งกลับมา
      } else {
        // การส่งภาพผ่าน API ไม่สำเร็จ
        print('Upload failed with status code: ${response.statusCode}');

        // ใส่โค้ดเพิ่มเติมตามความต้องการ เช่น การจัดการข้อผิดพลาด
      }
    } catch (e) {
      // การส่งภาพผ่าน API ไม่สำเร็จ เกิดข้อผิดพลาด
      print('Error uploading image: $e');

      // ใส่โค้ดเพิ่มเติมตามความต้องการ เช่น การจัดการข้อผิดพลาด
    }
  }

  listPSQI() {
    return [
      Column(
        children: [
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
          Container(alignment: Alignment.centerLeft,
            child: Text('5A. นอนไม่หลับหลังจากเข้านอนไปแล้วนานกว่า 30 นาที',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
            )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(' : ${fa.toString()} คะแนน',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
                )),),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(' : ${fb.toString()} คะแนน',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
                )),),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(' : ${fc.toString()} คะแนน',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
                )),),
              Container(
                width: 80,
                child: TextField(
                  controller: e5c,
                  decoration: InputDecoration(labelText: 'แก้ไข', labelStyle: TextStyle(color: Colors.black), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
                  ),),),],),
          IconButton(
            icon: SizedBox(
              width: 50,
              height: 50,
              child: Image.asset('assets/img_8.png'),
            ),
            onPressed:
            _getFromCamera1,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text('5D. หายใจไม่สะดวก',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
            )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(' : ${fd.toString()} คะแนน',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
                )),),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(' : ${fe.toString()} คะแนน',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
                )),),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(' : ${ff.toString()} คะแนน',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
                )),),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(' : ${fg.toString()} คะแนน',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
                )),),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(' : ${fh.toString()} คะแนน',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
                )),),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(' : ${fi.toString()} คะแนน',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
                )),),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(' : ${fj.toString()} คะแนน',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
                )),),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(' : ${si.toString()} คะแนน',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
                )),),
              Container(
                width: 80,
                child: TextField(
                  controller: e6,
                  decoration: InputDecoration(labelText: 'แก้ไข', labelStyle: TextStyle(color: Colors.black), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
                  ),),),],),
          IconButton(
            icon: SizedBox(
              width: 50,
              height: 50,
              child: Image.asset('assets/img_8.png'),
            ),
            onPressed:
            _getFromCamera2,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text('7. ในระยะเวลา 1 เดือนที่ผ่านมา ท่านใช้ยาเพื่อช่วยในการนอนหลับบ่อยเพียงใด',style: TextStyle(fontFamily: "Kanit", color: Colors.black,
            )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(' : ${se.toString()} คะแนน',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
                )),),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(' : ${e.toString()} คะแนน',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
                )),),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(' : ${n.toString()} คะแนน',style: TextStyle(fontFamily: "Kanit", color: Colors.black,fontWeight: FontWeight.bold,
                )),),
              Container(
                width: 80,
                child: TextField(
                  controller: e9,
                  decoration: InputDecoration(labelText: 'แก้ไข', labelStyle: TextStyle(color: Colors.black), border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 5.0), // ปรับขนาด contentPadding เพื่อทำให้ TextField เล็กลง
                  ),),),],),
          IconButton(
            icon: SizedBox(
              width: 50,
              height: 50,
              child: Image.asset('assets/img_8.png'),
            ),
            onPressed:
            _getFromCamera3,
          ),
          Center(
            child: ElevatedButton(
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
                _postDataPSQI();
                _handHome(context);
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
              child: Text("ยืนยัน"),
            ),
          ),
        ],
      )
    ];
  }
  Future<void> _postDataPSQI() async {
    // ข้อมูลที่จะโพสต์ไปยัง API
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
    } else {
      print('Failed to post data. Status code: ${response.statusCode}');
    }
  }
}

void _handHome(BuildContext context) {
  Navigator.pushNamed(context, AppRoute.Home);
}