import 'package:flutter/material.dart';

class UploadContentScreen extends StatelessWidget {
  const UploadContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final contentController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Upload Content')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: contentController,
              decoration: const InputDecoration(labelText: 'Enter Announcement or Media URL'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Placeholder for upload logic
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Content uploaded successfully!')),
                );
              },
              child: const Text('Upload'),
            ),
          ],
        ),
      ),
    );
  }
}