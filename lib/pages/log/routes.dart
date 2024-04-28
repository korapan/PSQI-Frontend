import 'package:flutter/material.dart';
import 'package:projectmobile/pages/home/data_page/data.dart';
import 'package:projectmobile/pages/home/inputdata_page/inputdata.dart';
import 'package:projectmobile/pages/home/newdata_page/indata.dart';
import 'package:projectmobile/pages/home/newdata_page/menu_page/PSQI/psqi.dart';
import 'package:projectmobile/pages/home/newdata_page/menu_page/SASSV/sassv.dart';
import 'package:projectmobile/pages/home/newdata_page/menu_page/ST5/st5.dart';



class AppRoute {
  static const scan = 'scan';
  static const inputdata = 'inputdata';
  static const data = 'data';
  static const ST5 = 'ST5';
  static const SASSV = 'SASSV';
  static const PSQI = 'PSQI';

  static get all =>
      <String, WidgetBuilder>{
        scan: (context) => const homescan(),
        inputdata: (context) => const homeinput(),
        data: (context) => const homedata(),
        ST5: (context) => const st5(),
        SASSV: (context) => const sassv(),
        PSQI: (context) => const psqi(),
      };
}