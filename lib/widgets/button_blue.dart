import 'package:flutter/material.dart';

class ButtonBlue extends StatelessWidget {
  final String text;
  final Function()? onPressed;

  const ButtonBlue({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Container(
              height: 55,
              width: double.infinity,
              child: Center(
                  child: Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ))),
        ));
  }
}
