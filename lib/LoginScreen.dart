import 'package:flutter/material.dart';
import 'package:sign_button/sign_button.dart';

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
                      onPressed: () {},
                    ),
                    SignInButton.mini(
                      buttonType: ButtonType.google,
                      onPressed: () {},
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
                            prefixIcon: Icon(Icons.email_outlined),
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13),
                                borderSide: BorderSide.none),
                            hintText: 'Email',
                          ),
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
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "ForgotP");
                          },
                          child: Text('Forgot your password?',
                              style: TextStyle(color: green_color)),
                        ),
                        SizedBox(height: 160),
                        Center(
                          child: SizedBox(
                            width: 150.0,
                            height: 40,
                            child: ElevatedButton(
                              child: Text('SIGN IN',
                                  style: TextStyle(fontSize: 18)),
                              onPressed: () {},
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
