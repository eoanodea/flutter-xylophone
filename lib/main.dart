import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  /// Initialise audio cache
  static AudioCache player = AudioCache();

  /// Create a list of colours
  final List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.lime,
    Colors.teal,
    Colors.blue,
    Colors.purple
  ];

  @override
  Widget build(BuildContext context) {
    /// play a note depending on it's file name
    /// expects an integer as a parameter
    void playNote(int num) {
      player.play('note$num.wav');
    }

    /// Renders a single key to the screen
    Widget renderKey(int i) {
      return Expanded(
        child: FlatButton(
          color: colors[i - 1],
          onPressed: () => playNote(i),
          child: Text(''),
        ),
      );
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[for (var i = 1; i < 9; i++) renderKey(i)],
        ),
      ),
    );
  }
}
