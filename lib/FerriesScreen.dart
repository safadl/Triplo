import 'package:flutter/material.dart';
import 'CustomDrawer.dart';
import 'package:date_field/date_field.dart';
import 'FerrieResult.dart';

// import 'appBar.dart';

const green_color = const Color(0xff64c7d0);
const dark_color = const Color(0xff232323);
var now = DateTime.now();

class FerriesScreen extends StatefulWidget {
  @override
  _FerriesScreenState createState() => _FerriesScreenState();
}

class _FerriesScreenState extends State<FerriesScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        drawer: CustomDrawer(),
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            backgroundColor: coral_color,
            centerTitle: true,
            title: Text("Ferries"),
            bottom: TabBar(tabs: [
              Tab(
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "One way",
                    style: TextStyle(color: coral_color),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "Roundtrip",
                    style: TextStyle(color: coral_color),
                  ),
                ),
              ),
            ])),
        body: Padding(
          padding: const EdgeInsets.only(top: 180.0, left: 30),
          child: TabBarView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'From',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      padding: EdgeInsets.only(top: 15),
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: TextField(
                        decoration: new InputDecoration(
                            hintText: 'Marseille, France',
                            filled: true,
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'To',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      padding: EdgeInsets.only(top: 15),
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: TextField(
                        decoration: new InputDecoration(
                            hintText: 'Milan, Italy',
                            filled: true,
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Departure',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      padding: EdgeInsets.only(top: 15),
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: DateTimeFormField(
                        initialValue: DateTime.now(),
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey),
                          errorStyle: TextStyle(color: Colors.redAccent),
                          border: InputBorder.none,
                          filled: true,
                          suffixIcon: Icon(Icons.event_note),
                        ),
                        mode: DateTimeFieldPickerMode.date,
                        autovalidateMode: AutovalidateMode.always,
                        validator: (e) => (e?.day ?? 0) == 1
                            ? 'Please not the first day'
                            : null,
                        onDateSelected: (DateTime value) {
                          print(value);
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Pasengers',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      padding: EdgeInsets.only(top: 15),
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                            hintText: '2 Passengers',
                            filled: true,
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Center(
                      child: Container(
                        width: 200,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(coral_color)),
                          onPressed: () {
                            // fetchFlight();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    FerrieResult(),
                              ),
                            );
                          },
                          child: Text('search ferries'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'From',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      padding: EdgeInsets.only(top: 15),
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: TextField(
                        decoration: new InputDecoration(
                            hintText: 'Tokyo, Japan',
                            filled: true,
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'To',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      padding: EdgeInsets.only(top: 15),
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: TextField(
                        decoration: new InputDecoration(
                            hintText: 'Milan, Italy',
                            filled: true,
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Departure',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  padding: EdgeInsets.only(top: 15),
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                  child: DateTimeFormField(
                                    initialValue: DateTime.now(),
                                    decoration: const InputDecoration(
                                      hintStyle: TextStyle(color: Colors.grey),
                                      errorStyle:
                                          TextStyle(color: Colors.redAccent),
                                      border: InputBorder.none,
                                      filled: true,
                                      suffixIcon: Icon(Icons.event_note),
                                    ),
                                    mode: DateTimeFieldPickerMode.date,
                                    autovalidateMode: AutovalidateMode.always,
                                    validator: (e) => (e?.day ?? 0) == 1
                                        ? 'Please not the first day'
                                        : null,
                                    onDateSelected: (DateTime value) {
                                      print(value);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Flexible(
                          fit: FlexFit.tight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'To',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  padding: EdgeInsets.only(top: 15),
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                  child: DateTimeFormField(
                                    initialValue: DateTime(
                                        now.year, now.month, now.day + 1),
                                    decoration: const InputDecoration(
                                      hintStyle: TextStyle(color: Colors.grey),
                                      errorStyle:
                                          TextStyle(color: Colors.redAccent),
                                      border: InputBorder.none,
                                      filled: true,
                                      suffixIcon: Icon(Icons.event_note),
                                    ),
                                    mode: DateTimeFieldPickerMode.date,
                                    autovalidateMode: AutovalidateMode.always,
                                    validator: (e) => (e?.day ?? 0) == 1
                                        ? 'Please not the first day'
                                        : null,
                                    onDateSelected: (DateTime value) {
                                      print(value);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Pasengers',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      padding: EdgeInsets.only(top: 15),
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                            hintText: '2 Passengers',
                            filled: true,
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Center(
                      child: Container(
                        width: 200,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(coral_color)),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    FerrieResult(),
                              ),
                            );
                          },
                          child: Text('search ferries'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
