import 'package:flutter/material.dart';

class LoginPublishingHistoryPage extends StatelessWidget {
  const LoginPublishingHistoryPage({super.key});

  final List<Map<String, String>> loginHistory = const [
    {
      'user': 'Lecturer A',
      'action': 'Login',
      'timestamp': '2025-07-18 09:14 AM',
    },
    {
      'user': 'Student B',
      'action': 'Login',
      'timestamp': '2025-07-18 09:55 AM',
    },
    {
      'user': 'Admin',
      'action': 'Published Ad: Orientation 2025',
      'timestamp': '2025-07-17 02:11 PM',
    },
    {
      'user': 'Lecturer C',
      'action': 'Published Event: Guest Lecture',
      'timestamp': '2025-07-16 10:23 AM',
    },
  ];

  Icon _getIcon(String action) {
    if (action.contains('Login')) {
      return const Icon(Icons.login, color: Colors.green);
    } else {
      return const Icon(Icons.publish, color: Colors.blue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6F0),
      appBar: AppBar(
        title: const Text('Login & Publishing History',style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF3F51B5),
        iconTheme: const IconThemeData(color: Color(0xFFFDF6F0)),
        foregroundColor: Colors.white,
      ),
      // backgroundColor: const Color(0xFFF5F7FA),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: loginHistory.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final entry = loginHistory[index];
            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: _getIcon(entry['action']!),
                title: Text(
                  entry['action']!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    'User: ${entry['user']}\nTime: ${entry['timestamp']}',
                    style: const TextStyle(height: 1.4),
                  ),
                ),
                isThreeLine: true,
              ),
            );
          },
        ),
      ),
    );
  }
}
