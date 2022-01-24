import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

const rose_color = const Color(0xffffebeb);
const purple_color = const Color(0xff838ac5);
const green_color = const Color(0xff64c7d0);
const pink_color = const Color(0xffffcece);
const coral_color = const Color(0xffff868f);
const dark_color = const Color(0xff232323);
const dark_pink = const Color(0xfff29d9d);

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreen createState() => _ForgotPasswordScreen();
}

class _ForgotPasswordScreen extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Center(
                child: SizedBox(
                  height: 250,
                  width: 250,
                  child: Lottie.asset(
                    "assets/forgot.json",
                  ),
                ),
              ),
            ),
            Text(
              "Forgot password?",
              style: TextStyle(
                color: dark_color,
                fontSize: 30,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 40),
            Text('Please enter a new password'),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: TextField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide.none),
                  hintText: 'New password',
                ),
                obscuringCharacter: '*',
              ),
            ),
            SizedBox(height: 120),
            Center(
              child: SizedBox(
                width: 150.0,
                height: 40,
                child: ElevatedButton(
                  child: Text('SAVE', style: TextStyle(fontSize: 18)),
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(green_color),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
