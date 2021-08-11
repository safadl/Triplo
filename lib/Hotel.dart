import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

const green_color = const Color(0xff64c7d0);

class Hotel extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  final String location;
  final String price;
  final String rating;
  Hotel(
      {this.title,
      this.description,
      this.image,
      this.location,
      this.price,
      this.rating});

  @override
  _HotelState createState() => _HotelState();
}

class _HotelState extends State<Hotel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 200,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            print('hot place');
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
                              this.widget.price,
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
                              initialRating: 3,
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
            margin: EdgeInsets.all(20),
          ),
        ),
      ),
    );
  }
}
