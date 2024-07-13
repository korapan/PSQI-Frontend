
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:projectmobile/login.dart';
import 'package:projectmobile/pages/home/data_page/data.dart';
import 'package:projectmobile/pages/home/data_page/second_page/datageneral.dart';
import 'package:projectmobile/pages/home/data_page/second_page/edit/editPSQI.dart';
import 'package:projectmobile/pages/home/data_page/second_page/edit/editSASSV.dart';
import 'package:projectmobile/pages/home/data_page/second_page/edit/editST5.dart';
import 'package:projectmobile/pages/home/data_page/second_page/fileout.dart';
import 'package:projectmobile/pages/home/data_page/second_page/seemPSQI.dart';
import 'package:projectmobile/pages/home/data_page/second_page/seemSASSV.dart';
import 'package:projectmobile/pages/home/data_page/second_page/seemST5.dart';
import 'package:projectmobile/pages/home/home_page1.dart';
import 'package:projectmobile/pages/home/inputdata_page/inputdata.dart';
import 'package:projectmobile/pages/home/newdata_page/indata.dart';
import 'package:projectmobile/pages/home/newdata_page/menu_page/PSQI/Testcamera.dart';
import 'package:projectmobile/pages/home/newdata_page/menu_page/PSQI/Testcamera.dart';
import 'package:projectmobile/pages/home/newdata_page/menu_page/PSQI/psqi.dart';
import 'package:projectmobile/pages/home/newdata_page/menu_page/PSQI/testcameraagain.dart';
import 'package:projectmobile/pages/home/newdata_page/menu_page/SASSV/sassv.dart';
import 'package:projectmobile/pages/home/newdata_page/menu_page/ST5/st5.dart';
import 'package:projectmobile/pages/home/otheredit/otheredit.dart';

import '../home/data_page/second_page/edit/edit_page.dart';
import '../home/home_page.dart';

class AppRoute {
  static const ipaddress = 'http://192.168.0.137:5000';
  static const scan = 'scan';
  static const inputdata = 'inputdata';
  static const data = 'data';
  static const ST5 = 'ST5';
  static const SASSV = 'SASSV';
  static const PSQI = 'PSQI';
  static const E_ST5 = 'E_ST5';
  static const E_SASSV = 'E_SASSV';
  static const E_PSQI = 'E_PSQI';
  static const Home = 'Home';
  static const cameraPage = 'CameraPage';

  static const general = 'general';
  static const showST5 = 'backupST5';
  static const showSASSV = 'backupSASSV';
  static const showPSQI = 'backupPSQI';
  static const edit = 'edit';

  static const foroutfile = 'out';

  static const log = 'log';
  static const drec = 'drec';
  static const newotheredit = 'newotheredit';
  static const againn = 'agintestcamera';

  static const home = 'homepage';
  static const home1 = 'homepage1';
  static get all =>
      <String, WidgetBuilder>{
        home: (context) => const Homepage(),
        home1: (context) => const Homepage1(),

        againn: (context) => const again(),
        newotheredit: (context) => const otheredit(),

        cameraPage: (context) =>  CameraPage(),
        foroutfile: (context) => const fileOut(),

        general: (context) => const Datageneral(),
        showST5: (context) => const seemST5(),
        showSASSV: (context) => const seemSASSV(),
        showPSQI: (context) => const seemPSQI(),
        edit: (context) => const Editor(),

        Home: (context) => const Homepage(),
        log: (context) => const Login_page(),
        scan: (context) => const homescan(),
        inputdata: (context) => const homeinput(),
        //inputdata: (context) =>  ExcelReader(),
        data: (context) => const homedata(),
        ST5: (context) => const st5(),
        SASSV: (context) => const sassv(),
        PSQI: (context) => const psqi(),
        E_ST5: (context) => const e_st5(),
        E_SASSV: (context) => const e_sassv(),
        E_PSQI: (context) => const e_psqi(),
      };
}