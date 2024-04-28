import 'package:flutter/material.dart';

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
        title: Text("Homedata"),
      ),
      body: Center(
        child: Text("1123456789"),
      ),
    );
  }
}

