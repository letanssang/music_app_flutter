import 'package:flutter/material.dart';
import 'package:music_app_flutter/widgets/song_item.dart';

import 'mix_playlist_item.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({Key? key}) : super(key: key);

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  final dateTimeNow = DateTime.now();

  String _greeting() {
    if (dateTimeNow.hour < 12) {
      return 'Good Morning';
    } else if (dateTimeNow.hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            Text(
              _greeting(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const Spacer(flex: 2,),
            const IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.notifications,
                  size: 25,
                  color: Colors.white,
                )),
            const IconButton(
                onPressed: null,
                icon: Icon(Icons.history, size: 25, color: Colors.white)),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/settings');
                },
                icon: Icon(
                  Icons.settings,
                  size: 25,
                  color: Colors.white,
                )),
          ],
        ),
        const Text('Made For You',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        const SizedBox(height: 25,),
        Container(
          height: 150,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => const MixPlaylistItem(),
              separatorBuilder: (context, index) => const SizedBox(
                    width: 20,
                  ),
              itemCount: 10),
        ),
        const SizedBox(height: 25,),
        const Text('Recently Played',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        const SizedBox(height: 25,),
        Expanded(
          child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => const SongItem(),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
              itemCount: 10),
        ),
      ],
    );
  }
}
