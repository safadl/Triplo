import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:travel_app/onBoarding_page.dart';

import 'Menu.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

const rose_color = const Color(0xffffebeb);
const purple_color = const Color(0xff838ac5);
const green_color = const Color(0xff64c7d0);
const pink_color = const Color(0xffffcece);
const dark_pink = const Color(0xfff2acac);

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    //change duration to 10 !
    Future.delayed(Duration(seconds: 10), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => onBoardingScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: rose_color),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 300,
                width: 300,
                child: Lottie.asset(
                  "assets/vacation_splash.json",
                )),
            SizedBox(height: 20),
            Text('Triplo',
                style: GoogleFonts.lobster(fontSize: 30, color: green_color)),
          ],
        ),
      ),
    );
  }
}
