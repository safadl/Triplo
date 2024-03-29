import 'package:flutter/material.dart';

import '../CustomDrawer.dart';
import 'TrainWidget.dart';

const green_color = const Color(0xff64c7d0);

class TrainResult extends StatefulWidget {
  @override
  _TrainResultState createState() => _TrainResultState();
}

class _TrainResultState extends State<TrainResult> {
  List<TrainWidget> items = [
    TrainWidget(
        departure: "21:00",
        arrival: "22:00",
        departureAir: "Tokyo",
        arrivalAir: "Milan"),
    TrainWidget(
        departure: "20:00",
        arrival: "23:35",
        departureAir: "Tokyo",
        arrivalAir: "Milan"),
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
          title: Text("Tokyo" + " To " + "Milan"),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return items[index];
          },
        ));
  }
}
