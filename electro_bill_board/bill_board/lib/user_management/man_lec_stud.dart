import 'package:flutter/material.dart';

class ManageAccountsPage extends StatefulWidget {
  const ManageAccountsPage({super.key});

  @override
  State<ManageAccountsPage> createState() => _ManageAccountsPageState();
}

class _ManageAccountsPageState extends State<ManageAccountsPage> {
  final List<Map<String, String>> accounts = [
    {'name': 'Dr. Alice Smith', 'role': 'Lecturer'},
    {'name': 'Mr. John Doe', 'role': 'Student'},
  ];

  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  String selectedRole = 'Lecturer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6F0),
      appBar: AppBar(
        title: const Text("Manage Accounts",style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF3F51B5),
        iconTheme: const IconThemeData(color: Color(0xFFFDF6F0)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: "Full Name"),
                      validator: (value) =>
                      value == null || value.trim().isEmpty ? 'Enter full name' : null,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: DropdownButtonFormField<String>(
                      value: selectedRole,
                      decoration: const InputDecoration(labelText: "Role"),
                      items: const [
                        DropdownMenuItem(value: 'Lecturer', child: Text('Lecturer')),
                        DropdownMenuItem(value: 'Student', child: Text('Student')),
                      ],
                      onChanged: (value) => setState(() => selectedRole = value!),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          accounts.add({
                            'name': nameController.text.trim(),
                            'role': selectedRole,
                          });
                          nameController.clear();
                          selectedRole = 'Lecturer';
                        });
                      }
                    },
                    child: const Text("Add"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: accounts.isEmpty
                  ? const Center(child: Text("No accounts yet."))
                  : ListView.separated(
                itemCount: accounts.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final account = accounts[index];
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      title: Text(account['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Chip(
                        label: Text(account['role']!),
                        backgroundColor: account['role'] == 'Lecturer'
                            ? Colors.blue.shade50
                            : Colors.green.shade50,
                        labelStyle: TextStyle(
                          color: account['role'] == 'Lecturer' ? Colors.blue : Colors.green,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            accounts.removeAt(index);
                          });
                        },
                      ),
                    ),
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
