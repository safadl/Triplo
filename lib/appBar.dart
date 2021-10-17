import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'CustomDrawer.dart';

const green_color = const Color(0xff64c7d0);

// ignore: camel_case_types
class appBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color color;
  @override
  Size get preferredSize => const Size.fromHeight(50);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  appBar({this.title, this.color});
  Widget build(BuildContext context) {
    return AppBar(
      excludeHeaderSemantics: false,
      title: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Center(
          child: Text(this.title,
              style: GoogleFonts.aBeeZee(fontSize: 27, color: dark_color)),
        ),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      leading: Builder(
        builder: (context) => IconButton(
          icon: new Icon(Icons.menu, color: this.color),
          onPressed: () => Scaffold.of(context).openEndDrawer(),
          // Navigator.of(context).pop(),
        ),
      ),
      actions: [
        IconButton(
            icon: Icon(Icons.person_outline, color: this.color),
            onPressed: () {}),
      ],
    );
  }
}
