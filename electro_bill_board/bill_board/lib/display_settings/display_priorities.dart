import 'package:flutter/material.dart';

class DisplayPriorityPage extends StatefulWidget {
  const DisplayPriorityPage({super.key});

  @override
  State<DisplayPriorityPage> createState() => _DisplayPriorityPageState();
}

class _DisplayPriorityPageState extends State<DisplayPriorityPage> {
  List<String> contentItems = [
    'Emergency Alert',
    'University Announcement',
    'Event Promotion',
    'General Advertisement',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6F0),
      appBar: AppBar(
        title: const Text('Set Display Priorities',style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF3F51B5),
        iconTheme: const IconThemeData(color: Color(0xFFFDF6F0)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ReorderableListView.builder(
          itemCount: contentItems.length,
          onReorder: (oldIndex, newIndex) {
            setState(() {
              if (newIndex > oldIndex) newIndex--;
              final item = contentItems.removeAt(oldIndex);
              contentItems.insert(newIndex, item);
            });
          },
          itemBuilder: (context, index) {
            final item = contentItems[index];
            return Card(
              key: ValueKey(item),
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.deepPurpleAccent,
                  child: Text('${index + 1}', style: const TextStyle(color: Colors.white)),
                ),
                title: Text(item, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                trailing: const Icon(Icons.drag_handle, color: Colors.grey),
              ),
            );
          },
        ),
      ),
    );
  }
}
