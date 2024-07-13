import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../log/routes.dart';

class homescan extends StatefulWidget {
  const homescan({Key? key}) : super(key: key);

  @override
  State<homescan> createState() => _homescanState();
}

class _homescanState extends State<homescan> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String x = '';
  String statusst5 = '';
  String statussassv = '';
  String statuspsqi = '';
  String recordA = '!non';
  String recordB = 'non';
  String recordC = 'non';
  String recordD = 'non';

  String? selectedGender;
  String? selectmajore;
  List<String> genders = ['ชาย', 'หญิง'];
  List<String> majore = [
    ' คณิตศาสตร์',
    'ชีววิทยา',
    'เคมี',
    'ฟิสิกส์',
    'สถิติ',
    'วิทยาศาสตร์สิ่งแวดล้อม',
    'วิทยาการคอมพิวเตอร์',
    'จุลชีววิทยา',
    'คณิตศาสตร์ประยุกต์',
    'เทคโนโลยีสารสนเทศ',
    'วิทยาการข้อมูล',
    'เคมีประยุกต์และจุลชีววิทยาอุตสาหกรรม',
    'เคมีผลิตภัณฑ์และธุรกิจเครื่องสำอาง'
  ];

  List<String> status = [
    'รหัส',
    'เพศ',
    'อายุ',
    'ชั้นปี',
    'สาขาวิชา',
    'จำนวนหน่วยกิจในเทอมการศึกษา',
    'จำนวนชั่วโมงเรียน'
  ];

  final ID = TextEditingController();
  String Sex = '';
  final Age = TextEditingController();
  final Year = TextEditingController();
  String Major = '';
  final CountOfLearn = TextEditingController();
  final Hours = TextEditingController();

  @override
  void dispose() {
    ID.dispose();
    //Sex.dispose();
    Age.dispose();
    Year.dispose();
    //Major.dispose();
    CountOfLearn.dispose();
    Hours.dispose();
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
              _handHome();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // กำหนดให้ Column จัดวางตามด้านบน
            crossAxisAlignment: CrossAxisAlignment.start,
            // จัดวาง children ใน Column ไปทางด้านซ้าย
            children: [
              Text(
                "A smartphone addiction assessment system on the effect of sleep quality",
                style: TextStyle(
                    fontSize: 30, color: Colors.black, fontFamily: 'Anton'),
              ),
              Text(
                "ประเมินความเครียด พฤติกรรมการติดโทรศัพท์มือถือสาร์ทโฟน และคุณภาพการนอนหลับ โดยแบบประเมินแบ่งออกเป็น 4 ส่วน",
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 128, 159, 90),
                  fontFamily: 'Anton',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: ID,
                  decoration: InputDecoration(
                    labelText: status[0],
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Column(
                children: [
                  Center(
                    child: Container(
                      child: IconButton(
                        icon: SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.asset('assets/img_2.png'),
                        ),
                        onPressed: () {
                          _postIDcheck();
                        },
                      ),
                    ),
                  ),
                  Text('ตรวจสอบข้อมูล'),
                  if (recordA == 'non') ...bulidText(),
                ],
              ),
              ...showx(),
              SizedBox(
                height: 10,
              ),
              ...authorbuid(),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.stretch,
              //   children: [
              //     ElevatedButton(
              //       onPressed: () {
              //         _handHome();
              //         _showSuccessSnackBar();
              //       },
              //       style: ButtonStyle(
              //         backgroundColor: MaterialStateProperty.all<Color>(
              //             Color.fromARGB(255, 243, 136, 30)),
              //         // กำหนดสีพื้นหลังเมื่อปุ่มอยู่ในสถานะปกติ
              //         foregroundColor:
              //             MaterialStateProperty.all<Color>(Colors.white),
              //         elevation: MaterialStateProperty.all<double>(
              //             20), // กำหนดสีของตัวอักษรเมื่อปุ่มอยู่ในสถานะปกติ
              //       ),
              //       child: Text("เสร็จสิ้น"),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void _handHome() {
    Navigator.pushNamed(context, AppRoute.Home);
  }

  bulidText() {
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: '',
            labelStyle: TextStyle(color: Colors.black),
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              hint: Text('เพศ'),
              value: selectedGender,
              onChanged: (newValue) {
                setState(() {
                  selectedGender = newValue!;
                });
                String AsString = newValue!; // ค่าที่เลือกมาแปลงเป็น String
                Sex = AsString;
              },
              items: genders.map((String gender) {
                return DropdownMenuItem<String>(
                  value: gender,
                  child: Text(gender),
                );
              }).toList(),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: Age,
          decoration: InputDecoration(
            labelText: status[2],
            labelStyle: TextStyle(color: Colors.black),
            border: OutlineInputBorder(),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: Year,
          decoration: InputDecoration(
            labelText: status[3],
            labelStyle: TextStyle(color: Colors.black),
            //filled: true,
            // กำหนดให้มีการเติมสีพื้นหลัง
            //fillColor: Colors.grey,
            border: OutlineInputBorder(),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: '',
            labelStyle: TextStyle(color: Colors.black),
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              hint: Text('สาขาวิชา'),
              value: selectmajore,
              onChanged: (newValue) {
                setState(() {
                  selectmajore = newValue!;
                });
                String sString = newValue!; // ค่าที่เลือกมาแปลงเป็น String
                Major = sString;
              },
              items: majore.map((String majore) {
                return DropdownMenuItem<String>(
                  value: majore,
                  child: Text(majore),
                );
              }).toList(),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: CountOfLearn,
          decoration: InputDecoration(
            labelText: status[5],
            labelStyle: TextStyle(color: Colors.black),
            border: OutlineInputBorder(),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: Hours,
          decoration: InputDecoration(
            labelText: status[6],
            labelStyle: TextStyle(color: Colors.black),
            border: OutlineInputBorder(),
          ),
        ),
      ),
      SizedBox(height: 20),
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                _postData();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 127, 97, 166)),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                elevation: MaterialStateProperty.all<double>(20),
              ),
              child: Text(
                "บันทึกข้อมูล",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Kanit',
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    ];
  }

  void _ST5() {
    Navigator.pushNamed(context, AppRoute.ST5);
  }

  void _SASSV() {
    Navigator.pushNamed(context, AppRoute.SASSV);
  }

  void _PSQI() {
    Navigator.pushNamed(context, AppRoute.PSQI);
  }

  void _test() {
    Navigator.pushNamed(context, AppRoute.cameraPage);
  }

  void _again() {
    Navigator.pushNamed(context, AppRoute.againn);
  }
  authorbuid() {
    return [
      OutlinedButton(
        onPressed: _ST5,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          // กำหนดให้พื้นหลังเป็นโปร่งใส
          foregroundColor: MaterialStateProperty.all<Color>(
              Colors.black), // กำหนดสีของตัวอักษรเมื่อปุ่มอยู่ในสถานะปกติ
          side: MaterialStateProperty.all<BorderSide>(
              BorderSide.none), // กำหนดให้ไม่มีเส้นขอบ
        ),
        child: Text(
          "แบบประเมินความเครียด (ST-5)",
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Kanit',
            color: Color.fromARGB(
                255, 128, 159, 90), // เปลี่ยนแบบอักษรตามที่ต้องการ
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(statusst5,
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'Kanit',
              color: Colors.black, // เปลี่ยนแบบอักษรตามที่ต้องการ
            ),
          ),
        ],
      ),
      SizedBox(height: 20),
      OutlinedButton(
        onPressed: _SASSV,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          // กำหนดให้พื้นหลังเป็นโปร่งใส
          foregroundColor: MaterialStateProperty.all<Color>(
              Colors.black), // กำหนดสีของตัวอักษรเมื่อปุ่มอยู่ในสถานะปกติ
          side: MaterialStateProperty.all<BorderSide>(
              BorderSide.none), // กำหนดให้ไม่มีเส้นขอบ
        ),
        child: Text(
          "แบบประเมินการติดสมาร์ทโฟน (SAS-SV)",
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Kanit',
            color: Color.fromARGB(255, 128, 159, 90),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(statussassv,
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'Kanit',
              color: Colors.black, // เปลี่ยนแบบอักษรตามที่ต้องการ
            ),
          ),
        ],
      ),
      SizedBox(height: 20),
      OutlinedButton(
        onPressed: _PSQI,
        //onPressed: _test,
        //onPressed: _again,

        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          // กำหนดให้พื้นหลังเป็นโปร่งใส
          foregroundColor: MaterialStateProperty.all<Color>(
              Colors.black), // กำหนดสีของตัวอักษรเมื่อปุ่มอยู่ในสถานะปกติ
          side: MaterialStateProperty.all<BorderSide>(
              BorderSide.none), // กำหนดให้ไม่มีเส้นขอบ
        ),
        child: Text(
          "แบบประเมินคุณภาพการนอนหลับ PSQI",
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Kanit',
            color: Color.fromARGB(255, 128, 159, 90),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(statuspsqi,
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'Kanit',
              color: Colors.black, // เปลี่ยนแบบอักษรตามที่ต้องการ
            ),
          ),
        ],
      ),
      SizedBox(height: 20),
    ];
  }

  Future<void> _postIDcheck() async {
    // ข้อมูลที่จะโพสต์ไปยัง API
    Map<String, dynamic> data = {
      "ID": ID.text,
    };
    String jsonData = jsonEncode(data);
    String apiUrl = AppRoute.ipaddress + '/receive';
    http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonData,
    );
    if (response.statusCode == 200) {
      setState(() {
        Map<String, dynamic> responseData = jsonDecode(response.body);
        recordA = responseData['recordA'];recordB = responseData['recordB'];recordC = responseData['recordC'];recordD = responseData['recordD'];
        if(recordB == '!non'){
          setState(() {
            statusst5 = 'สำเร็จ';
          });
        }else{statusst5 = '';}
        if(recordC == '!non'){
          setState(() {
            statussassv = 'สำเร็จ';
          });
        }else{statussassv = '';}
        if(recordD == '!non'){
        setState(() {
          statuspsqi = 'สำเร็จ';
          });
        }else{statuspsqi = '';}
      });
      print('Post successful!');
      // String responseBody = response.body;
      // print(responseBody);
    } else {
      setState(() {
        recordA = 'non';
        recordB = 'non';
        recordC = 'non';
        recordD = 'non';
      });
      print('Failed to post data. Status code: ${response.statusCode}');
    }
  }

  Future<void> _postData() async {
    // ข้อมูลที่จะโพสต์ไปยัง API
    Map<String, dynamic> data = {
      "ID": ID.text,
      "Sex": Sex,
      "ofAge": int.parse(Age.text),
      "year": int.parse(Year.text),
      "major": Major,
      "numoflearn": int.parse(CountOfLearn.text),
      "learnforweek": int.parse(Hours.text),
    };
    // แปลงข้อมูลเป็น JSON
    String jsonData = jsonEncode(data);
    // URL ของ API ที่ต้องการโพสต์ข้อมูลไป
    String apiUrl = AppRoute.ipaddress + '/receive-data';
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
      setState(() {
        x = 'บันทึกข้อมูลเรียบร้อย';
      });
      print('Post successful!');
      print('Response: ${response.body}');
    } else {
      setState(() {
        x = 'พบรหัสซ้ำกรุณาเปลี่ยนรหัสใหม่';
      });
      print('Failed to post data. Status code: ${response.statusCode}');
    }
  }

  void _showSuccessSnackBar() {
    final snackBar = SnackBar(content: Text('บันทึกข้อมูลสำเร็จ'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  showx() {
    return [
      Center(
          child: Text(x,
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Kanit',
              ))),
    ];
  }
}
