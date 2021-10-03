import 'package:flutter/material.dart';

import 'CityDescription.dart';

class RelevantPlace extends StatefulWidget {
  final String city;
  final String country;
  final String image;
  RelevantPlace(this.city, this.country, this.image);

  @override
  _RelevantPlaceState createState() => _RelevantPlaceState();
}

class _RelevantPlaceState extends State<RelevantPlace> {
  var isClicked = false;
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => CityDescription()));
      },
      child: Container(
        width: 250,
        child: Card(
          // borderOnForeground: true,
          // semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Container(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      alignment: Alignment.topRight,
                      onPressed: () {
                        setState(() {
                          isClicked = !isClicked;
                        });
                      },
                      icon: Icon(
                          !isClicked
                              ? Icons.favorite_outline
                              : Icons.favorite_rounded,
                          color: Colors.white),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        this.widget.city,
                        style: TextStyle(color: Colors.white),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                            size: 12,
                          ),
                          Text(
                            this.widget.country,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  this.widget.image,
                ),
                fit: BoxFit.fill,
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
    );
  }
}
