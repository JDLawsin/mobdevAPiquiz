import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData iconData;
  final TextEditingController? textEditingController;
  final bool obscureText;
  final Function onTap;
  final String? Function(String?)? validation;

  const PasswordField(
      {Key? key,
      required this.labelText,
      required this.hintText,
      required this.iconData,
      this.textEditingController,
      required this.obscureText,
      required this.onTap,
      required this.validation})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: obscureText,
      validator: validation,
      decoration: InputDecoration(
        prefixIcon: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: const Icon(Icons.lock),
        ),
        suffixIcon: InkWell(
          onTap: onTap(),
          child: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
        ),
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
    );
  }
}
