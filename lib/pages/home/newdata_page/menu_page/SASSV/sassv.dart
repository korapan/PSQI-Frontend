import 'package:flutter/material.dart';

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
        title: Text("การติดสมาร์ทโฟน"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
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
                    Text("ประเมินโดยให้คะแนน 1-6 คะแนน",
                        style: TextStyle(fontSize: 20)),
                    Row(children: [Text("")]),
                    Row(children: [Text("คะแนน 1 หมายถึง ไม่เห็นด้วยอย่างยิ่ง")]),
                    Row(children: [Text("คะแนน 2 หมายถึง ไม่เห็นด้วย")]),
                    Row(children: [Text("คะแนน 3 หมายถึง ไม่เห็นด้วยเล็กน้อย")]),
                    Row(children: [Text("คะแนน 4 หมายถึง เห็นด้วยเล็น้อย")]),
                    Row(children: [Text("คะแนน 5 หมายถึง เห็นด้วย")]),
                    Row(children: [Expanded(child: Text("คะแนน 6 หมายถึง เห็นด้วยอย่างยิ่ง"))]),
                    Row(children: [Text("")]),
                    Row(children: [Expanded(child: Text("ข้อที่ 1 ฉันใช้สมาร์ทโฟนจนไม่สามารถทำงานตามแผนที่กำหนดได้"))]),
                    Row(
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
                    Row(children: [Expanded(child: Text("ข้อที่ 2 ฉันไม่มีสมาธิในชั้นเรียน ในขณะที่ทำงานที่ได้รับมอบหมายหรือในขณะทีทำงานอื่นๆ เนื่องจากใช้สมาร์ทโฟน"))]),
                    Row(
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
                    Row(children: [Expanded(child: Text("ข้อที่ 3 รู้สึกปวดข้อมือหรือต้นคอในขณะที่ใช้สมาร์ทโฟน"))]),
                    Row(
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
                    Row(children: [Expanded(child: Text("ข้อที่ 4 ฉันรู้สึกทนไม่ได้ถ้าไม่มีสมาร์ทโฟน"))]),
                    Row(
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
                    Row(children: [Expanded(child: Text("ข้อที่ 5 ฉันรู้สึกหงุดหงิดกระวนกระวายถ้าไม้ได้ถือสมาร์ทโฟนอยู่ในมือ"))]),
                    Row(
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
                    Row(children: [Expanded(child: Text("ข้อที่ 6 ฉันจะนึกถึงสมาร์ทโฟนอยู่ตลอดเวลาถึงแม้ว่าจะไม่ได้ใช้มันอยู่ก็ตาม"))]),
                    Row(
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
                    Row(children: [Expanded(child: Text("ข้อที่ 7 ฉันไม่สามารถเลิกใช้สมาร์ทโฟนได้แม้ว่ามันจะมีผลกระทบกับชีวิตประจำวันของฉันอย่างมากมาย้"))]),
                    Row(
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
                    Row(children: [Expanded(child: Text("ข้อที่ 8 ฉันต้องเช็กข้อความในสมาร์ทโฟนตลอดเวลาเพื่อไม่ให้พลาดบทสนทนาระหว่างคนอื่นๆ บน Twitter หรือ Facebook"))]),
                    Row(
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
                    Row(children: [Expanded(child: Text("ข้อที่ 9 ฉันใช้สมาร์ทโฟนนานกว่าที่ตั้งใจไว้"))]),
                    Row(
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
                    Row(children: [Expanded(child: Text("ข้อที่ 10 คนรอบข้างบอกฉันว่าฉันใช้สมาร์ทโฟนมากเกินไป"))]),
                    Row(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                          onPressed: _suces,
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                            // กำหนดสีพื้นหลังเมื่อปุ่มอยู่ในสถานะปกติ
                            foregroundColor: MaterialStateProperty.all<Color>(Colors
                                .white), // กำหนดสีของตัวอักษรเมื่อปุ่มอยู่ในสถานะปกติ
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
      ),
    );
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

  void _iclickremove() {
    setState(() {
      mySASSV[8] += 1;
    });
  }

  void _iclickadd() {
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

  void _suces() {}
}
