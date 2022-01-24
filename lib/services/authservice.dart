import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class AuthService {
  var url = Uri.parse('http://192.168.1.17:8000/api/auth/signup');
  var urlLogin = Uri.parse('http://192.168.1.17:8000/api/auth/signin');
  register(name, password, email) async {
    var response = await http.post(url, headers: {
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    }, body: {
      'username': name,
      'password': password,
      'email': email
    }).then((response) => {
          if (response.statusCode == 200)
            {
              Fluttertoast.showToast(
                  msg: 'User registered!!',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0)
            }
          else
            {
              Fluttertoast.showToast(
                  msg: 'Unable to resigter user',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  textColor: Colors.white,
                  fontSize: 16.0)
            }
        });
  }

  Future<bool> login(name, password) async {
    bool test = false;
    await http.post(urlLogin, headers: {
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    }, body: {
      'username': name,
      'password': password,
    }).then((response) => {
          if (response.statusCode == 404)
            {
              Fluttertoast.showToast(
                  msg: 'User not found',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0)
            }
          else if (response.statusCode == 401)
            {
              Fluttertoast.showToast(
                  msg: 'Password incorrect',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  textColor: Colors.white,
                  fontSize: 16.0)
            }
          else if (response.statusCode == 200)
            {
              Fluttertoast.showToast(
                  msg: 'User found!',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  textColor: Colors.white,
                  fontSize: 16.0),
              test = true
            }
        });
    return test;
  }
}
