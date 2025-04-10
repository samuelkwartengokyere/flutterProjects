import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:ui';

void main() {
  runApp(const Piano());
}

class Piano extends StatelessWidget {
  const Piano({super.key});

  @override
  Widget build(BuildContext context) {

    void playSound(int soundKey){
      final player = AudioPlayer();
      player.play(AssetSource('note$soundKey.wav'));
    }

    Expanded buildKey({int? keyNumber, Color? color, String? key}){
      return Expanded(
        child: FilledButton(
          style: FilledButton.styleFrom(backgroundColor: color),
          onPressed: (){
            playSound(keyNumber!);
          },
          child: Text(key!),
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Center(child: Text('Piano', style: TextStyle(color: Colors.white),)),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(keyNumber: 1, color: Colors.red, key: 'Do'),
              buildKey(keyNumber: 2, color: Colors.tealAccent, key: 'Re'),
              buildKey(keyNumber: 3, color: Colors.amberAccent, key: 'Mi'),
              buildKey(keyNumber: 4, color: Colors.blue, key: 'Fa'),
              buildKey(keyNumber: 5, color: Colors.pinkAccent, key: 'So'),
              buildKey(keyNumber: 6, color: Colors.indigo, key: 'La'),
              buildKey(keyNumber: 7, color: Colors.purpleAccent, key: 'Ti'),
            ],
          ),
        ),
      ),
    );
  }
}
