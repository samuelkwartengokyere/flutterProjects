import 'package:flutter/material.dart';

class SystemStatusPage extends StatelessWidget {
  const SystemStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> logs = [
      "[12:01] Billboard 1 Online",
      "[12:05] Uploaded New Content",
      "[12:15] Billboard 2 Offline",
      "[12:30] Scheduled Maintenance Started",
      "[13:00] Maintenance Completed",
      "[13:15] Billboard 2 Online",
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFDF6F0),
      appBar: AppBar(
        title: const Text("System Status & Logs",style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF3F51B5),
        iconTheme: const IconThemeData(color: Color(0xFFFDF6F0)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Billboard Status",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: const [
                _StatusChip(label: "Billboard 1", isOnline: true),
                SizedBox(width: 10),
                _StatusChip(label: "Billboard 2", isOnline: true),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              "Activity Logs",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemCount: logs.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final log = logs[index];
                  final timestampMatch = RegExp(r"\[(.*?)\]").firstMatch(log);
                  final timestamp = timestampMatch?.group(1) ?? "";
                  final message = log.replaceFirst("[$timestamp]", "").trim();

                  return ListTile(
                    leading: const Icon(Icons.history, color: Colors.blueGrey),
                    title: Text(message),
                    subtitle: Text("Time: $timestamp"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String label;
  final bool isOnline;

  const _StatusChip({
    required this.label,
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    final color = isOnline ? Colors.green : Colors.red;
    final statusText = isOnline ? "Online" : "Offline";

    return Chip(
      avatar: CircleAvatar(
        backgroundColor: color,
        radius: 6,
      ),
      label: Text("$label: $statusText"),
      backgroundColor: color.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}
