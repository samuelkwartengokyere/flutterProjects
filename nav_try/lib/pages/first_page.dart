import 'package:flutter/material.dart';
import 'package:nav_try/pages/home_page.dart';

class FIRSTPAGE extends StatelessWidget{
    FIRSTPAGE({super.key});


    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('First Page', style: TextStyle(color: Colors.white),)),
        backgroundColor: Colors.blue,
      ),
       body: Center(
         child: ElevatedButton(
           style: ElevatedButton.styleFrom(
             backgroundColor: Colors.blue,
           ),
           onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> HOMEPAGE()));
           },
           child: Text('Go to home page',style: TextStyle(color: Colors.white),),
         ),
       ),
    );
  }

}