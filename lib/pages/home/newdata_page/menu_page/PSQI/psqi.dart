import 'package:flutter/material.dart';

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
        title: Text("Homedata"),
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
}
