import 'package:flutter/material.dart';
import 'package:projectmobile/pages/log/routes.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class homedata extends StatefulWidget {
  const homedata({Key? key}) : super(key: key);

  @override
  State<homedata> createState() => _homedataState();
}

class _homedataState extends State<homedata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Effect of sleep quality",
          style: TextStyle(
            fontFamily: 'Kanit',
            fontSize: 21, // ขนาดตัวอักษรตามที่ต้องการ
            color: Colors.black,
            fontWeight: FontWeight.bold, // สีตัวอักษรตามที่ต้องการ
            // คุณยังสามารถกำหนดคุณสมบัติอื่นๆ ของ TextStyle ตามต้องการ
          ),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home), // ไอคอนของปุ่ม
            onPressed: () {
              _handHome(context);
            },
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: () {
                          _General(context);
                        },
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all<Size>(Size(
                              150, 150)),
                          // กำหนดขนาดของปุ่ม
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 252, 182, 120)),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Colors.white),
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  7.0), // กำหนดความโค้งของมุม
                            ),
                          ),
                          elevation: MaterialStateProperty.all<double>(
                              20), // กำหนดความสูงของเงา
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("ข้อมูลพื้นฐาน", style: TextStyle(
                            fontFamily: 'Kanit',
                            fontSize: 21, // ขนาดตัวอักษรตามที่ต้องการ
                            color: Colors.black,
                            fontWeight: FontWeight
                                .bold, // สีตัวอักษรตามที่ต้องการ
                            // คุณยังสามารถกำหนดคุณสมบัติอื่นๆ ของ TextStyle ตามต้องการ
                          ),),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: () {
                          _seemdt5(context);
                        },
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all<Size>(Size(
                              150, 150)),
                          // กำหนดขนาดของปุ่ม
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 248, 152, 66)),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Colors.white),
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  7.0), // กำหนดความโค้งของมุม
                            ),
                          ),
                          elevation: MaterialStateProperty.all<double>(
                              20), // กำหนดความสูงของเงา
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("ข้อมูลความเครียด", style: TextStyle(
                            fontFamily: 'Kanit',
                            fontSize: 21, // ขนาดตัวอักษรตามที่ต้องการ
                            color: Colors.black,
                            fontWeight: FontWeight
                                .bold, // สีตัวอักษรตามที่ต้องการ
                            // คุณยังสามารถกำหนดคุณสมบัติอื่นๆ ของ TextStyle ตามต้องการ
                          ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: () {
                          _seemsassv(context);
                        },
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all<Size>(Size(
                              150, 150)),
                          // กำหนดขนาดของปุ่ม
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 244, 125, 31)),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Colors.white),
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  7.0), // กำหนดความโค้งของมุม
                            ),
                          ),
                          elevation: MaterialStateProperty.all<double>(
                              20), // กำหนดความสูงของเงา
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("ข้อมูลการติดสมาร์ทโฟน", style: TextStyle(
                            fontFamily: 'Kanit',
                            fontSize: 21, // ขนาดตัวอักษรตามที่ต้องการ
                            color: Colors.black,
                            fontWeight: FontWeight
                                .bold, // สีตัวอักษรตามที่ต้องการ
                            // คุณยังสามารถกำหนดคุณสมบัติอื่นๆ ของ TextStyle ตามต้องการ
                          ),),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: () {
                          _seempsqi(context);
                        },
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all<Size>(Size(
                              150, 150)),
                          // กำหนดขนาดของปุ่ม
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 238, 108, 33)),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Colors.white),
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  7.0), // กำหนดความโค้งของมุม
                            ),
                          ),
                          elevation: MaterialStateProperty.all<double>(
                              20), // กำหนดความสูงของเงา
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("ข้อมูลคุณภาพการนอนหลับ",
                            style: TextStyle(
                              fontFamily: 'Kanit',
                              fontSize: 21, // ขนาดตัวอักษรตามที่ต้องการ
                              color: Colors.black,
                              fontWeight: FontWeight
                                  .bold, // สีตัวอักษรตามที่ต้องการ
                              // คุณยังสามารถกำหนดคุณสมบัติอื่นๆ ของ TextStyle ตามต้องการ
                            ),),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _editer(context);
                    },
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all<Size>(
                        Size(
                          MediaQuery
                              .of(context)
                              .size
                              .width,
                          170,
                        ),),
                      // กำหนดขนาดของปุ่ม
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 243, 136, 30)),
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              7.0), // กำหนดความโค้งของมุม
                        ),
                      ),
                      elevation: MaterialStateProperty.all<double>(
                          20), // กำหนดความสูงของเงา
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "ค้นหา และ ลบ  ", style: TextStyle(
                        fontFamily: 'Kanit',
                        fontSize: 21, // ขนาดตัวอักษรตามที่ต้องการ
                        color: Colors.black,
                        fontWeight: FontWeight.bold, // สีตัวอักษรตามที่ต้องการ
                        // คุณยังสามารถกำหนดคุณสมบัติอื่นๆ ของ TextStyle ตามต้องการ
                      ),),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _foroutfile(context);
                    },
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all<Size>(
                        Size(
                          MediaQuery
                              .of(context)
                              .size
                              .width,
                          170,
                        ),),
                      // กำหนดขนาดของปุ่ม
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 243, 136, 30)),
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              7.0), // กำหนดความโค้งของมุม
                        ),
                      ),
                      elevation: MaterialStateProperty.all<double>(
                          20), // กำหนดความสูงของเงา
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(".xlsx", style: TextStyle(
                        fontFamily: 'Kanit',
                        fontSize: 21, // ขนาดตัวอักษรตามที่ต้องการ
                        color: Colors.black,
                        fontWeight: FontWeight.bold, // สีตัวอักษรตามที่ต้องการ
                        // คุณยังสามารถกำหนดคุณสมบัติอื่นๆ ของ TextStyle ตามต้องการ
                      ),),
                    ),
                  ),
                ),
              ],
            ),
          )
          ,
        )
        ,
      )
      ,
    );
  }

  void _seemdt5(BuildContext context) {
    Navigator.pushNamed(context, AppRoute.showST5);
  }

  void _foroutfile(BuildContext context) {
    Navigator.pushNamed(context, AppRoute.foroutfile);
  }

  void _General(BuildContext context) {
    Navigator.pushNamed(context, AppRoute.general);
  }

  void _handHome(BuildContext context) {
    Navigator.pushNamed(context, AppRoute.Home);
  }

  void _seemsassv(BuildContext context) {
    Navigator.pushNamed(context, AppRoute.showSASSV);
  }

  void _seempsqi(BuildContext context) {
    Navigator.pushNamed(context, AppRoute.showPSQI);
  }

  void _editer(BuildContext context) {
    Navigator.pushNamed(context, AppRoute.edit);
  }
}

