import 'package:audioplayers/audioplayers.dart';

class AudioPlayerManager {
  static final AudioPlayerManager _instance = AudioPlayerManager._internal();

  factory AudioPlayerManager() {
    return _instance;
  }

  AudioPlayerManager._internal();

  final AudioPlayer _audioPlayer = AudioPlayer();
  String _currentUrl = '';

  Future<void> play(String url) async {
    if (_currentUrl == url) {
      await _audioPlayer.resume();
      return;
    }
    if(_audioPlayer.state == PlayerState.playing) {
      await _audioPlayer.stop();
    }
    await _audioPlayer.setSourceUrl(url);
    await _audioPlayer.resume();
    _currentUrl = url;
  }
  Future<void> resume() async {
    await _audioPlayer.resume();
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
  }

  Future<Duration?> getDuration() async {
    return await _audioPlayer.getDuration();
  }

  Future<Duration?> getCurrentPosition() async {
    return await _audioPlayer.getCurrentPosition();
  }

  Future<void> seek(Duration position) async {
    await _audioPlayer.seek(position);
  }
  void onPositionChanged(Function f) async {
    _audioPlayer.onPositionChanged.listen((event) {
      f(event);
    });
  }
  bool isPlaying() => _audioPlayer.state == PlayerState.playing;

}
