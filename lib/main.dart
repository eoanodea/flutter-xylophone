import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  /// Initialise audio cache
  static AudioCache player = AudioCache();

  /// Create a list of colours
  final List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.purple
  ];

  @override
  Widget build(BuildContext context) {
    var noteArr = [];

    /// play a note depending on it's file name
    /// expects an integer as a parameter
    void playNote(int num) {
      player.play('note$num.wav');
    }

    /// Create an array between 1 and 7
    for (var i = 0; i < 7; i++) {
      noteArr.add(i + 1);
    }

    return MaterialApp(
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            for (var item in noteArr)
              Expanded(
                child: FlatButton(
                    color: colors[item - 1],
                    onPressed: () => playNote(item),
                    child: Text('')),
              )
          ],
        ),
      ),
    );
  }
}
