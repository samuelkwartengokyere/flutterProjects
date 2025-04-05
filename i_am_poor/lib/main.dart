import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Center(child: Text('I am poor')),
        backgroundColor: Colors.blue[400],
      ),
      body: Center(
        child: Image(
          image: AssetImage('images/i_am_poor2.jpg'),
        ),
      ),
    ),
  ),);
}