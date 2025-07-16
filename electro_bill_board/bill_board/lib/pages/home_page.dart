import 'package:bill_board/pages/uploadContent_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text('Admin Dashboard')
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Upload Billboard Content'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const UploadContentScreen()),
            );
          },
        ),
      ),
    );
  }
}