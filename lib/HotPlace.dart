import 'package:flutter/material.dart';

const coral_color = const Color(0xffff868f);
const dark_color = const Color(0xff232323);
const dark_pink = const Color(0xfff29d9d);

class HotPlace extends StatefulWidget {
  final String city;
  final String price;
  final String image;
  final String country;

  HotPlace(this.city, this.country, this.price, this.image);

  @override
  _HotPlaceState createState() => _HotPlaceState();
}

class _HotPlaceState extends State<HotPlace> {
  var isClicked = false;
  Widget build(BuildContext context) {
    return Container(
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
                          this.widget.city + ',' + this.widget.country,
                          style: TextStyle(color: Colors.black),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              this.widget.price,
                              style:
                                  TextStyle(color: coral_color, fontSize: 12),
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
    );
  }
}
