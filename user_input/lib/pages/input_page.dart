import 'package:flutter/material.dart';

class TODOPAGE extends StatefulWidget{
  TODOPAGE({super.key});

  @override
  State<TODOPAGE> createState() => _TODOPAGEState();
}

class _TODOPAGEState extends State<TODOPAGE> {

  // text editing controller to access what the user typed
  TextEditingController myController = TextEditingController();

  String greetMessage = '';
  // the greet user method
  void greetUser(){
    String userName = myController.text;
    setState(() {
      greetMessage = "Hi, "+ userName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(greetMessage),

                TextField(
                    controller: myController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Type your name....',
                  ),
                ),

                //button
                ElevatedButton(onPressed: greetUser, child: Text('Tap'))
              ],
            ),
          ),
      )
    );
  }
}