import 'package:apiquiz/pages/dashboard.dart';
import 'package:apiquiz/validate/loginvalidate.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  static const String routeName = "login";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with LoginValidate {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  bool obscureText = true;

  void togglePassword() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(children: [
              const SizedBox(
                height: 40.0,
                child: Text(
                  "Valorant Information from valorant-api.com",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: const Icon(Icons.person),
                      ),
                      labelText: "Username",
                      hintText: "Input username",
                      border: const OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0)))),
                  validator: (user) {
                    List<String?> resp = [
                      "Special characters are now allowed!",
                      "Please fill in the user field",
                      null
                    ];
                    if (user!.isEmpty) {
                      return resp[1];
                    }

                    if (!user.contains(RegExp(r'^[A-Za-z0-9\s_]+$'))) {
                      return resp[0];
                    }

                    return resp[2];
                  }),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                  obscureText: obscureText,
                  decoration: InputDecoration(
                      prefixIcon: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: const Icon(Icons.lock),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: togglePassword,
                        child: Icon(obscureText
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                      labelText: "Password",
                      hintText: "Input Password",
                      border: const OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0)))),
                  validator: (user) {
                    List<String?> resp = [
                      "Please fill in the password field",
                      null
                    ];
                    if (user!.isEmpty) {
                      return resp[0];
                    }
                    return resp[1];
                  }),
              const SizedBox(
                height: 20.0,
              ),
              ButtonTheme(
                minWidth: double.maxFinite,
                height: 100.0,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 20.0),
                      primary: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, Dashboard.routeName);
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.login),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "Login",
                          style: TextStyle(fontSize: 17.0),
                        )
                      ],
                    )),
              )
            ]),
          ),
        ),
      ),
    ));
  }
}
