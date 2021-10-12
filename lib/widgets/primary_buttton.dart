import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final IconData? iconData;
  final Function onPress;

  PrimaryButton(
      {required this.text, @required this.iconData, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: double.maxFinite,
      height: 100.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            primary: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0))),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 17.0),
            )
          ],
        ),
      ),
    );
  }
}