import 'package:apiquiz/pages/dashboard.dart';
import 'package:apiquiz/pages/profile.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);
  static const String routeName = "setting";

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(5, 128, 128, 128),
      appBar: AppBar(
        centerTitle: true,
        leading: Image.asset('assets/images/val-logo.png'),
        backgroundColor: const Color.fromARGB(255, 255, 0, 0),
        title: const Text("Agent"),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String value) {
              switch (value) {
                case 'Dashboard':
                  Navigator.pushNamed(context, Dashboard.routeName);
                  break;
                case 'Profile':
                  Navigator.pushNamed(context, Profile.routeName);
                  break;
                case 'Logout':
                  Navigator.popUntil(context, (route) => route.isFirst);
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return {'Dashboard', 'Profile', 'Logout'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: const Center(
        child: Text("Logout available to the popupmenuitem selection!"),
      ),
    );
  }
}
