import 'package:flutter/material.dart';

class HOMEPAGE extends StatelessWidget{
  HOMEPAGE({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('Home Page')),
      ),
      body: Center(child: Text('My Home Page')),
    );
  }

}