import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(height: 600.0, width: 100, color: Colors.red),
              SizedBox(width: 20.0),
              Container(
                height: 100,
                width: 100,
                color: Colors.yellow,
                margin: EdgeInsets.only(left: 40),
              ),
              SizedBox(width: 20.0),
              Container(
                height: 600,
                width: 100,
                color: Colors.blue,
                margin: EdgeInsets.only(left: 40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
