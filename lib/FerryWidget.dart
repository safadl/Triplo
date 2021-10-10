import 'package:flutter/material.dart';

const green_color = const Color(0xff64c7d0);
const coral_color = const Color(0xffff868f);

class FerryWidget extends StatefulWidget {
  final String departure;
  final String arrival;
  final String departureAir;
  final String arrivalAir;
  FerryWidget({
    this.departure,
    this.arrival,
    this.departureAir,
    this.arrivalAir,
  });

  @override
  _FerryWidgetState createState() => _FerryWidgetState();
}

class _FerryWidgetState extends State<FerryWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        decoration: BoxDecoration(
            color: Colors.grey[200].withOpacity(0.5),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      this.widget.departure,
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                    Text(
                      'Orly',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
                Icon(Icons.directions_boat_outlined,
                    size: 60, color: green_color.withOpacity(0.5)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      this.widget.arrival,
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                    Text(
                      'Newark',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(height: 1, color: green_color),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '245\$',
                    style: TextStyle(
                      fontSize: 30,
                      color: coral_color,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text('Select'),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(green_color)))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
