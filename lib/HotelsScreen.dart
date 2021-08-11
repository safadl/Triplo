import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import 'CustomDrawer.dart';
import 'Hotel.dart';
import 'appBar.dart';

const green_color = const Color(0xff64c7d0);
const dark_color = const Color(0xff232323);

class HotelsScreen extends StatefulWidget {
  @override
  _HotelsScreenState createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      drawer: CustomDrawer(),
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      appBar: appBar(title: 'Hotels', color: dark_color),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
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
                      FloatingSearchBarAction(
                        showIfOpened: false,
                        child: CircularButton(
                          icon: const Icon(Icons.search_outlined,
                              color: green_color),
                          onPressed: () {},
                        ),
                      ),
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
                    padding: const EdgeInsets.only(top: 80.0, left: 20),
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
                Hotel(
                    title: 'Hotel four seasons',
                    description: 'Indonesia',
                    price: '700\$',
                    image:
                        'https://q-xx.bstatic.com/xdata/images/hotel/840x460/251002386.jpg?k=fd49dd621001fbfaf84a6c4546faf54fbf7471d1a953b6f19c7df59c78eafd33&o='),
                Hotel(
                    title: "Hotel Movenpick",
                    description: 'USA',
                    price: '1200\$',
                    image:
                        'https://storage.googleapis.com/static-content-hc/sites/default/files/cataloina_porto_doble_balcon2_2.jpg'),
                Hotel(
                    title: "Hotel Marcella",
                    description: 'Japan',
                    price: '900\$',
                    image:
                        'https://image.resabooking.com/images/hotel/Nesrine_10.jpg'),
                Hotel(
                    title: "Hotel Marbella",
                    description: 'Japan',
                    price: '900\$',
                    image:
                        'https://promohotel.os-travel.com/file_manager/source/GALLERY/HAMMAMET/MAGIC%20LIFE%20HOLIDAY%20VILLAGE%20MANAR/booking.promohotel.tn-Hotel-Magic-life-holiday-village-Manar-Hammamet-piscine.webp'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
