import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import 'HotPlace.dart';
import 'RelevantPlace.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

const rose_color = const Color(0xffffebeb);
const purple_color = const Color(0xff838ac5);
const green_color = const Color(0xff64c7d0);
const pink_color = const Color(0xffffcece);
const coral_color = const Color(0xffff868f);
const dark_color = const Color(0xff232323);
const dark_pink = const Color(0xfff29d9d);

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 50,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Safa Deldoul',
                    style: TextStyle(
                      color: dark_color,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home_outlined, color: green_color),
              title: Text('Home'),
              onTap: () {
                // Navigator.of(context).pop();
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (BuildContext context) => NewPage("Page two")));
              },
            ),
            Container(
              child: ListTile(
                leading: Icon(Icons.location_on_outlined, color: green_color),
                title: Text('My trips'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.flight_outlined, color: green_color),
              title: Text('My tickets'),
            ),
            ListTile(
              leading: Icon(Icons.king_bed_outlined, color: green_color),
              title: Text('My booking'),
            ),
            ListTile(
              leading: Icon(Icons.explore_outlined, color: green_color),
              title: Text('Explore'),
            ),
            ListTile(
              leading: Icon(Icons.map_outlined, color: green_color),
              title: Text('Map'),
            ),
            ListTile(
              leading: Icon(Icons.settings, color: green_color),
              title: Text('Settings'),
            ),
            SizedBox(height: 180),
            ListTile(
              leading: Icon(Icons.logout, color: green_color),
              title: Text('Log Out'),
            ),
          ],
        ),
      ),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (context) => IconButton(
            icon: new Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.person_outline, color: Colors.white),
              onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: double.maxFinite,
          child: Expanded(
            child: Stack(
              children: [
                Flex(
                  direction: Axis.vertical,
                  children: [
                    Flexible(
                      child: Container(
                        height: 600,
                        child: Stack(
                          children: [
                            ClipRRect(
                              child: Image.asset(
                                "assets/mount3.jpg",
                                fit: BoxFit.cover,
                                height: size.height * 0.25,
                                width: size.width,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 120, left: 20),
                              child: Text('Hi, Safa!',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 23)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 170.0),
                              child: FloatingSearchBar(
                                borderRadius: BorderRadius.circular(10),
                                axisAlignment: isPortrait ? 0.0 : -1.0,
                                width: isPortrait ? 600 : 500,

                                hint: 'Where would you like to go?',
                                scrollPadding:
                                    const EdgeInsets.only(top: 50, bottom: 56),
                                transitionDuration:
                                    const Duration(milliseconds: 800),
                                transitionCurve: Curves.easeInOut,
                                physics: const BouncingScrollPhysics(),
                                openAxisAlignment: 0.0,
                                debounceDelay:
                                    const Duration(milliseconds: 500),
                                onQueryChanged: (query) {
                                  // Call your model, bloc, controller here.
                                },
                                // Specify a custom transition to be used for
                                // animating between opened and closed stated.
                                transition:
                                    CircularFloatingSearchBarTransition(),
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
                                      elevation: 5.0,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: Colors.accents.map((color) {
                                          return Container(
                                              height: 112, color: color);
                                        }).toList(),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Flex(
                  direction: Axis.vertical,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                    Center(
                      child: SingleChildScrollView(
                        clipBehavior: Clip.none,
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 88,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 8,
                                        offset: Offset(0, 8),
                                        color: Colors.grey.withOpacity(.5),
                                        spreadRadius: 4)
                                  ],
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () => {print('helloooo')},
                                    child: Container(
                                      child: Center(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20.0),
                                          child: Column(
                                            children: [
                                              Icon(Icons.flight_outlined,
                                                  color: Colors.grey[700]),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10.0),
                                                child: Text('Flights'),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 88,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 8,
                                        offset: Offset(0, 8),
                                        color: Colors.grey.withOpacity(.5),
                                        spreadRadius: 4)
                                  ],
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      child: Center(
                                          child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                        child: Column(
                                          children: [
                                            Icon(Icons.hotel_outlined,
                                                color: Colors.grey[700]),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              child: Text('Hotels'),
                                            )
                                          ],
                                        ),
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 88,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 8,
                                        offset: Offset(0, 8),
                                        color: Colors.grey.withOpacity(.5),
                                        spreadRadius: 4)
                                  ],
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      child: Center(
                                          child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                        child: Column(
                                          children: [
                                            Icon(Icons.train_outlined,
                                                color: Colors.grey[700]),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              child: Text('Trains'),
                                            )
                                          ],
                                        ),
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 88,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 8,
                                        offset: Offset(0, 8),
                                        color: Colors.grey.withOpacity(.5),
                                        spreadRadius: 4)
                                  ],
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    // splashColor: Colors.yellow,
                                    onTap: () => {print('helloooo')},
                                    child: Container(
                                      // color: Colors.blue,

                                      child: Center(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20.0),
                                          child: Column(
                                            children: [
                                              Icon(
                                                  Icons
                                                      .directions_boat_outlined,
                                                  color: Colors.grey[700]),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10.0),
                                                child: Text('Ferries'),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 35),
                    Container(
                      // decoration: BoxDecoration(color: Colors.red),
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text('Most relevant',
                            style: TextStyle(fontSize: 25, color: green_color)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Flexible(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.23,
                        // width: 250,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            RelevantPlace('Rome', "Italy",
                                "https://a.cdn-hotels.com/cos/heroimage/Rome_0_110843582.jpg?impolicy=fcrop&w=536&h=384&q=high"),
                            RelevantPlace("Paris", "France",
                                "https://res.cloudinary.com/hzekpb1cg/image/upload/c_fill,h_410,w_800,f_auto/s3/public/prod/2019-02/Paris.jpg"),
                            RelevantPlace("New York City", "USA",
                                "https://www.nyc.fr/wp-content/uploads/2015/07/New_York_City.jpg"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 18),
                    Container(
                      // decoration: BoxDecoration(color: Colors.red),
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text('Hot Places',
                            style: TextStyle(fontSize: 25, color: green_color)),
                      ),
                    ),
                    // SizedBox(height: 18),
                    Flexible(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        // width: 250,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            HotPlace('Bali', 'Indonesia', '700',
                                "https://pix10.agoda.net/hotelImages/68310/-1/459412f7142ccf9578e5fd075aee86ee.jpg?s=1024x768"),
                            HotPlace("Miami", 'USA', '1200',
                                "https://docu-flix.com/wp-content/uploads/2021/06/0ca6e469-city-30651-1632b88f203.jpeg"),
                            HotPlace("Tokyo", 'Japan', '900',
                                "https://stillmed.olympics.com/media/Images/OlympicOrg/News/2019/07/23/2019-07-23-Trailblazing-Tokyo-looking-ahead-featured.jpg?interpolation=lanczos-none&resize=3840:1600"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}