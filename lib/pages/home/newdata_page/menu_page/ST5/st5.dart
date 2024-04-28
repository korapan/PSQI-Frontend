import 'package:flutter/material.dart';

class st5 extends StatefulWidget {
  const st5({Key? key}) : super(key: key);

  @override
  State<st5> createState() => _st5State();
}

class _st5State extends State<st5> {
  @override
  List<int> myArray = List<int>.filled(5, 0);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("แบบประเมินความเครียด"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              //Color.fromARGB(255, 49, 250, 170),
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 26, 161, 210)
            ],
          ),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            child: Container(
              padding: const EdgeInsets.all(30),
              //height: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("ประเมินโดยให้คะแนน 0-3", style: TextStyle(fontSize: 20)),
                Row(children: [Text("")]),
                Row(children: [Text("คะแนน 0 หมายถึง แทบไม่มี")]),
                Row(children: [Text("คะแนน 1 หมายถึง เป็นบางครัง")]),
                Row(children: [Text("คะแนน 2 หมายถึง บ่อยครั้ง")]),
                Row(children: [Text("คะแนน 3 หมายถึง เป็นประจำ")]),
                  Row(children: [Text("")]),
                  Row(children: [Text("ข้อที่ 1 มีปัญหาการนอน นอนไม่หลับหรือนอนมาก")]),
                  Row(
                    children: [
                      IconButton(
                        onPressed: _oneclickadd,
                        icon: Icon(Icons.add),
                      ),
                      Text(" ${myArray[0]} คะแนน "),
                      IconButton(
                        onPressed: _oneclickremove,
                        icon: Icon(Icons.remove),
                      )
                    ],
                  ),
                  Row(children: [Text("ข้อที่ 2 มีสมาธิน้อยลง")]),
                  Row(
                    children: [
                      IconButton(
                        onPressed: _twoclickadd,
                        icon: Icon(Icons.add),
                      ),
                      Text(" ${myArray[1]} คะแนน "),
                      IconButton(
                        onPressed: _twoclickremove,
                        icon: Icon(Icons.remove),
                      ),
                    ],
                  ),
                  Row(children: [Text("ข้อที่ 3 หงุดหงิด/กระวนกระวาย/ว้าวุ่นใจ")]),
                  Row(
                    children: [
                      IconButton(
                        onPressed: _threeclickadd,
                        icon: Icon(Icons.add),
                      ),
                      Text(" ${myArray[2]} คะแนน "),
                      IconButton(
                        onPressed: _threeclickremove,
                        icon: Icon(Icons.remove),
                      )
                    ],
                  ),
                  Row(children: [Text("ข้อที่ 4 รู้สึกเบื่อ เซ็ง")]),
                  Row(
                    children: [
                      IconButton(
                        onPressed: _fourclickadd,
                        icon: Icon(Icons.add),
                      ),
                      Text(" ${myArray[3]} คะแนน "),
                      IconButton(
                        onPressed: _fourclickremove,
                        icon: Icon(Icons.remove),
                      )
                    ],
                  ),
                  Row(children: [Text("ข้อที่ 5 ไม่อยากพบปะผู้คน")]),
                  Row(
                    children: [
                      IconButton(
                        onPressed: _fiveclickadd,
                        icon: Icon(Icons.add),
                      ),
                      Text(" ${myArray[4]} คะแนน "),
                      IconButton(
                        onPressed: _fiveclickremove,
                        icon: Icon(Icons.remove),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: _succes,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), // กำหนดสีพื้นหลังเมื่อปุ่มอยู่ในสถานะปกติ
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // กำหนดสีของตัวอักษรเมื่อปุ่มอยู่ในสถานะปกติ
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

  void _oneclickadd() {
    setState(() {
      myArray[0] += 1;
    });
  }
  void _oneclickremove() {
    setState(() {
      myArray[0] -= 1;
    });
  }
  void _twoclickadd() {
    setState(() {
      myArray[1] = myArray[1] + 1;
    });
  }
  void _twoclickremove() {
    setState(() {
      myArray[1] += 1;
    });
  }
  void _threeclickadd() {
    setState(() {
      myArray[2] += 1;
    });
  }
  void _threeclickremove() {
    setState(() {
      myArray[2] -= 1;
    });
  }
  void _fourclickadd() {
    setState(() {
      myArray[3] += 1;
    });
  }
  void _fourclickremove() {
    setState(() {
      myArray[3] -= 1;
    });
  }
  void _fiveclickadd() {
    setState(() {
      myArray[4] += 1;
    });
  }
  void _fiveclickremove() {
    setState(() {
      myArray[4] -= 1;
    });
  }
  void _succes() {
  }
}
