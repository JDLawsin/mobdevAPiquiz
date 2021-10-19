import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final IconData? iconData;
  final TextEditingController textEditingController;
  final TextInputType? textInputType;
  final String? Function(String?)? validation;

  const CustomTextFormField(
      {Key? key,
      @required this.labelText,
      @required this.hintText,
      @required this.iconData,
      required this.textEditingController,
      @required this.textInputType,
      @required this.validation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: textInputType,
      validator: validation,
      decoration: InputDecoration(
        prefixIcon: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Icon(iconData),
        ),
        labelText: labelText,
        hintText: hintText,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
      ),
    );
  }
}
