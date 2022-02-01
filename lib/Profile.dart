import 'package:flutter/material.dart';
import 'package:travel_app/SplashScreen.dart';

import 'comp/CardS.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Center(
              child: Text('My Trips',
                  style: TextStyle(fontSize: 30, color: pink_color)),
            ),
            CardS(
                image:
                    'https://lp-cms-production.imgix.net/2021-03/shutterstock_304631102.jpg?auto=format&fit=crop&sharp=10&vib=20&ixlib=react-8.6.4&w=850',
                title: 'Holidays in Paris',
                date: '21 Feb'),
            CardS(
                image:
                    'https://lp-cms-production.imgix.net/2021-03/shutterstock_304631102.jpg?auto=format&fit=crop&sharp=10&vib=20&ixlib=react-8.6.4&w=850',
                title: 'Holidays in Paris',
                date: '21 Feb'),
          ],
        ),

        // height: MediaQuery.of(context).size.height * 0.54,
        // child: Padding(
        //   padding: const EdgeInsets.all(30.0),
        //   child: Card(
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(15.0),
        //     ),
        //     elevation: 4.0,
        //     // clipBehavior: Clip.antiAlias,
        //     child: Padding(
        //       padding: const EdgeInsets.all(15.0),
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         children: [
        //           ClipRRect(
        //             borderRadius: BorderRadius.circular(12.0),
        //             child: Image.network(
        //                 'https://lp-cms-production.imgix.net/2021-03/shutterstock_304631102.jpg?auto=format&fit=crop&sharp=10&vib=20&ixlib=react-8.6.4&w=850'),
        //           ),
        //           SizedBox(height: 10),
        //           Column(
        //             children: [
        //               Text(
        //                 'Holidays in Paris',
        //                 style: TextStyle(
        //                     fontWeight: FontWeight.bold, fontSize: 16),
        //               ),
        //             ],
        //           ),
        //           Text('21 Feb', style: TextStyle(color: green_color)),
        //           Center(
        //             child: ElevatedButton(
        //               style: ButtonStyle(
        //                 shape:
        //                     MaterialStateProperty.all<RoundedRectangleBorder>(
        //                   RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.circular(12.0),
        //                   ),
        //                 ),
        //               ),
        //               onPressed: () {
        //                 SnackBar(
        //                   content: Text('Trip deleted'),
        //                 );
        //               },
        //               child: Text('Delete'),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
