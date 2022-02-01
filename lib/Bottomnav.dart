import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/HomeScreen.dart';
import 'package:travel_app/Profile.dart';
import 'package:travel_app/SettingsScreen.dart';

import 'CustomDrawer.dart';

class Bottomnav extends StatefulWidget {
  Bottomnav({Key key}) : super(key: key);

  @override
  _BottomnavState createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int indexpage = 1;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  var pages = [SettingScreen(), HomeScreen(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: pages[indexpage],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0x00ffffff),
        ),
        child: CurvedNavigationBar(
          index: 1,
          backgroundColor: Color(0x00ffffff),
          color: Color(0xff9f92e6),
          height: 50,
          items: <Widget>[
            Icon(Icons.settings, size: 30, color: Colors.black),
            Icon(Icons.home, size: 30, color: Colors.black),
            Icon(Icons.person, size: 30, color: Colors.black),
          ],
          onTap: (index) {
            setState(() {
              indexpage = index;
            });
          },
          letIndexChange: (index) => true,
        ),
      ),
    );
  }
}
