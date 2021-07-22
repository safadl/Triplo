import 'package:flutter/material.dart';

import 'ForgotPassword.dart';
import 'RegisterScreen.dart';
import 'Myhomepage.dart';
import 'package:flutter/services.dart';

import 'LoginScreen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Triplo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'login': (context) => LoginScreen(),
        'Register': (context) => RegisterScreen(),
        'ForgotP': (context) => ForgotPasswordScreen()
      },
      // home: MyHomePage(),
      home: MyHomePage(),
    );
  }
}
