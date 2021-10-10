import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import 'CustomDrawer.dart';
import 'Event.dart';
// import 'appBar.dart';

const green_color = const Color(0xff64c7d0);
const dark_color = const Color(0xff232323);

class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        drawer: CustomDrawer(),
        resizeToAvoidBottomInset: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            backgroundColor: green_color,
            centerTitle: true,
            title: Text("Events"),
            bottom: const TabBar(tabs: [
              Tab(text: "Theatre"),
              Tab(text: "Concerts"),
            ])),
        body: TabBarView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // decoration: BoxDecoration(color: Colors.red),
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  shrinkWrap: true,
                  // scrollDirection: Axis.horizontal,
                  children: [
                    Event(
                        title: 'Théâtre Globe - Silvano Toti',
                        location: "Largo Aqua Felix, 00197",
                        image:
                            'https://www.romeing.it/wp-content/uploads/2017/08/silvano-toti-globe-theater-770x513.jpg'),
                    Event(
                        title: "CiPASSO Bistrot",
                        location: "Via della Vite, 28, Rome",
                        image:
                            'https://media-cdn.tripadvisor.com/media/photo-s/19/ca/bd/ac/l-espace-du-restaurant.jpg'),
                    Event(
                        title: "Pane e Salame",
                        location: "Via della Vite, 28, Rome",
                        image:
                            'https://www.marhba.com/images/lifestyle/lifestyle2020/restogastrotunis/ROOFTOP360LAMARSA.jpg'),
                    Event(
                        title: "Ambrosia Rooftop",
                        location: "Via della Vite, 28, Rome",
                        image:
                            'https://www.marhba.com/images/lifestyle/lifestyle2020/restogastrotunis/LeGolfe.jpg'),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // decoration: BoxDecoration(color: Colors.red),
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  shrinkWrap: true,
                  // scrollDirection: Axis.horizontal,
                  children: [
                    Event(
                        title: 'Trattoria Monti',
                        location: "Via della Vite, 28, Rome",
                        image:
                            'https://media-cdn.tripadvisor.com/media/photo-m/1280/18/19/1a/a8/restaurant-el-borj.jpg'),
                    Event(
                        title: "CiPASSO Bistrot",
                        location: "Via della Vite, 28, Rome",
                        image:
                            'https://media-cdn.tripadvisor.com/media/photo-s/19/ca/bd/ac/l-espace-du-restaurant.jpg'),
                    Event(
                        title: "Pane e Salame",
                        location: "Via della Vite, 28, Rome",
                        image:
                            'https://www.marhba.com/images/lifestyle/lifestyle2020/restogastrotunis/ROOFTOP360LAMARSA.jpg'),
                    Event(
                        title: "Ambrosia Rooftop",
                        location: "Via della Vite, 28, Rome",
                        image:
                            'https://www.marhba.com/images/lifestyle/lifestyle2020/restogastrotunis/LeGolfe.jpg'),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
