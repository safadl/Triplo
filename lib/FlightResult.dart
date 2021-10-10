import 'package:flutter/material.dart';

import 'CustomDrawer.dart';
import 'FlightWidget.dart';

const green_color = const Color(0xff64c7d0);

class FlightResult extends StatefulWidget {
  @override
  _FlightResultState createState() => _FlightResultState();
}

class _FlightResultState extends State<FlightResult> {
  @override
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
        body: Column(
          children: [
            FlightWidget(
                departure: "21:00",
                arrival: "22:00",
                departureAir: "Orly",
                arrivalAir: "JFK"),
            FlightWidget(
                departure: "20:00",
                arrival: "23:35",
                departureAir: "Orly",
                arrivalAir: "Newark"),
          ],
        ));
  }
}
