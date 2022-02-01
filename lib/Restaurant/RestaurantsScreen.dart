import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import '../CustomDrawer.dart';
import '../appBar.dart';
import 'Restaurant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const green_color = const Color(0xff64c7d0);
const dark_color = const Color(0xff232323);

class RestaurantScreen extends StatefulWidget {
  final String city;
  RestaurantScreen(this.city);
  @override
  _RestaurantsScreenState createState() => _RestaurantsScreenState();
}

class _RestaurantsScreenState extends State<RestaurantScreen> {
  List restoItems = [];
  final baseurl = "http://192.168.72.102:8000/";

  void initState() {
    super.initState();
    this.getJSONData();
    print(this.widget.city);
  }

  Future<void> getJSONData() async {
    var url = Uri.parse("http://192.168.1.17:8000/api/restos/getAll");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      this.setState(() {
        this.restoItems = jsonResponse;
      });

      print('items successfully stored ');
    } else {
      print("Request failed");
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    width: isPortrait ? 600 : 500,
                    debounceDelay: const Duration(milliseconds: 500),
                    onQueryChanged: (query) {},
                    actions: [
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
            height: MediaQuery.of(context).size.height * 0.81,
            child: ListView.builder(
              itemCount: restoItems.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return this.widget.city == restoItems[index]['cityName']
                    ? Restaurant(
                        title: restoItems[index]['restoName'],
                        location: restoItems[index]['loca'],
                        image: baseurl +
                            restoItems[index]['restoImage']
                                .replaceAll("\\", "/"),
                        rating: restoItems[index]['rating'] == null
                            ? 0.0
                            : restoItems[index]['rating'].toDouble(),
                        details: restoItems[index]['restoDetails'] == null
                            ? ' No details yet.'
                            : restoItems[index]['restoDetails'])
                    : Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
