import 'package:flutter/material.dart';

const rose_color = const Color(0xffffebeb);
const purple_color = const Color(0xff838ac5);
const green_color = const Color(0xff64c7d0);
const pink_color = const Color(0xffffcece);
const coral_color = const Color(0xffff868f);
const dark_color = const Color(0xff232323);
const dark_pink = const Color(0xfff29d9d);

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 50,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Safa Deldoul',
                  style: TextStyle(
                    color: dark_color,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home_outlined, color: green_color),
            title: Text('Home'),
            onTap: () {
              // Navigator.of(context).pop();
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (BuildContext context) => NewPage("Page two")));
            },
          ),
          Container(
            child: ListTile(
              leading: Icon(Icons.location_on_outlined, color: green_color),
              title: Text('My trips'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.flight_outlined, color: green_color),
            title: Text('My tickets'),
          ),
          ListTile(
            leading: Icon(Icons.king_bed_outlined, color: green_color),
            title: Text('My booking'),
          ),
          ListTile(
            leading: Icon(Icons.explore_outlined, color: green_color),
            title: Text('Explore'),
          ),
          ListTile(
            leading: Icon(Icons.map_outlined, color: green_color),
            title: Text('Map'),
          ),
          ListTile(
            leading: Icon(Icons.settings, color: green_color),
            title: Text('Settings'),
          ),
          SizedBox(height: 180),
          ListTile(
            leading: Icon(Icons.logout, color: green_color),
            title: Text('Log Out'),
          ),
        ],
      ),
    ));
  }
}
