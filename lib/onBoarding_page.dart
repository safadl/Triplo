import 'package:flutter/material.dart';

import 'package:introduction_screen/introduction_screen.dart';

const rose_color = const Color(0xffffebeb);
const purple_color = const Color(0xff838ac5);
const green_color = const Color(0xff64c7d0);
const pink_color = const Color(0xffffcece);
const coral_color = const Color(0xffff868f);
const dark_color = const Color(0xff232323);
const dark_pink = const Color(0xfff29d9d);

class onBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: 'Plan a Trip',
            body:
                'Select destinations and start scheduling details for your trip!',
            image: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Center(child: Image.asset('assets/plan_flight.png')),
            ),
            decoration: const PageDecoration(
              titleTextStyle: TextStyle(
                  color: green_color,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
              bodyTextStyle: TextStyle(color: dark_color, fontSize: 18),
              contentMargin: const EdgeInsets.only(top: 20.0),
              descriptionPadding: const EdgeInsets.all(20),
            ),
          ),
          PageViewModel(
            title: 'Book the Flight',
            body: 'Book your flight for a convenient date and time.',
            image: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Center(
                child: Image.asset('assets/book_flight.png'),
              ),
            ),
            decoration: const PageDecoration(
              titleTextStyle: TextStyle(
                  color: green_color,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
              bodyTextStyle: TextStyle(color: dark_color, fontSize: 18),
              contentMargin: const EdgeInsets.only(top: 60.0),
              descriptionPadding: const EdgeInsets.all(20),
            ),
          ),
          PageViewModel(
            title: 'Start Your Adventure',
            body: 'Enjoy! Relax and chilling memories!',
            image: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(
                child: Image.asset('assets/adventure.png'),
              ),
            ),
            decoration: const PageDecoration(
              titleTextStyle: TextStyle(
                  color: dark_pink, fontSize: 50, fontWeight: FontWeight.bold),
              bodyTextStyle: TextStyle(color: dark_color, fontSize: 18),
            ),
          ),
        ],
        next: ElevatedButton(
          child: Text('Next', style: TextStyle(color: Colors.white)),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(dark_pink),
          ),
        ),
        done: ElevatedButton(
          child: Text('Start', style: TextStyle(color: Colors.white)),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(green_color),
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'Register');
          },
        ),
        onDone: () {
          // Navigator.pushNamed(context, 'login');
        },
      ),
    );
  }
}
