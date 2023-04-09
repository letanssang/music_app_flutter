import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_app_flutter/screens/auth/widgets/email_field.dart';
import 'package:music_app_flutter/screens/auth/widgets/password_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:music_app_flutter/screens/auth/widgets/submit_button.dart';
import 'package:music_app_flutter/widgets/trans_black_background.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordKey = GlobalKey<FormFieldState>();
  final _emailKey = GlobalKey<FormFieldState>();

  Future<void> _login() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text,
        );
        Navigator.of(context).pop();
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message!),
          ),
        );
      } on PlatformException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message!),
          ),
        );
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: transBlackBackground(
        Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const Text('Email or username',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25)),
          const SizedBox(height: 10),
          EmailField(formKey: _emailKey,
            controller: _emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!value.contains('@')) {
                return 'Please enter a valid email';
              }
              return null;
            },),
          const SizedBox(height: 20),
          const Text(
            'Password',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
          const SizedBox(height: 10),
          PasswordField(formKey: _passwordKey,
            controller: _passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 8) {
                return 'Password must be at least 8 characters';
              }
              return null;
            },),
          const SizedBox(height: 20),
          SubmitButton('Login', onPressed: _login),
            ],
          ),
        ),
      ),
    );
  }
}
