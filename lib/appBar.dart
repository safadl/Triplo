import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'CustomDrawer.dart';

const green_color = const Color(0xff64c7d0);

// ignore: camel_case_types
class appBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      key: _scaffoldKey,
      body: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Center(
            child: Text('Hotels',
                style: GoogleFonts.aBeeZee(fontSize: 27, color: green_color)),
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (context) => IconButton(
            icon: new Icon(Icons.menu, color: green_color),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.person_outline, color: green_color),
              onPressed: () {}),
        ],
      ),
    );
  }
}
