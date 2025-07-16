import 'package:bill_board/pages/admi_login_page.dart';
import 'package:bill_board/pages/admi_sign_up_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Electronic Billboard Admin',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const LoginScreen(),

      routes: {
        '/admi_signup': (context)=> SignupScreen()
      },
    );
  }
}
