import 'package:flutter/material.dart';

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
    return Scaffold(
        body: Container(
      width: 170,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            print('hot place');
          },
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Stack(
                children: [
                  Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // mainAxisSize: MainAxisSize.min,

                      children: [
                        Text(
                          this.widget.title,
                          style: TextStyle(color: Colors.black),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              this.widget.price,
                              style:
                                  TextStyle(color: green_color, fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    this.widget.image,
                  ),
                  fit: BoxFit.fitHeight,
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
            margin: EdgeInsets.all(10),
          ),
        ),
      ),
    ));
  }
}
