import 'package:apiquiz/pages/dashboard.dart';
import 'package:apiquiz/pages/setting.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  static const String routeName = "profile";

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                case 'Settings':
                  Navigator.pushNamed(context, Setting.routeName);
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return {'Dashboard', 'Settings'}.map((String choice) {
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
        child: Text(
          "I am Joshua Lawsin and I love to play FPS, MOBA and MMORPG games!",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
