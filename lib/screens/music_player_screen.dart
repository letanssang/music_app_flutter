import 'package:flutter/material.dart';
import '../widgets/trans_black_background.dart';
import '../services/audio_player_manager.dart';

class MusicPlayerScreen extends StatefulWidget {
  static const routeName = '/music-player';

  const MusicPlayerScreen({Key? key}) : super(key: key);

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  var audioPlayerManager = AudioPlayerManager();
  bool isPlaying =  false;
  Duration duration = const Duration();
  Duration position = const Duration();
  String _formatDuration(Duration d) {
    var seconds = d.inSeconds;
    final days = seconds~/Duration.secondsPerDay;
    seconds -= days*Duration.secondsPerDay;
    final hours = seconds~/Duration.secondsPerHour;
    seconds -= hours*Duration.secondsPerHour;
    final minutes = seconds~/Duration.secondsPerMinute;
    seconds -= minutes*Duration.secondsPerMinute;

    final List<String> tokens = [];
    if (days != 0) {
      tokens.add('${days}d');
    }
    if (tokens.isNotEmpty || hours != 0){
      tokens.add('$hours');
    }
      tokens.add('$minutes');
      tokens.add('$seconds');

    return tokens.join(':');
  }
  Future<void> _loadingMusic() async {
    await audioPlayerManager.play(
        'https://firebasestorage.googleapis.com/v0/b/music-app-flutter-letansang.appspot.com/o/test%2FQueen%20%20Bohemian%20Rhapsody%20Official%20Video%20Remastered_320kbps.mp3?alt=media&token=986db7f1-5553-48d5-9f3c-885e767bdc6b');
    var audioDuration = await audioPlayerManager.getDuration();
    setState(() {
      duration = audioDuration ?? const Duration();
    });
    audioPlayerManager.onPositionChanged((event) {
      setState(() {
        position = event;
      });
    });
  }
  @override
  void initState() {
    isPlaying = audioPlayerManager.isPlaying();
    super.initState();
    _loadingMusic();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: transBlackBackground(
        SingleChildScrollView(
          child: Column(children: [
            Row(children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ]),
            Container(
              height: 300,
              width: 300,
              margin: const EdgeInsets.only(bottom: 20, top: 20),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/queen.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Image(
                image: const AssetImage('assets/images/queen.jpg'),
              ),
            ),
            const Text(
              'Song Name',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Artist Name',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            Slider(
              value: position.inSeconds.toDouble(),
              min: 0,
              max: duration.inSeconds.toDouble(),
              inactiveColor: Colors.white70,
              activeColor: Colors.white,
              onChanged: (double value) {
                setState(() {
                  audioPlayerManager.seek(Duration(seconds: value.toInt()));
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatDuration(position),
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                Text(
                  _formatDuration(duration),
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: IconButton(
                    icon: const Icon(Icons.shuffle, size: 30),
                    onPressed: () {},
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.skip_previous, size: 50),
                  onPressed: () {},
                ),
                IconButton(
                  icon: isPlaying ? const Icon(Icons.pause_circle_filled, size: 60)
                      : const Icon(Icons.play_circle_fill, size: 60),
                  onPressed: () async {
                    if (isPlaying){
                      audioPlayerManager.pause();
                    } else {
                      audioPlayerManager.resume();
                    }
                    setState(() {
                      isPlaying = !isPlaying;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next, size: 50),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.repeat, size: 30),
                  onPressed: () {},
                ),
              ],
            ),
            Container(
              height: 100,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 50),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.purple,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
