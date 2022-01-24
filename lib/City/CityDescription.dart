import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travel_app/Event/EventScreen.dart';
import 'package:travel_app/Hotel/HotelsScreen.dart';
import 'package:travel_app/Restaurant/RestaurantsScreen.dart';

import '../CustomDrawer.dart';
import '../ResourcesWidget.dart';
import '../appBar.dart';

const dark_color = const Color(0xff232323);
const coral_color = const Color(0xffff868f);
const green_color = const Color(0xff64c7d0);

class CityDescription extends StatefulWidget {
  final String title;
  final String image;
  final String location;
  final double review;
  final String description;
  final String geoloc;
  // final List restos;

  CityDescription(this.title, this.image, this.location, this.review,
      this.description, this.geoloc);

  @override
  _CityDescriptionState createState() => _CityDescriptionState(this.title,
      this.image, this.location, this.review, this.description, this.geoloc);
}

class _CityDescriptionState extends State<CityDescription> {
  GoogleMapController mapController;
  final LatLng _center = const LatLng(41.902782, 12.496366);
  // String title, image, location, review, description, geoloc;
  // _CityDescriptionState(
  //     {title,
  //     image,
  //     location,
  //     review,
  //     description,
  //     geoloc});
  _CityDescriptionState(title, image, location, review, description, geoloc);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: appBar(title: '', color: Colors.black),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: Text(
                  this.widget.title,
                  style: GoogleFonts.aBeeZee(fontSize: 27, color: dark_color),
                ),
              ),
              SizedBox(height: 15),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  this.widget.image,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.location_on_outlined, color: coral_color),
                  Text(
                    this.widget.location,
                    style: GoogleFonts.aBeeZee(fontSize: 15, color: dark_color),
                  )
                ],
              ),
              SizedBox(height: 15),
              RatingBar.builder(
                itemSize: 18,
                initialRating: this.widget.review,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(height: 24),
              Text(
                // this.widget.description.toString(),
                " Rome is the capital city of Italy. It is also the capital of the Lazio region, the centre of the Metropolitan City of Rome, and a special comune named Comune di Roma Capitale. With 2,860,009 residents in 1,285 km2 (496.1 sq mi), Rome is the country's most populated comune and the third most populous city in the European Union by population within city limits. The Metropolitan City of Rome, with a population of 4,355,725 residents, is the most populous metropolitan city in Italy.Its metropolitan area is the third-most populous within Italy. Rome is located in the central-western portion of the Italian Peninsula, within Lazio (Latium), along the shores of the Tiber.",
                maxLines: 4,
                style: GoogleFonts.notoSans(
                    fontSize: 15, color: dark_color, height: 2),
              ),
              SizedBox(height: 25),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                ResourcesWidget(
                  "Restaurants",
                  Icons.restaurant_outlined,
                  RestaurantScreen(this.widget.title),
                ),
                ResourcesWidget("Hotels", Icons.hotel_outlined, HotelsScreen()),
                ResourcesWidget("Events", Icons.event_outlined, EventScreen()),
              ]),
              SizedBox(height: 15),
              Text(
                'Location',
                style: GoogleFonts.aBeeZee(fontSize: 22, color: green_color),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // decoration: BoxDecoration(color: Colors.red),

                  width: 400,
                  height: 400,
                  child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _center,
                      zoom: 11.0,
                    ),
                    markers: <Marker>{},
                  ),
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {},
      //   label: Text('To the lake!'),
      //   icon: Icon(Icons.directions_boat),
      // ),
    );
  }
}
