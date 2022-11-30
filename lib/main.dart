import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const PianoApp());
}

class PianoApp extends StatelessWidget {
  const PianoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Piano Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Piano(),
    );
  }
}

class Piano extends StatefulWidget {
  const Piano({Key? key}) : super(key: key);

  @override
  State<Piano> createState() => _PianoState();
}

class _PianoState extends State<Piano> {
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  void playSound(int soundNumber) {
    audioPlayer.open(
      Audio("asset/audio/$soundNumber.wav"),
    );
  }

  void stopSound() {
    audioPlayer.stop();
  }

  InkWell myInkWell(Color color, soundNumber) {
    return InkWell(
      child: Ink(
        color: color,
      ),
      onTapDown: (details) {
        if (audioPlayer.isPlaying==true) {
          audioPlayer.stop();
        }
        playSound(soundNumber);
      },
    );
  }

  Expanded buildWhiteKey({required int soundNumber}) {
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.only(bottom: 1.0),
          child: myInkWell(Colors.white, soundNumber)),
    );
  }

  Expanded buildBlackKey({required int soundNumber}) {
    return Expanded(
      child: Container(
          margin: const EdgeInsets.only(bottom: 30.0, top: 30.0, left: 180.0),
          child: myInkWell(Colors.black, soundNumber)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Semantics(
            button: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildWhiteKey(soundNumber: 1),
                buildWhiteKey(soundNumber: 2),
                buildWhiteKey(soundNumber: 3),
                buildWhiteKey(soundNumber: 4),
                buildWhiteKey(soundNumber: 5),
                buildWhiteKey(soundNumber: 6),
                buildWhiteKey(soundNumber: 7),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60, bottom: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildBlackKey(soundNumber: 7),
                buildBlackKey(soundNumber: 5),
                buildBlackKey(soundNumber: 4),
                buildBlackKey(soundNumber: 1),
                buildBlackKey(soundNumber: 3),
                buildBlackKey(soundNumber: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
