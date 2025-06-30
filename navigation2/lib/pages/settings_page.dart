import 'package:flutter/material.dart';

class SETTINGSPAGE extends StatelessWidget{
  const SETTINGSPAGE({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('Settings Page')),
      ),
      body: Center(child: Text('My Settings Page'))
    );
  }
}