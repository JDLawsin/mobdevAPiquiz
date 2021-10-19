import 'package:apiquiz/pages/profile.dart';
import 'package:apiquiz/pages/setting.dart';
import 'package:flutter/material.dart';
import 'package:apiquiz/pages/dashboard.dart';
import 'package:apiquiz/pages/login.dart';

final Map<String, WidgetBuilder> routes = {
  Login.routeName: (BuildContext context) => const Login(),
  Dashboard.routeName: (BuildContext context) => const Dashboard(),
  Setting.routeName: (BuildContext context) => const Setting(),
  Profile.routeName: (BuildContext context) => const Profile(),
};
