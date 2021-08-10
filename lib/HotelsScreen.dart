import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import 'Hotel.dart';

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
      body: Stack(
        children: [
          FloatingSearchBar(
            hint: 'Search...',
            scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
            transitionDuration: const Duration(milliseconds: 800),
            transitionCurve: Curves.easeInOut,
            physics: const BouncingScrollPhysics(),
            axisAlignment: isPortrait ? 0.0 : -1.0,
            openAxisAlignment: 0.0,
            width: isPortrait ? 600 : 500,
            debounceDelay: const Duration(milliseconds: 500),
            onQueryChanged: (query) {
              // Call your model, bloc, controller here.
            },
            // Specify a custom transition to be used for
            // animating between opened and closed stated.
            transition: CircularFloatingSearchBarTransition(),
            actions: [
              FloatingSearchBarAction(
                showIfOpened: false,
                child: CircularButton(
                  icon: const Icon(Icons.place),
                  onPressed: () {},
                ),
              ),
              FloatingSearchBarAction.searchToClear(
                showIfClosed: false,
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
          SizedBox(height: 200),
          ListView(
            shrinkWrap: true,
            // scrollDirection: Axis.horizontal,
            children: [
              Hotel(
                  title: 'Bali',
                  description: 'Indonesia',
                  price: '700',
                  image:
                      "https://pix10.agoda.net/hotelImages/68310/-1/459412f7142ccf9578e5fd075aee86ee.jpg?s=1024x768"),
              Hotel(
                  title: "Miami",
                  description: 'USA',
                  price: '1200',
                  image:
                      "https://images.theconversation.com/files/413417/original/file-20210727-19-aghe22.jpg?ixlib=rb-1.1.0&rect=0%2C7%2C5138%2C3404&q=45&auto=format&w=496&fit=clip"),
              Hotel(
                  title: "Tokyo",
                  description: 'Japan',
                  price: '900',
                  image:
                      "https://stillmed.olympics.com/media/Images/OlympicOrg/News/2019/07/23/2019-07-23-Trailblazing-Tokyo-looking-ahead-featured.jpg?interpolation=lanczos-none&resize=3840:1600"),
            ],
          ),
        ],
      ),
    );
  }
}
