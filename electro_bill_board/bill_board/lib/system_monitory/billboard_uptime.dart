import 'package:flutter/material.dart';

class MonitorUptimePage extends StatelessWidget {
  const MonitorUptimePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> billboards = [
      {"name": "Billboard 1", "status": "Online", "uptime": "99.9"},
      {"name": "Billboard 2", "status": "Offline", "uptime": "97.5"},
      {"name": "Billboard 3", "status": "Online", "uptime": "98.7"},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFDF6F0),
      appBar: AppBar(
        title: const Text("Monitor Billboard Uptime",style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF3F51B5),
        iconTheme: const IconThemeData(color: Color(0xFFFDF6F0)),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: billboards.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final board = billboards[index];
          final name = board["name"]!;
          final status = board["status"]!;
          final uptime = double.parse(board["uptime"]!);

          final isOnline = status == "Online";
          final color = isOnline ? Colors.green : Colors.red;
          final icon = isOnline ? Icons.check_circle : Icons.error;

          return Container(
            decoration: BoxDecoration(
              color: color.withOpacity(0.06),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: color),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.15),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(icon, color: color),
                    const SizedBox(width: 10),
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        status,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text("Uptime: ${uptime.toStringAsFixed(1)}%"),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: uptime / 100,
                    backgroundColor: Colors.grey[300],
                    color: color,
                    minHeight: 8,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
