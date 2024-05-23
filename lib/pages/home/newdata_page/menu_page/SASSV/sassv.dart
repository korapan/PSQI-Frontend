import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projectmobile/pages/log/routes.dart';
import 'package:projectmobile/pages/home/newdata_page/indata.dart';

class sassv extends StatefulWidget {
  const sassv({Key? key}) : super(key: key);

  @override
  State<sassv> createState() => _sassvState();
}

class _sassvState extends State<sassv> {
  @override
  List<int> mySASSV = List<int>.filled(10, 0);

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
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(30),
              //height: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                Text("Smartphone Addiction Scale Short Version: SAS-SV",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontFamily: 'Anton'
                ),
              ),
              Row(children: [
                Expanded(
                child: Text("แบบประเมินพฤติกรรมการติดโทรศัพท์มือถือสมาร์ทโฟนฉบับสั้น",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 243, 136, 30),
                        fontFamily: 'Kanit'))),]),
                Row(children: [Text("")]),
                Row(children: [
                  Text("คะแนน 1 หมายถึง ไม่เห็นด้วยอย่างยิ่ง",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Kanit",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ))
                ]),
                Row(children: [Text("คะแนน 2 หมายถึง ไม่เห็นด้วย",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Kanit",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ))]),
                Row(children: [
                  Text("คะแนน 3 หมายถึง ไม่เห็นด้วยเล็กน้อย",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Kanit",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ))
                ]),
                Row(children: [Text("คะแนน 4 หมายถึง เห็นด้วยเล็น้อย",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Kanit",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ))]),
                Row(children: [Text("คะแนน 5 หมายถึง เห็นด้วย",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Kanit",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ))]),
                Row(children: [
                  Expanded(child: Text("คะแนน 6 หมายถึง เห็นด้วยอย่างยิ่ง",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Kanit",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )))
                ]),
                Row(children: [Text("")]),
                Row(children: [
                  Expanded(
                      child: Text(
                          "ข้อที่ 1 ฉันใช้สมาร์ทโฟนจนไม่สามารถทำงานตามแผนที่กำหนดได้",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Kanit",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )))
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _aclickadd,
                      icon: Icon(Icons.add),
                    ),
                    Text(" ${mySASSV[0]} คะแนน "),
                    IconButton(
                      onPressed: _aclickremove,
                      icon: Icon(Icons.remove),
                    )
                  ],
                ),
                Row(children: [
                  Expanded(
                      child: Text(
                          "ข้อที่ 2 ฉันไม่มีสมาธิในชั้นเรียน ในขณะที่ทำงานที่ได้รับมอบหมายหรือในขณะทีทำงานอื่นๆ เนื่องจากใช้สมาร์ทโฟน",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Kanit",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )))
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _bclickadd,
                      icon: Icon(Icons.add),
                    ),
                    Text(" ${mySASSV[1]} คะแนน "),
                    IconButton(
                      onPressed: _bclickremove,
                      icon: Icon(Icons.remove),
                    )
                  ],
                ),
                Row(children: [
                  Expanded(
                      child: Text(
                          "ข้อที่ 3 รู้สึกปวดข้อมือหรือต้นคอในขณะที่ใช้สมาร์ทโฟน",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Kanit",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )))
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _cclickadd,
                      icon: Icon(Icons.add),
                    ),
                    Text(" ${mySASSV[2]} คะแนน "),
                    IconButton(
                      onPressed: _cclickremove,
                      icon: Icon(Icons.remove),
                    )
                  ],
                ),
                Row(children: [
                  Expanded(
                      child: Text(
                          "ข้อที่ 4 ฉันรู้สึกทนไม่ได้ถ้าไม่มีสมาร์ทโฟน",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Kanit",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )))
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _dclickadd,
                      icon: Icon(Icons.add),
                    ),
                    Text(" ${mySASSV[3]} คะแนน "),
                    IconButton(
                      onPressed: _dclickremove,
                      icon: Icon(Icons.remove),
                    )
                  ],
                ),
                Row(children: [
                  Expanded(
                      child: Text(
                          "ข้อที่ 5 ฉันรู้สึกหงุดหงิดกระวนกระวายถ้าไม้ได้ถือสมาร์ทโฟนอยู่ในมือ",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Kanit",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )))
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _eclickadd,
                      icon: Icon(Icons.add),
                    ),
                    Text(" ${mySASSV[4]} คะแนน "),
                    IconButton(
                      onPressed: _eclickremove,
                      icon: Icon(Icons.remove),
                    )
                  ],
                ),
                Row(children: [
                  Expanded(
                      child: Text(
                          "ข้อที่ 6 ฉันจะนึกถึงสมาร์ทโฟนอยู่ตลอดเวลาถึงแม้ว่าจะไม่ได้ใช้มันอยู่ก็ตาม",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Kanit",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )))
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _fclickadd,
                      icon: Icon(Icons.add),
                    ),
                    Text(" ${mySASSV[5]} คะแนน "),
                    IconButton(
                      onPressed: _fclickremove,
                      icon: Icon(Icons.remove),
                    )
                  ],
                ),
                Row(children: [
                  Expanded(
                      child: Text(
                          "ข้อที่ 7 ฉันไม่สามารถเลิกใช้สมาร์ทโฟนได้แม้ว่ามันจะมีผลกระทบกับชีวิตประจำวันของฉันอย่างมากมาย้",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Kanit",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )))
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _gclickadd,
                      icon: Icon(Icons.add),
                    ),
                    Text(" ${mySASSV[6]} คะแนน "),
                    IconButton(
                      onPressed: _gclickremove,
                      icon: Icon(Icons.remove),
                    )
                  ],
                ),
                Row(children: [
                  Expanded(
                      child: Text(
                          "ข้อที่ 8 ฉันต้องเช็กข้อความในสมาร์ทโฟนตลอดเวลาเพื่อไม่ให้พลาดบทสนทนาระหว่างคนอื่นๆ บน Twitter หรือ Facebook",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Kanit",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )))
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _hclickadd,
                      icon: Icon(Icons.add),
                    ),
                    Text(" ${mySASSV[7]} คะแนน "),
                    IconButton(
                      onPressed: _hclickremove,
                      icon: Icon(Icons.remove),
                    )
                  ],
                ),
                Row(children: [
                  Expanded(
                      child: Text(
                          "ข้อที่ 9 ฉันใช้สมาร์ทโฟนนานกว่าที่ตั้งใจไว้",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Kanit",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )))
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _iclickadd,
                      icon: Icon(Icons.add),
                    ),
                    Text(" ${mySASSV[8]} คะแนน "),
                    IconButton(
                      onPressed: _iclickremove,
                      icon: Icon(Icons.remove),
                    )
                  ],
                ),
                Row(children: [
                  Expanded(
                      child: Text(
                          "ข้อที่ 10 คนรอบข้างบอกฉันว่าฉันใช้สมาร์ทโฟนมากเกินไป",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Kanit",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )))
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _jclickadd,
                      icon: Icon(Icons.add),
                    ),
                    Text(" ${mySASSV[9]} คะแนน "),
                    IconButton(
                      onPressed: _jclickremove,
                      icon: Icon(Icons.remove),
                    )
                  ],
                ),
                  SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _postDataSASSV();
                        //_handback();
                        _PSQI();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Color.fromARGB(255, 243, 136, 30)),
                        // กำหนดสีพื้นหลังเมื่อปุ่มอยู่ในสถานะปกติ
                        foregroundColor: MaterialStateProperty.all<Color>(Colors
                            .white),
                        elevation: MaterialStateProperty.all<double>(20),// กำหนดสีของตัวอักษรเมื่อปุ่มอยู่ในสถานะปกติ
                      ),
                      child: Text("ยืนยัน"),
                    ),
                  ],
                ),
              ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _handHome() {
    Navigator.pushNamed(context, AppRoute.Home);
  }
  void _PSQI() {
    Navigator.pushNamed(context, AppRoute.PSQI);
  }

  void _aclickadd() {
    setState(() {
      mySASSV[0] += 1;
    });
  }

  void _aclickremove() {
    setState(() {
      mySASSV[0] -= 1;
    });
  }

  void _bclickadd() {
    setState(() {
      mySASSV[1] += 1;
    });
  }

  void _bclickremove() {
    setState(() {
      mySASSV[1] -= 1;
    });
  }

  void _cclickadd() {
    setState(() {
      mySASSV[2] += 1;
    });
  }

  void _cclickremove() {
    setState(() {
      mySASSV[2] -= 1;
    });
  }

  void _dclickadd() {
    setState(() {
      mySASSV[3] += 1;
    });
  }

  void _dclickremove() {
    setState(() {
      mySASSV[3] -= 1;
    });
  }

  void _eclickadd() {
    setState(() {
      mySASSV[4] += 1;
    });
  }

  void _eclickremove() {
    setState(() {
      mySASSV[4] -= 1;
    });
  }

  void _fclickadd() {
    setState(() {
      mySASSV[5] += 1;
    });
  }

  void _fclickremove() {
    setState(() {
      mySASSV[5] -= 1;
    });
  }

  void _gclickadd() {
    setState(() {
      mySASSV[6] += 1;
    });
  }

  void _gclickremove() {
    setState(() {
      mySASSV[6] -= 1;
    });
  }

  void _hclickadd() {
    setState(() {
      mySASSV[7] += 1;
    });
  }

  void _hclickremove() {
    setState(() {
      mySASSV[7] -= 1;
    });
  }

  void _iclickadd() {
    setState(() {
      mySASSV[8] += 1;
    });
  }

  void _iclickremove() {
    setState(() {
      mySASSV[8] -= 1;
    });
  }

  void _jclickadd() {
    setState(() {
      mySASSV[9] += 1;
    });
  }

  void _jclickremove() {
    setState(() {
      mySASSV[9] -= 1;
    });
  }

  void _handback() {
    Navigator.pushNamed(context, AppRoute.scan);
  }

  Future<void> _postDataSASSV() async {
    // ข้อมูลที่จะโพสต์ไปยัง API
    Map<String, dynamic> data = {
      "n1": mySASSV[0],
      "n2": mySASSV[1],
      "n3": mySASSV[2],
      "n4": mySASSV[3],
      "n5": mySASSV[4],
      "n6": mySASSV[5],
      "n7": mySASSV[6],
      "n8": mySASSV[7],
      "n9": mySASSV[8],
      "n10": mySASSV[9],
    };
    // แปลงข้อมูลเป็น JSON
    String jsonData = jsonEncode(data);
    // URL ของ API ที่ต้องการโพสต์ข้อมูลไป
    String apiUrl = 'http://127.0.0.1:5000//receive-dataSASSV';
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
