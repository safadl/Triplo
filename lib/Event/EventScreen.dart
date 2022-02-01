import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import '../CustomDrawer.dart';
import 'Event.dart';
// import 'appBar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const green_color = const Color(0xff64c7d0);
const dark_color = const Color(0xff232323);

class EventScreen extends StatefulWidget {
  final String city;
  EventScreen(this.city);
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  var eventItems = [];
  @override
  void initState() {
    super.initState();
    this.getJSONData();
  }

  Future<void> getJSONData() async {
    var url = Uri.parse("http://192.168.1.17:8000/api/events/getAll");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      this.setState(() {
        eventItems = jsonResponse;
      });

      print('items got: ' + this.eventItems[0]['cityName']);
    } else {
      print("Request failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        drawer: CustomDrawer(),
        resizeToAvoidBottomInset: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            backgroundColor: green_color,
            centerTitle: true,
            title: Text("Events"),
            bottom: const TabBar(tabs: [
              Tab(text: "Theatre"),
              Tab(text: "Concerts"),
            ])),
        body: TabBarView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // decoration: BoxDecoration(color: Colors.red),
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: eventItems.length,
                    itemBuilder: (context, index) {
                      // scrollDirection: Axis.horizontal,
                      return (this.widget.city.toLowerCase() ==
                                  eventItems[index]['cityName'].toLowerCase() &&
                              eventItems[index]['category'].toLowerCase() ==
                                  'theatre')
                          ? Event(
                              title: eventItems[index]['eventName'],
                              image: eventItems[index]['eventImage'],
                              location: eventItems[index]['locationEvent'],
                              rating: eventItems[index]['rating'] == null
                                  ? 0.0
                                  : eventItems[index]['rating'].toDouble(),
                              description: eventItems[index]
                                  ['eventDescription'],
                              geo: eventItems[index]['geo'],
                              cityName: eventItems[index]['cityName'],
                              category: eventItems[index]['category'])
                          : Container();
                    }),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // decoration: BoxDecoration(color: Colors.red),
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: eventItems.length,
                    itemBuilder: (context, index) {
                      // scrollDirection: Axis.horizontal,
                      return (this.widget.city.toLowerCase() ==
                                  eventItems[index]['cityName'].toLowerCase() &&
                              eventItems[index]['category'].toLowerCase() ==
                                  'concerts')
                          ? Event(
                              title: eventItems[index]['eventName'],
                              description: eventItems[index]
                                  ['eventDescription'],
                              location: eventItems[index]['locationEvent'],
                              geo: eventItems[index]['geo'],
                              image: eventItems[index]['eventImage'],
                              rating: eventItems[index]['rating'] == null
                                  ? 0.0
                                  : eventItems[index]['rating'].toDouble(),
                              cityName: eventItems[index]['cityName'],
                            )
                          : Container();
                    }),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
