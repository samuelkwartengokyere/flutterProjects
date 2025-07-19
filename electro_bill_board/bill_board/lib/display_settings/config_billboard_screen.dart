import 'package:flutter/material.dart';

class ConfigureScreensPage extends StatefulWidget {
  const ConfigureScreensPage({super.key});

  @override
  State<ConfigureScreensPage> createState() => _ConfigureScreensPageState();
}

class _ConfigureScreensPageState extends State<ConfigureScreensPage> {
  final List<String> screens = ['Screen 1', 'Screen 2', 'Screen 3'];
  final List<String> contents = ['Ad 1', 'Ad 2', 'Video 1', 'Video 2'];

  final Map<String, String> screenContentMap = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6F0),
      appBar: AppBar(
        title: const Text("Configure Billboard Screens",style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF3F51B5),
        iconTheme: const IconThemeData(color: Color(0xFFFDF6F0)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: screens.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final screen = screens[index];
            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.tv, color: Colors.blueAccent),
                        const SizedBox(width: 10),
                        Text(
                          screen,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Current Content: ${screenContentMap[screen] ?? 'None'}",
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      value: screenContentMap[screen],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      ),
                      hint: const Text("Select Content"),
                      items: contents.map((content) {
                        return DropdownMenuItem<String>(
                          value: content,
                          child: Text(content),
                        );
                      }).toList(),
                      onChanged: (selectedContent) {
                        setState(() {
                          screenContentMap[screen] = selectedContent!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
