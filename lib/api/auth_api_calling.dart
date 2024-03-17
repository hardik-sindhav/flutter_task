import 'dart:convert';
import 'package:flutter_task/model/sign_up_model.dart';
import 'package:http/http.dart' as http;

class AuthApiCalling {
  final String baseUrl = 'https://shareittofriends.com/demo/flutter';

  Future signUp(SignUpModel signUpModel) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/Register.php'),
        body: {
          'name': signUpModel.name,
          'email': signUpModel.email,
          'mobile': signUpModel.mobile,
          'password': signUpModel.password,
        },
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        var data = json.decode(response.body);
        return data;
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future signIn({required String email, required String password}) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/Login.php'),
        body: {
          'email': email,
          'password': password,
        },
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        var data = json.decode(response.body);
        return data;
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
