import 'package:first_pro/pages/second_page.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget{
  FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('My first page')),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
            onPressed: (){
              Navigator.pushNamed(context, '/secondpage');
            },
            child: Text('Go to Second Page',style: TextStyle(color: Colors.white,),),
        ),
      ),
    );
  }
}