import 'package:flutter/material.dart';
import 'package:travel_app/Hotel/HotelDescription.dart';

import 'package:vertical_card_pager/vertical_card_pager.dart';

import 'EventDescription.dart';

const green_color = const Color(0xff64c7d0);
const coral_color = const Color(0xffff868f);

class Event extends StatefulWidget {
  final String image;
  final String title;
  final String location;
  final double rating;
  final String description;
  final String cityName;
  final String category;

  final geo;
  Event(
      {this.title,
      this.image,
      this.location,
      this.rating,
      this.description,
      this.geo,
      this.cityName,
      this.category});

  @override
  _EventState createState() => _EventState();
}

class _EventState extends State<Event> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 150,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => EventDescription(
                    this.widget.title,
                    this.widget.image,
                    this.widget.location,
                    this.widget.rating,
                    this.widget.description,
                    this.widget.geo,
                    this.widget.cityName,
                    this.widget.category)));
          },
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Image.network(
                          this.widget.image,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            this.widget.title,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.location_on_outlined,
                                  color: coral_color),
                              Text(
                                this.widget.location,
                                // textAlign: TextAlign.start,
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text('27/10/2021',
                              style: TextStyle(color: Colors.grey)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            margin: EdgeInsets.all(15),
          ),
        ),
      ),
    );
  }
}
