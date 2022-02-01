import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sign_button/sign_button.dart';
import 'package:travel_app/HomeScreen.dart';
import 'package:travel_app/services/authservice.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Bottomnav.dart';

const rose_color = const Color(0xffffebeb);
const purple_color = const Color(0xff838ac5);
const green_color = const Color(0xff64c7d0);
const pink_color = const Color(0xffffcece);
const coral_color = const Color(0xffff868f);
const dark_color = const Color(0xff232323);
const dark_pink = const Color(0xfff29d9d);

class LoginScreen extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  bool _isLoggedIn = false;
  Map _userObj = {};
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  final passController = TextEditingController();
  final userController = TextEditingController();
  var token;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  "Sign In to your account",
                  style: TextStyle(
                      color: dark_color,
                      fontSize: 24,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SignInButton.mini(
                      buttonType: ButtonType.facebook,
                      onPressed: () async {
                        FacebookAuth.instance.login().then((value) {
                          FacebookAuth.instance.getUserData().then((userData) {
                            setState(() {
                              _isLoggedIn = true;
                              _userObj = userData;
                            });
                          });
                        });

                        if (_isLoggedIn) {
                          print('logged in');
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => Bottomnav()));
                        } else {
                          print('not logged in');
                          Container();
                        }
                      },
                    ),
                    SignInButton.mini(
                      buttonType: ButtonType.google,
                      onPressed: () {
                        _handleSignIn().then((e) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => Bottomnav()));
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Text(
                  'or use your e-mail',
                  style: TextStyle(color: Colors.grey.shade500),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Wrap(
                      runSpacing: 10,
                      children: [
                        TextField(
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person_outline),
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13),
                                borderSide: BorderSide.none),
                            hintText: 'Username',
                          ),
                          controller: userController,
                        ),
                        TextField(
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
                            hintText: 'Password',
                          ),
                          obscuringCharacter: '*',
                          controller: passController,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "ForgotP");
                          },
                          child: Text('Forgot your password?',
                              style: TextStyle(color: green_color)),
                        ),
                        SizedBox(height: 140),
                        Center(
                          child: SizedBox(
                            width: 150.0,
                            height: 40,
                            child: ElevatedButton(
                              child: Text('SIGN IN',
                                  style: TextStyle(fontSize: 18)),
                              onPressed: () {
                                AuthService()
                                    .login(userController.text.toString(),
                                        passController.text.toString())
                                    .then((val) {
                                  if (val) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Bottomnav()));
                                  }
                                });

                                //   .then((val) {
                                // if (val.body['success']) {
                                //   print('success');
                                // }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        green_color),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 70),
                        Center(
                          child: Text(
                            "Don't have an account?",
                            style: TextStyle(color: dark_color),
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(
                            child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "Register");
                          },
                          child: new Text("SIGN UP",
                              style: TextStyle(
                                  color: coral_color,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal)),
                        ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
