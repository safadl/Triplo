import 'package:flutter/material.dart';

import 'ForgotPassword.dart';
import 'HomeScreen.dart';
import 'HotelDescription.dart';
import 'HotelsScreen.dart';
import 'RegisterScreen.dart';
import 'SplashScreen.dart';
import 'package:flutter/services.dart';

import 'LoginScreen.dart';
import 'Test.dart';

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
        'ForgotP': (context) => ForgotPasswordScreen(),
      },
      home: Test(),
      // HomeScreen(),
      // home: SplashScreen(),
    );
  }
}
