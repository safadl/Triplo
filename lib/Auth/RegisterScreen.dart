import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:sign_button/sign_button.dart';
import 'package:rive/rive.dart';
import 'package:travel_app/services/authservice.dart';

const rose_color = const Color(0xffffebeb);
const purple_color = const Color(0xff838ac5);
const green_color = const Color(0xff64c7d0);
const pink_color = const Color(0xffffcece);
const coral_color = const Color(0xffff868f);
const dark_color = const Color(0xff232323);
const dark_pink = const Color(0xfff29d9d);
var token;

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<RegisterScreen> {
  final passController = TextEditingController();
  final emailController = TextEditingController();
  final userController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    passController.dispose();
    userController.dispose();
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Center(
            child: Column(
              children: [
                // SizedBox(
                //   width: 200,
                //   height: 200,
                //   child:
                //       // RiveAnimation.network(
                //       //   'https://cdn.rive.app/animations/vehicles.riv',
                //       // ),
                //       RiveAnimation.asset('assets/balloonist.riv'),
                // ),

                Text(
                  "Create Account",
                  style: TextStyle(
                      color: dark_color,
                      fontSize: 24,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 50),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     SignInButton.mini(
                //       buttonType: ButtonType.facebook,
                //       onPressed: () {},
                //     ),
                //     SignInButton.mini(
                //       buttonType: ButtonType.google,
                //       onPressed: () {},
                //     ),
                //   ],
                // ),
                // SizedBox(height: 50),
                // Text(
                //   'or use your e-mail for registration',
                //   style: TextStyle(color: Colors.grey.shade500),
                // ),
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
                            hintText: 'Name',
                          ),
                          controller: userController,
                        ),
                        TextField(
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13),
                                borderSide: BorderSide.none),
                            hintText: 'Email',
                          ),
                          controller: emailController,
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
                        SizedBox(height: 100),
                        Center(
                          child: SizedBox(
                            width: 150.0,
                            height: 50,
                            child: ElevatedButton(
                              child: Text('SIGN UP',
                                  style: TextStyle(fontSize: 18)),
                              onPressed: () {
                                // Navigator.pushNamed(context, 'login');
                                print('my usernamen is' + userController.text);
                                AuthService().register(
                                    userController.text.toString(),
                                    passController.text.toString(),
                                    emailController.text.toString());
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        coral_color),
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
                            'Already have an account?',
                            style: TextStyle(color: dark_color),
                          ),
                        ),
                        SizedBox(height: 25),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "login");
                            },
                            child: new Text("SIGN IN",
                                style: TextStyle(
                                    color: green_color,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal)),
                          ),
                        )
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
