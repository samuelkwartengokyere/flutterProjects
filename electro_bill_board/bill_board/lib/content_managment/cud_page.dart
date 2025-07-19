import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Announcement {
  final String title;
  final String description;
  final DateTime date;

  Announcement({
    required this.title,
    required this.description,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'date': date.toIso8601String(),
  };

  factory Announcement.fromJson(Map<String, dynamic> json) => Announcement(
    title: json['title'],
    description: json['description'],
    date: DateTime.parse(json['date']),
  );
}

class AnnouncementPage extends StatefulWidget {
  const AnnouncementPage({super.key});

  @override
  State<AnnouncementPage> createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {
  List<Announcement> announcements = [];

  @override
  void initState() {
    super.initState();
    _loadAnnouncements();
  }

  Future<void> _loadAnnouncements() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList('announcements') ?? [];

    setState(() {
      announcements = data
          .map((e) => Announcement.fromJson(json.decode(e)))
          .toList();
    });
  }

  Future<void> _saveAnnouncements() async {
    final prefs = await SharedPreferences.getInstance();
    final data = announcements.map((e) => json.encode(e.toJson())).toList();
    await prefs.setStringList('announcements', data);
  }

  void _addOrEditDialog({Announcement? announcement, int? index}) {
    final titleController = TextEditingController(text: announcement?.title ?? '');
    final descriptionController = TextEditingController(text: announcement?.description ?? '');
    DateTime selectedDate = announcement?.date ?? DateTime.now();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(index == null ? 'Add Announcement' : 'Edit Announcement'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: "Title"),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: "Description"),
                maxLines: 3,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text("Date: "),
                  TextButton(
                    onPressed: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null) {
                        setState(() => selectedDate = picked);
                      }
                    },
                    child: Text(DateFormat.yMMMMd().format(selectedDate)),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              final title = titleController.text.trim();
              final description = descriptionController.text.trim();

              if (title.isEmpty || description.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("All fields are required")),
                );
                return;
              }

              final newAnnouncement = Announcement(
                title: title,
                description: description,
                date: selectedDate,
              );

              setState(() {
                if (index == null) {
                  announcements.add(newAnnouncement);
                } else {
                  announcements[index] = newAnnouncement;
                }
              });

              _saveAnnouncements();
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete Announcement"),
        content: const Text("Are you sure you want to delete this announcement?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () {
              setState(() => announcements.removeAt(index));
              _saveAnnouncements(); // 🔥 Remove from storage too
              Navigator.pop(context);
            },
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6F0),
      appBar: AppBar(
        title: const Text("Manage Announcements",style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF3F51B5),
        iconTheme: const IconThemeData(color: Color(0xFFFDF6F0)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addOrEditDialog(),
        child: const Icon(Icons.add),
        backgroundColor: const Color(0xFF3F51B5),
      ),
      body: announcements.isEmpty
          ? const Center(child: Text("No announcements yet. Tap + to add."))
          : ListView.builder(
        itemCount: announcements.length,
        itemBuilder: (context, index) {
          final ann = announcements[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(ann.title),
              subtitle: Text(
                "${ann.description}\nDate: ${DateFormat.yMMMMd().format(ann.date)}",
              ),
              isThreeLine: true,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () => _addOrEditDialog(announcement: ann, index: index),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _confirmDelete(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
