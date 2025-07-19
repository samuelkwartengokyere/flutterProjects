import 'package:bill_board/content_managment/upload_im_vid.dart';
import 'package:bill_board/drawer_pages/create_space_page.dart';
import 'package:bill_board/utilities/admi_login_page.dart';
import 'package:bill_board/pages/admi_page.dart';
import 'package:bill_board/utilities/admi_sign_up_page.dart';
import 'package:bill_board/utilities/login_page.dart';
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
      home: const GeneralLoginPage(),//LoginScreen(),//AdministratorPage(),

      routes: {
        '/admi_signup': (context)=> SignupScreen()
      },
    );
  }
}
