import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'HotelDescription.dart';

const green_color = const Color(0xff64c7d0);

class Hotel extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  final String location;
  final double price;
  final double rating;
  final geo;
  final String cityName;
  Hotel(
      {this.title,
      this.description,
      this.price,
      this.location,
      this.geo,
      this.image,
      this.rating,
      this.cityName});

  @override
  _HotelState createState() => _HotelState();
}

class _HotelState extends State<Hotel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 220,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            print('geoo + ' + this.widget.geo['coordinates'][1].toString());

            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => HotelDescription(
                    this.widget.title,
                    this.widget.image,
                    this.widget.description,
                    this.widget.geo,
                    this.widget.location,
                    this.widget.rating)));
          },
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Stack(
                children: [
                  Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    height: 45,
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              this.widget.title,
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              this.widget.price.toString() + '\$',
                              style:
                                  TextStyle(color: green_color, fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RatingBar.builder(
                              itemSize: 10,
                              initialRating: this.widget.rating,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            Text('2500 review',
                                style: TextStyle(color: Colors.grey[600]))
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(this.widget.image),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.darken),
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
