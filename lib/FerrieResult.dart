import 'package:flutter/material.dart';

import 'CustomDrawer.dart';
import 'FerryWidget.dart';

const green_color = const Color(0xff64c7d0);

class FerrieResult extends StatefulWidget {
  @override
  _FerrieResultState createState() => _FerrieResultState();
}

class _FerrieResultState extends State<FerrieResult> {
  List<FerryWidget> items = [
    FerryWidget(
        departure: "21:00",
        arrival: "22:00",
        departureAir: "Orly",
        arrivalAir: "JFK"),
    FerryWidget(
        departure: "20:00",
        arrival: "23:35",
        departureAir: "Orly",
        arrivalAir: "Newark"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(),
        resizeToAvoidBottomInset: false,
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: green_color,
          centerTitle: true,
          title: Text("Paris" + " To " + "NYC"),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return items[index];
          },
        ));
  }
}
