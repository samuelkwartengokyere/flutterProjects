import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget{
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Second Page')),
      ),
      body: Container(
        color: Colors.blue[100],
      ),
    );
  }
}