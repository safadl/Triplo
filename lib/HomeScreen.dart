import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:travel_app/translations/locale_keys.g.dart';

import 'City/CityDescription.dart';
import 'City/HotPlace.dart';
import 'City/RelevantPlace.dart';
import 'CustomDrawer.dart';

import 'Ferry/FerriesScreen.dart';
import 'Flight/FlightScreen.dart';
import 'Hotel/HotelsScreen.dart';
import 'Train/TrainsScreen.dart';
import 'appBar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

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
  var cityItems = [];
  final baseurl = "http://192.168.1.17:8000/";
  @override
  void initState() {
    super.initState();
    this.getJSONData();
  }

  Future<void> getJSONData() async {
    var url = Uri.parse("http://192.168.1.17:8000/api/cities/getAll");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      this.setState(() {
        cityItems = jsonResponse;
      });

      print('items got: ' + this.cityItems[0]['cityName']);
    } else {
      print("Request failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      extendBody: true,
      // bottomNavigationBar: Container(
      //   decoration: BoxDecoration(
      //     color: Color(0x00ffffff),
      //   ),
      //   child: CurvedNavigationBar(
      //     index: 1,
      //     height: 50,
      //     backgroundColor: Color(0x00ffffff),
      //     color: Color(0xfff2e6ff),
      //     items: <Widget>[
      //       Icon(Icons.settings, size: 30, color: Colors.black),
      //       Icon(Icons.home, size: 30, color: Colors.black),
      //       Icon(Icons.person, size: 30, color: Colors.black),
      //     ],
      //     onTap: (index) {
      //       //Handle button tap
      //       // setState(() {
      //       // });
      //     },
      //   ),
      // ),
      resizeToAvoidBottomInset: true,
      drawer: CustomDrawer(),
      extendBodyBehindAppBar: true,
      appBar: appBar(title: '', color: Colors.white),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1.3,
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
                              child: Text(LocaleKeys.welc.tr(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 23)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 170.0),
                              child: FloatingSearchBar(
                                automaticallyImplyBackButton: false,
                                automaticallyImplyDrawerHamburger: false,
                                borderRadius: BorderRadius.circular(10),
                                axisAlignment: isPortrait ? 0.0 : -1.0,
                                width: isPortrait ? 600 : 500,

                                hint: LocaleKeys.search_txt.tr(),
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.35),
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
                                    onTap: () => {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  FlightScreen()))
                                    },
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
                                                child: Text(
                                                    LocaleKeys.flights.tr(),
                                                    style: TextStyle(
                                                        color: Colors.black)),
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
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  TrainScreen()));
                                    },
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
                                              child: Text('Trains',
                                                  style: TextStyle(
                                                      color: Colors.black)),
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
                                    onTap: () => {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  FerriesScreen()))
                                    },
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
                                                child: Text(
                                                    LocaleKeys.ferries.tr(),
                                                    style: TextStyle(
                                                        color: Colors.black)),
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
                        child: Text(LocaleKeys.most_relv.tr(),
                            style: TextStyle(fontSize: 25, color: green_color)),
                      ),
                    ),

                    SizedBox(height: 10),
                    Flexible(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.23,
                        // width: 250,
                        child: ListView.builder(
                            itemCount: cityItems.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          CityDescription(
                                              cityItems[index]['cityName'],
                                              baseurl +
                                                  cityItems[index]['cityImage']
                                                      .replaceAll("\\", "/"),
                                              cityItems[index]['countryName'],
                                              4,
                                              cityItems[index]
                                                  ['cityDescription'],
                                              "djhf"),
                                    ),
                                  );
                                },
                                child: RelevantPlace(
                                  cityItems[index]['cityName'],
                                  cityItems[index]['countryName'],
                                  baseurl +
                                      cityItems[index]['cityImage']
                                          .replaceAll("\\", "/"),
                                ),
                              );
                            }
                            // children: [
                            //   RelevantPlace('Rome', "Italy",
                            //       "https://a.cdn-hotels.com/cos/heroimage/Rome_0_110843582.jpg?impolicy=fcrop&w=536&h=384&q=high"),
                            //   RelevantPlace("Paris", "France",
                            //       "https://res.cloudinary.com/hzekpb1cg/image/upload/c_fill,h_410,w_800,f_auto/s3/public/prod/2019-02/Paris.jpg"),
                            //   RelevantPlace("New York City", "USA",
                            //       "https://www.nyc.fr/wp-content/uploads/2015/07/New_York_City.jpg"),
                            // ],
                            ),
                      ),
                    ),
                    SizedBox(height: 18),
                    Container(
                      // decoration: BoxDecoration(color: Colors.red),
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(LocaleKeys.hot.tr(),
                            style: TextStyle(fontSize: 25, color: green_color)),
                      ),
                    ),
                    // SizedBox(height: 18),
                    Flexible(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        // width: 250,
                        child: ListView.builder(
                            itemCount: cityItems.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return HotPlace(
                                cityItems[index]['cityName'],
                                cityItems[index]['countryName'],
                                '700',
                                baseurl +
                                    cityItems[index]['cityImage']
                                        .replaceAll("\\", "/"),
                              );
                            }),

                        // HotPlace('Bali', 'Indonesia', '700',
                        //     "https://pix10.agoda.net/hotelImages/68310/-1/459412f7142ccf9578e5fd075aee86ee.jpg?s=1024x768"),
                        // HotPlace("Miami", 'USA', '1200',
                        //     "https://images.theconversation.com/files/413417/original/file-20210727-19-aghe22.jpg?ixlib=rb-1.1.0&rect=0%2C7%2C5138%2C3404&q=45&auto=format&w=496&fit=clip"),
                        // HotPlace("Tokyo", 'Japan', '900',
                        //     "https://stillmed.olympics.com/media/Images/OlympicOrg/News/2019/07/23/2019-07-23-Trailblazing-Tokyo-looking-ahead-featured.jpg?interpolation=lanczos-none&resize=3840:1600"),
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

class SettingsScreen {}
