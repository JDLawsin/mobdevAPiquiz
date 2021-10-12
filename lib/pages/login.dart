import 'package:apiquiz/widgets/custom_textform_field.dart';
import 'package:apiquiz/widgets/password_field.dart';
import 'package:apiquiz/widgets/primary_buttton.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              CustomTextFormField(
                  labelText: "Email Address",
                  hintText: "Enter a valid email",
                  iconData: Icons.email,
                  textEditingController: emailTextController,
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 20.0,
              ),
              PasswordField(
                  labelText: "Password",
                  hintText: "Enter your password",
                  iconData: Icons.password,
                  obscureText: obscureText,
                  onTap: () => togglePassword),
              const SizedBox(
                height: 20.0,
              ),
              PrimaryButton(
                  text: "Login", iconData: Icons.login, onPress: () {})
            ],
          ),
        ),
      ),
    ));
  }
}
