import 'package:flutter/material.dart';

class homeinput extends StatefulWidget {
  const homeinput({Key? key}) : super(key: key);

  @override
  State<homeinput> createState() => _homeinputState();
}

class _homeinputState extends State<homeinput> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homeinputdata"),
      ),
      body: Center(
        child: Text("1123456789"),
      ),
    );
  }
}
