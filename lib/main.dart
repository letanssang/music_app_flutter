import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_app_flutter/screens/auth/login_screen.dart';
import 'package:music_app_flutter/screens/auth/signup_screen.dart';
import 'package:music_app_flutter/screens/music_player_screen.dart';
import 'package:music_app_flutter/screens/settings_screen.dart';
import 'package:music_app_flutter/widgets/trans_black_background.dart';

import 'screens/auth/auth_screen.dart';
import 'screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.white,
          fontFamily: 'Montserrat',
          iconTheme: const IconThemeData(color: Colors.white),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: Colors.white),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),

          )
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(
                body: transBlackBackground(
                  const CircularProgressIndicator(),
                ),
              );
            } else if (snapshot.hasData) {
              return const HomeScreen();
            } else if (snapshot.hasError) {
              return Scaffold(
                body: transBlackBackground(
                  const Center(
                    child: Text('Something went wrong'),
                  ),
                ),
              );
            } else {
              return const AuthScreen();
            }
          },
        ),
        routes: {
          LoginScreen.routeName: (context) => const LoginScreen(),
          SignupScreen.routeName: (context) => const SignupScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          SettingsScreen.routeName: (context) => const SettingsScreen(),
          MusicPlayerScreen.routeName: (context) => const MusicPlayerScreen(),
        });
  }
}
