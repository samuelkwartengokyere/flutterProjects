import 'package:flutter/material.dart';
import 'package:navigation2/pages/first-page.dart';
import 'package:navigation2/pages/home_page.dart';
import 'package:navigation2/pages/settings_page.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
      routes: {
        '/firstpage' :(context) => FirstPage(),
        '/homepage' :(context) => HOMEPAGE(),
        '/settingspage' :(context) => SETTINGSPAGE(),
      },
    );
  }
}
