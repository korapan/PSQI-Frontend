/*import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> postData() async {
  // ข้อมูลที่จะโพสต์ไปยัง API
  Map<String, dynamic> data = {
    "name": "john",
    // "age": 30,
    // "weight": 60.5,
    "height": 150
  };

  // แปลงข้อมูลเป็น JSON
  String jsonData = jsonEncode(data);

  // URL ของ API ที่ต้องการโพสต์ข้อมูลไป
  String apiUrl = 'http://127.0.0.1:5000/receive-data';

  // สร้างคำขอโพสต์
  http.Response response = await http.post(
    Uri.parse(apiUrl),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonData,
  );

  // ตรวจสอบสถานะการตอบกลับจาก API
  if (response.statusCode == 200) {
    print('Post successful!');
    print('Response: ${response.body}');
  } else {
    print('Failed to post data. Status code: ${response.statusCode}');
  }
}*/


//
// import 'package:projectmobile/pages/home/home_page.dart';
//
// abstract class _HomeState extends State<Homepage> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     fetchData();
//   }
//
//   Future<Map<String, dynamic>> fetchData() async {
//     final response = await http.get(
//         Uri.parse('http://127.0.0.1:5000/get_person'));
//     if (response.statusCode == 200) {
//       print(response.body);
//       //print("hello");
//       return jsonDecode(response.body);
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
// }