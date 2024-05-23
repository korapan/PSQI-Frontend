import 'package:flutter/material.dart';
import 'package:projectmobile/pages/log/routes.dart';


class psqi extends StatefulWidget {
  const psqi({Key? key}) : super(key: key);

  @override
  State<psqi> createState() => _psqiState();
}

class _psqiState extends State<psqi> {
  @override
  //Future<void>choodeImage(ImageSource)async{

  //}

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Effect of sleep quality",
          style: TextStyle(
            fontFamily: 'Kanit',
            fontSize: 21, // ขนาดตัวอักษรตามที่ต้องการ
            color: Colors.black,
            fontWeight: FontWeight.bold,// สีตัวอักษรตามที่ต้องการ
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
      body: Center(
        child: Center(
          child:
            GestureDetector(
              onTap: () {
                //ImageSource;
                // ใส่โค้ดที่ต้องการให้ทำงานเมื่อคลิกที่ไอคอน
              },
              child: SizedBox(
                height: 100, // กำหนดความสูงของไอคอน
                width: 100, // กำหนดความกว้างของไอคอน
                child: Icon(
                  Icons.camera, // ใช้ไอคอนเป็นตัวแทน
                  size: 50, // กำหนดขนาดของไอคอน
                  color: Colors.blue, // กำหนดสีของไอคอน
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

  void _showSuccessSnackBar() {
    final snackBar = SnackBar(content: Text('บันทึกข้อมูลสำเร็จ'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

//_showSuccessSnackBar();
