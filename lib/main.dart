import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  /// Initialise audio cache
  static AudioCache player = AudioCache();

  @override
  Widget build(BuildContext context) {
    var noteArr = [];

    /// play a note depending on it's file name
    void playNote(num) {
      player.play('note$num.wav');
    }

    /// Create an array between 1 and 7
    for (var i = 0; i < 7; i++) {
      noteArr.add(i + 1);
    }

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              for (var item in noteArr)
                FlatButton(
                  color: Color(Random().nextInt(0xffffffff)),
                  onPressed: () => playNote(item),
                  child: Text("Note $item"),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
