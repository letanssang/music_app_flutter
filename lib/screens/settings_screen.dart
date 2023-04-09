import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_app_flutter/widgets/trans_black_background.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Settings'),
      ),
      body: transBlackBackground(
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const ListTile(
            leading: CircleAvatar(
                child: Image(image: AssetImage('assets/images/queen.jpg'))),
            title: Text(
              'User Name',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            subtitle: Text('View profile',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                )),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          const Text(
            'Other',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          ListTile(
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.of(context).pop();
            },
            title: const Text(
              'Log out',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            subtitle: const Text('You are logged in as User Name',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                )),
          )
        ]),
      ),
    );
  }
}
