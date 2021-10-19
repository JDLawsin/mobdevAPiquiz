import 'dart:convert';
import 'package:apiquiz/pages/profile.dart';
import 'package:apiquiz/pages/setting.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:apiquiz/model/agent.dart';

String? stringResponse;

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  static const String routeName = "dashboard";

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late Future<Agent> futureAgent;
  final PageController controller = PageController(initialPage: 0);

  get future => null;
  @override
  void initState() {
    super.initState();
    futureAgent = fetchAgent();
  }

  Future<Agent> fetchAgent() async {
    http.Response response;
    response = await http.get(Uri.parse("https://valorant-api.com/v1/agents"));
    if (response.statusCode == 200) {
      return Agent.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load agent');
    }
  }

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
                case 'Profile':
                  Navigator.pushNamed(context, Profile.routeName);
                  break;
                case 'Settings':
                  Navigator.pushNamed(context, Setting.routeName);
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return {'Profile', 'Settings'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: FutureBuilder<Agent>(
        future: futureAgent,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PageView.builder(
                itemCount: snapshot.data!.agentinfo.length,
                controller: controller,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      Image.network(
                          snapshot.data!.agentinfo[index].bustPortrait),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Text(snapshot.data!.agentinfo[index].displayName),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        snapshot.data!.agentinfo[index].description,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  );
                });
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
