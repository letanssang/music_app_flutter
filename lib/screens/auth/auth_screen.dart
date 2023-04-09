import 'package:flutter/material.dart';
import 'package:music_app_flutter/widgets/trans_black_background.dart';

import 'widgets/login_button.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: transBlackBackground(
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                  image: AssetImage('assets/images/voice.png'),
                  width: 100,
                  height: 100),
              const SizedBox(height: 50),
              const Text('Music Player App',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const Text('letansang',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontStyle: FontStyle.italic)),
              const SizedBox(height: 100),
              LoginButton('Sign up free'),
              const SizedBox(height: 10),
              LoginButton('Continue with Google', imageName: 'google'),
              const SizedBox(height: 10),
              LoginButton('Continue with Facebook', imageName: 'facebook'),
              const SizedBox(height: 10),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/login');
                  },
                  child: const Text('Login', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)))
            ],
          ),
        ),
      ),
    );
  }
}
