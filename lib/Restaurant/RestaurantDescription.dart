import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../CustomDrawer.dart';
import '../appBar.dart';

const dark_color = const Color(0xff232323);
const coral_color = const Color(0xffff868f);
const green_color = const Color(0xff64c7d0);

class RestaurantDescription extends StatefulWidget {
  final String restoName;
  final String restoImg;
  final String loc;
  final double rating;
  final String details;

  RestaurantDescription(
      this.restoName, this.restoImg, this.loc, this.rating, this.details);

  @override
  _RestaurantDescriptionState createState() => _RestaurantDescriptionState();
}

class _RestaurantDescriptionState extends State<RestaurantDescription> {
  // Completer<GoogleMapController> _controller = Completer();
  // static final CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );
  // static final CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.773972, -122.431297),
  //     tilt: 59.440717697143555,
  //     zoom: 11.5);
  GoogleMapController mapController;
  final LatLng _center = const LatLng(41.903364019799504, 12.501780158002843);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    // Future<void> _goToTheLake() async {
    //   final GoogleMapController controller = await _controller.future;
    //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
    // }

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: appBar(title: '', color: Colors.black),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                this.widget.restoName,
                style: GoogleFonts.aBeeZee(fontSize: 27, color: dark_color),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.location_on_outlined, color: coral_color),
                  Text(
                    this.widget.loc,
                    style: GoogleFonts.aBeeZee(fontSize: 15, color: dark_color),
                  )
                ],
              ),
              SizedBox(height: 15),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(this.widget.restoImg),
              ),
              SizedBox(height: 20),
              Text(
                'Details',
                style: GoogleFonts.aBeeZee(fontSize: 22, color: coral_color),
              ),
              SizedBox(height: 4),
              Text(
                this.widget.details,
                maxLines: 4,
                style: GoogleFonts.notoSans(
                    fontSize: 15, color: dark_color, height: 2),
              ),
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
              Text(
                'Reviews',
                style: GoogleFonts.aBeeZee(fontSize: 22, color: green_color),
              ),
              RatingBar.builder(
                itemSize: 18,
                initialRating: this.widget.rating,
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
              SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        'https://photographypro.com/wp-content/uploads/2017/08/portrait-photography-focal-length-50mm-1.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mikayla Johnson',
                          style: GoogleFonts.aBeeZee(
                              fontSize: 15,
                              color: dark_color,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                            'This Restaurant is clean. I enjoyed my stay here \n with my family. ')
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1542909168-82c3e7fdca5c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29uJTIwcG9ydHJhaXR8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Andrew Robinson',
                          style: GoogleFonts.aBeeZee(
                              fontSize: 15,
                              color: dark_color,
                              fontWeight: FontWeight.w600),
                        ),
                        Text('It was so much fun. We enjoyed the pool. ')
                      ],
                    ),
                  ),
                ],
              )
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
