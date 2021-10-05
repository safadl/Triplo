import 'package:flutter/material.dart';

import 'HotelDescription.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

const green_color = const Color(0xff64c7d0);
const coral_color = const Color(0xffff868f);

class Event extends StatefulWidget {
  final String image;
  final String title;
  final String location;
  final String rating;
  Event({this.title, this.image, this.location, this.rating});

  @override
  _EventState createState() => _EventState();
}

class _EventState extends State<Event> {
  @override
  Widget build(BuildContext context) {
    // final List<String> titles = [
    //   "RED",
    //   "YELLOW",
    //   "BLACK",
    //   "CYAN",
    //   "BLUE",
    //   "GREY",
    // ];

    // final List<Widget> images = [
    //   Container(
    //     color: Colors.red,
    //   ),
    //   Container(
    //     color: Colors.yellow,
    //   ),
    //   Container(
    //     color: Colors.black,
    //   ),
    //   Container(
    //     color: Colors.cyan,
    //   ),
    //   Container(
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(10),
    //       // color: Colors.red,
    //       image: DecorationImage(
    //         image: NetworkImage(
    //             'https://media-cdn.tripadvisor.com/media/photo-m/1280/18/19/1a/a8/restaurant-el-borj.jpg'),
    //         fit: BoxFit.fill,
    //       ),
    //     ),
    //   ),
    //   Container(
    //     color: Colors.grey,
    //   ),
    // ];
    // return Expanded(
    //   child: Container(
    //     child: VerticalCardPager(
    //       textStyle:
    //           TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    //       titles: titles,
    //       images: images,
    //       onPageChanged: (page) {
    //         // print(page);
    //       },
    //       onSelectedItem: (index) {},
    //     ),
    //   ),
    // );

    return Container(
      width: 170,
      height: 150,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => HotelDescription()));
          },
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // alignment: Alignment.bottomCenter,
                // child: Stack(
                //   children: [
                //     Container(
                //       color: Colors.black.withOpacity(0.5),
                //       width: MediaQuery.of(context).size.width,
                //       height: 80,
                //       child: ListView(
                //         children: [
                //           Column(
                //             children: [
                //               SizedBox(height: 5),
                //               Text(
                //                 this.widget.title,
                //                 style:
                //                     TextStyle(color: Colors.white, fontSize: 20),
                //               ),
                //               Row(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   Icon(Icons.location_on_outlined,
                //                       color: coral_color),
                //                   Text(
                //                     this.widget.location,
                //                     style: TextStyle(color: Colors.white),
                //                   ),
                //                 ],
                //               ),
                //               Row(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   Icon(Icons.date_range_outlined,
                //                       color: coral_color),
                //                   Text(
                //                     this.widget.location,
                //                     style: TextStyle(color: Colors.white),
                //                   ),
                //                 ],
                //               ),
                //             ],
                //           ),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //     image: NetworkImage(this.widget.image),
                //     fit: BoxFit.fitWidth,
                //     alignment: Alignment.topCenter,
                //     colorFilter: ColorFilter.mode(
                //         Colors.black.withOpacity(0.3), BlendMode.darken),
                //   ),
                // ),
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
