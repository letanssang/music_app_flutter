import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  VoidCallback? onPressed;
  String textInButton = '';
  SubmitButton(this.textInButton, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: Colors.white,
      ),
      child: Center(
        child: TextButton(onPressed: onPressed,
          child: Text(textInButton, style: TextStyle(color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
