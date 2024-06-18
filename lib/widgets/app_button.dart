import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  AppButton({super.key, required this.text, required this.onPressed});
  
  String text;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        padding: EdgeInsets.all(16),
      ),
      child: Text(
        text, 
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
        ),
    );
  }
}