import 'package:flutter/material.dart';

import 'Auth/ForgotPassword.dart';
import 'Auth/LoginScreen.dart';
import 'Auth/RegisterScreen.dart';
import 'HomeScreen.dart';
import 'SplashScreen.dart';
import 'package:flutter/services.dart';

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
      home:
          //  FlightScreen(),
          //HomeScreen(),

          SplashScreen(),
      // HotelsScreen()
      // home: SplashScreen(),
    );
  }
}
