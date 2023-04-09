import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  String textInButton = '';
  String? imageName;

  LoginButton(this.textInButton, {this.imageName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(textInButton == 'Sign up free')
          Navigator.of(context).pushNamed('/signup');
        else
          Navigator.of(context).pushNamed('/login');
      },
      child: Container(
        height: 50,
        width: 275,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.purple,
        ),
        child: ListTile(
          leading: imageName != null
              ? Image.asset(
                  'assets/images/icons/$imageName.png',
                  height: 25,
                  width: 25,
                )
              : SizedBox(width: 25, height: 25),
          title: Text(
            textInButton,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      )
    );
  }
}
