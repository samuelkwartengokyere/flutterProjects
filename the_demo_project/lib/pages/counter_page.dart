import 'package:flutter/material.dart';

class COUNTERPAGE extends StatefulWidget{
  COUNTERPAGE({super.key});

  @override
  State<COUNTERPAGE> createState() => _COUNTERPAGEState();
}

class _COUNTERPAGEState extends State<COUNTERPAGE> {
  // Variable to for counter
  int _counter = 0;

  // Method for increment
  void _increment(){
    setState(() {
      _counter++;
    });
  }

  //UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('the demo app'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You push the button this times'),

            Text(
              _counter.toString(),
              style: TextStyle(fontSize: 40),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
                onPressed: _increment,
                child: Text('Click Me',style: TextStyle(color: Colors.white),)
            ),

          ],
        ),
      ),
    );
  }
}