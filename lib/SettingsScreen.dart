import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:travel_app/Train/TrainWidget.dart';
import 'package:travel_app/translations/locale_keys.g.dart';

import 'main.dart';

class SettingScreen extends StatefulWidget {
  @override
  // ignore: missing_return
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingScreen> {
  bool notif = true;
  bool mode = false;
  String dropdownValue = 'English';
  String devices = '\$';
  String modes = 'Dark';
  void showInSnackBar(String value) {
    // ignore: deprecated_member_use
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: Padding(padding: const EdgeInsets.all(3.0), child: Text(value)),
      ),
      behavior: SnackBarBehavior.floating,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: ListView(
          children: [
            Center(
              child: Text(LocaleKeys.settings_text.tr(),
                  style: TextStyle(fontSize: 30)),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                        notif
                            ? Icons.notifications_active_outlined
                            : Icons.notifications_none_outlined,
                        size: 30),
                    onPressed: () {
                      setState(() {
                        notif = !notif;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Notification',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  new Spacer(),
                  Switch(
                    activeColor: green_color,
                    value: notif,
                    onChanged: (value) {
                      setState(() {
                        notif = value;
                        print(notif);
                      });
                      if (value == true) {
                        OneSignal.shared.disablePush(false);
                        showInSnackBar('Notifications enabled!');
                      } else if (value == false) {
                        OneSignal.shared.disablePush(true);
                        showInSnackBar('Notifications disabled!');
                      }
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 10),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.language_outlined, size: 30),
                    onPressed: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      LocaleKeys.lang_text.tr(),
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  new Spacer(), // I just added one line

                  DropdownButton<String>(
                    value: dropdownValue,
                    elevation: 16,
                    style: const TextStyle(color: Colors.grey),
                    items: <String>['English', 'French']
                        .map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                    onChanged: (newValue) async {
                      setState(() {
                        dropdownValue = newValue;
                      });
                      if (newValue == 'English') {
                        await context.setLocale(Locale('en'));
                      } else if (newValue == 'French') {
                        await context.setLocale(Locale('fr'));
                      }
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 10),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.attach_money_outlined, size: 30),
                    onPressed: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      LocaleKeys.currency_text.tr(),
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  new Spacer(), // I just added one line

                  DropdownButton<String>(
                    value: devices,
                    elevation: 16,
                    style: const TextStyle(color: Colors.grey),
                    onChanged: (String newValue) {
                      setState(() {
                        devices = newValue;
                      });
                    },
                    items: <String>['\$', '€']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 10),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                        mode
                            ? Icons.dark_mode_outlined
                            : Icons.light_mode_outlined,
                        size: 30),
                    onPressed: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      LocaleKeys.theme_text.tr(),
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  new Spacer(), // I just added one line

                  DropdownButton<String>(
                    value: modes,
                    elevation: 16,
                    style: const TextStyle(color: Colors.grey),
                    onChanged: (String newValue) {
                      setState(() {
                        modes = newValue;
                        mode = !mode;
                      });
                      if (mode) {
                        MyApp.of(context).changeTheme(ThemeMode.dark);
                      } else {
                        MyApp.of(context).changeTheme(ThemeMode.light);
                      }
                    },
                    items: <String>['Dark', 'Light']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 10),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.support_agent_outlined, size: 30),
                    onPressed: () {
                      setState(() {
                        // mode = !mode;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Support',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 10),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.info_outline, size: 30),
                    onPressed: () {
                      showMaterialModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                  'This is a travel applications made my Safa Deldoul.',
                                  style: TextStyle(fontSize: 15)),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      LocaleKeys.about_txt.tr(),
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 10),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.policy_outlined, size: 30),
                    onPressed: () {
                      showMaterialModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text('Policy here',
                                  style: TextStyle(fontSize: 15)),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      LocaleKeys.privacy_txt.tr(),
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 10),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.logout_outlined,
                        size: 30, color: Colors.pink[100]),
                    onPressed: () {
                      setState(() {
                        // mode = !mode;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      LocaleKeys.logout_txt.tr(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
