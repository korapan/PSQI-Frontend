import 'dart:js';

import 'package:flutter/material.dart';
import 'package:projectmobile/pages/home/data_page/data.dart';
import 'package:projectmobile/pages/home/data_page/second_page/datageneral.dart';
import 'package:projectmobile/pages/home/data_page/second_page/fileout.dart';
import 'package:projectmobile/pages/home/data_page/second_page/seemPSQI.dart';
import 'package:projectmobile/pages/home/data_page/second_page/seemSASSV.dart';
import 'package:projectmobile/pages/home/data_page/second_page/seemST5.dart';
import 'package:projectmobile/pages/home/inputdata_page/inputdata.dart';
import 'package:projectmobile/pages/home/newdata_page/indata.dart';
import 'package:projectmobile/pages/home/newdata_page/menu_page/PSQI/psqi.dart';
import 'package:projectmobile/pages/home/newdata_page/menu_page/SASSV/sassv.dart';
import 'package:projectmobile/pages/home/newdata_page/menu_page/ST5/st5.dart';

import '../home/data_page/second_page/edit_page.dart';
import '../home/home_page.dart';



class AppRoute {
  static const scan = 'scan';
  static const inputdata = 'inputdata';
  static const data = 'data';
  static const ST5 = 'ST5';
  static const SASSV = 'SASSV';
  static const PSQI = 'PSQI';
  static const Home = 'Home';

  static const general = 'general';
  static const showST5 = 'backupST5';
  static const showSASSV = 'backupSASSV';
  static const showPSQI = 'backupPSQI';
  static const edit = 'edit';

  static const foroutfile = 'out';

  static get all =>
      <String, WidgetBuilder>{
        foroutfile: (context) => const fileOut(),

        general: (context) => const Datageneral(),
        showST5: (context) => const seemST5(),
        showSASSV: (context) => const seemSASSV(),
        showPSQI: (context) => const seemPSQI(),
        edit: (context) => const Editor(),

        Home: (context) => const Homepage(),
        scan: (context) => const homescan(),
        inputdata: (context) => const homeinput(),
        //inputdata: (context) =>  ExcelReader(),
        data: (context) => const homedata(),
        ST5: (context) => const st5(),
        SASSV: (context) => const sassv(),
        PSQI: (context) => const psqi(),
      };
}