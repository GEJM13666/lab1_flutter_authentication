import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/user_model.dart';
import '../variables.dart';

class AuthService {
  Future <void> login(String username, String password) async {
    print(apiURL);
    //ถ้ายิงแบบ post จำเป็นต้องกำหนด headers และ body  โดย headers เป็น applicaiton/json ส่วน body ใช้ jsonENcode
    final response = await http.post(Uri.parse("$apiURL/api/user/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(
        {"user_name": username, 
        "password": password}));
        print(response.statusCode);


        
  }
}
