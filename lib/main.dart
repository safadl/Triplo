import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:travel_app/Bottomnav.dart';
import 'package:travel_app/translations/codegen_loader.g.dart';

import 'Auth/ForgotPassword.dart';
import 'Auth/LoginScreen.dart';
import 'Auth/RegisterScreen.dart';
import 'HomeScreen.dart';
import 'SplashScreen.dart';
import 'package:flutter/services.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: [
          Locale('en'),
          Locale('fr'),
        ],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: Locale('en'),
        assetLoader: CodegenLoader(),
        child: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();
  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  Future<void> initPlatformState() async {
    OneSignal.shared.setAppId("f674ea0c-7cdd-4886-bdf4-b8bddae860cb");
  }

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Triplo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      // standard dark theme
      themeMode: _themeMode,
      routes: {
        'login': (context) => LoginScreen(),
        'Register': (context) => RegisterScreen(),
        'ForgotP': (context) => ForgotPasswordScreen(),
      },
      home:
          //  FlightScreen(),
          Bottomnav(),

      //SplashScreen(),
      // HotelsScreen()
      // home: SplashScreen(),
    );
  }
}
