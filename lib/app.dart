import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projectmobile/login.dart';
import 'package:projectmobile/pages/home/home_page.dart';
import 'package:projectmobile/pages/log/routes.dart';





class ISMyApp extends StatelessWidget {
  const ISMyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PSQI APP",
      routes: AppRoute.all,
      home: Homepage(),
      //home: Login_page(),
    );
  }
}