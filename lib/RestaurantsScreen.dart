import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import 'CustomDrawer.dart';
import 'Restaurant.dart';
import 'appBar.dart';

const green_color = const Color(0xff64c7d0);
const dark_color = const Color(0xff232323);

class RestaurantScreen extends StatefulWidget {
  @override
  _RestaurantsScreenState createState() => _RestaurantsScreenState();
}

class _RestaurantsScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      drawer: CustomDrawer(),
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      appBar: appBar(title: 'Restaurants', color: dark_color),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 90.0),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  FloatingSearchBar(
                    automaticallyImplyBackButton: false,
                    automaticallyImplyDrawerHamburger: false,
                    hint: 'Search...',
                    scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
                    transitionDuration: const Duration(milliseconds: 800),
                    transitionCurve: Curves.easeInOut,
                    physics: const BouncingScrollPhysics(),
                    axisAlignment: isPortrait ? 0.0 : -1.0,
                    // openAxisAlignment: 0.0,
                    width: isPortrait ? 600 : 500,
                    debounceDelay: const Duration(milliseconds: 500),
                    onQueryChanged: (query) {},

                    actions: [
                      // FloatingSearchBarAction(
                      //   showIfOpened: false,
                      //   child: CircularButton(
                      //     icon: const Icon(Icons.search_outlined,
                      //         color: green_color),
                      //     onPressed: () {},
                      //   ),
                      // ),
                      FloatingSearchBarAction.searchToClear(
                        showIfClosed: true,
                      ),
                    ],
                    builder: (context, transition) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Material(
                          color: Colors.white,
                          elevation: 4.0,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: Colors.accents.map((color) {
                              return Container(height: 112, color: color);
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 70.0, left: 20),
                    child: Text('645 results', style: TextStyle(fontSize: 25)),
                  ),
                ],
              ),
            ),
          ),
          //  SizedBox(height: 20),

          Container(
            // decoration: BoxDecoration(color: Colors.red),
            height: MediaQuery.of(context).size.height * 0.81,
            child: ListView(
              shrinkWrap: true,
              // scrollDirection: Axis.horizontal,
              children: [
                Restaurant(
                    title: 'Trattoria Monti',
                    location: "Via della Vite, 28, Rome",
                    image:
                        'https://media-cdn.tripadvisor.com/media/photo-m/1280/18/19/1a/a8/restaurant-el-borj.jpg'),
                Restaurant(
                    title: "CiPASSO Bistrot",
                    location: "Via della Vite, 28, Rome",
                    image:
                        'https://media-cdn.tripadvisor.com/media/photo-s/19/ca/bd/ac/l-espace-du-restaurant.jpg'),
                Restaurant(
                    title: "Pane e Salame",
                    location: "Via della Vite, 28, Rome",
                    image:
                        'https://www.marhba.com/images/lifestyle/lifestyle2020/restogastrotunis/ROOFTOP360LAMARSA.jpg'),
                Restaurant(
                    title: "Ambrosia Rooftop",
                    location: "Via della Vite, 28, Rome",
                    image:
                        'https://www.marhba.com/images/lifestyle/lifestyle2020/restogastrotunis/LeGolfe.jpg'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
