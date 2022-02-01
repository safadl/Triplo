import 'package:flutter/material.dart';
import 'package:travel_app/SplashScreen.dart';

class CardS extends StatefulWidget {
  final String image;
  final String title;
  final String date;
  CardS({this.image, this.title, this.date});
  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<CardS> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.54,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 4.0,
          // clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(this.widget.image),
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Text(
                      this.widget.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
                Text(this.widget.date, style: TextStyle(color: green_color)),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      SnackBar(
                        content: Text('Trip deleted'),
                      );
                    },
                    child: Text('Delete'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
