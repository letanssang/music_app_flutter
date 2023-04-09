import 'package:flutter/material.dart';

import '../screens/music_player_screen.dart';

class SongItem extends StatelessWidget {
  const SongItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(MusicPlayerScreen.routeName);
      },
      leading: const CircleAvatar(
        backgroundImage: AssetImage('assets/images/queen.jpg'),
      ),
      title: const Text(
        'Song Name',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: const Text('Artist Name',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontStyle: FontStyle.italic,
          )),
      trailing: const Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
    );
  }
}
