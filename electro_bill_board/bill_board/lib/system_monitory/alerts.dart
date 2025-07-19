import 'package:flutter/material.dart';

class SystemAlertsPage extends StatelessWidget {
  const SystemAlertsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> alerts = [
      {"time": "14:10", "message": "Billboard 2 has gone offline."},
      {"time": "15:30", "message": "Content upload failed on Billboard 1."},
      {"time": "16:00", "message": "Billboard 3 is back online."},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFDF6F0),
      appBar: AppBar(
        title: const Text("System Alerts",style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF3F51B5),
        iconTheme: const IconThemeData(color: Color(0xFFFDF6F0)),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: alerts.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final alert = alerts[index];
          final message = alert["message"]!;
          final time = alert["time"]!;
          final isOffline = message.contains("offline");
          final isOnline = message.contains("back online");

          Color color = Colors.orange;
          IconData icon = Icons.warning_amber;

          if (isOffline) {
            color = Colors.red;
            icon = Icons.wifi_off;
          } else if (isOnline) {
            color = Colors.green;
            icon = Icons.check_circle;
          } else {
            color = Colors.amber[800]!;
            icon = Icons.cloud_upload;
          }

          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: color),
            ),
            child: ListTile(
              leading: Icon(icon, color: color),
              title: Text(message,
                  style: const TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text("Time: $time"),
            ),
          );
        },
      ),
    );
  }
}
