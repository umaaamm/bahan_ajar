import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;

  CustomButton({required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        buttonText,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20)),
    );
  }
}
