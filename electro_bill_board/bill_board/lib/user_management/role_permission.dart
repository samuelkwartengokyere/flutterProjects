import 'package:flutter/material.dart';

class AssignRolesPage extends StatefulWidget {
  const AssignRolesPage({super.key});

  @override
  State<AssignRolesPage> createState() => _AssignRolesPageState();
}

class _AssignRolesPageState extends State<AssignRolesPage> {
  final List<Map<String, String>> users = [
    {'name': 'Dr. Alice Smith', 'role': 'Lecturer'},
    {'name': 'Mr. John Doe', 'role': 'Student'},
  ];

  final List<String> roles = [
    'Lecturer',
    'Student',
    'Content Manager',
    'Viewer',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6F0),
      appBar: AppBar(
        title: const Text("Assign Roles & Permissions",style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF3F51B5),
        iconTheme: const IconThemeData(color: Color(0xFFFDF6F0)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: users.isEmpty
            ? const Center(child: Text("No users available."))
            : ListView.separated(
          itemCount: users.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final user = users[index];
            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                title: Text(
                  user['name']!,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text("Role: ${user['role']}"),
                ),
                trailing: DropdownButton<String>(
                  value: user['role'],
                  items: roles
                      .map((role) => DropdownMenuItem(
                    value: role,
                    child: Text(role),
                  ))
                      .toList(),
                  onChanged: (newRole) {
                    setState(() {
                      user['role'] = newRole!;
                    });
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
