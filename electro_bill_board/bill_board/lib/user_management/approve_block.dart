import 'package:flutter/material.dart';

class ApproveBlockAccountsPage extends StatefulWidget {
  const ApproveBlockAccountsPage({super.key});

  @override
  State<ApproveBlockAccountsPage> createState() => _ApproveBlockAccountsPageState();
}

class _ApproveBlockAccountsPageState extends State<ApproveBlockAccountsPage> {
  final List<Map<String, dynamic>> accounts = [
    {'name': 'Dr. Alice Smith', 'status': 'Approved'},
    {'name': 'Mr. John Doe', 'status': 'Blocked'},
    {'name': 'Ms. Jane Roe', 'status': 'Pending'},
  ];

  final List<String> statusOptions = ['Approved', 'Blocked', 'Pending'];

  Color _statusColor(String status) {
    switch (status) {
      case 'Approved':
        return Colors.green;
      case 'Blocked':
        return Colors.red;
      case 'Pending':
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6F0),
      appBar: AppBar(
        title: const Text("Approve or Block Accounts",style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF3F51B5),
        iconTheme: const IconThemeData(color: Color(0xFFFDF6F0)),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12.0),
        itemCount: accounts.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final account = accounts[index];
          final status = account['status'] as String;

          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              title: Text(account['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Row(
                children: [
                  const Text("Status: "),
                  Chip(
                    label: Text(status),
                    backgroundColor: _statusColor(status).withOpacity(0.1),
                    labelStyle: TextStyle(color: _statusColor(status)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ],
              ),
              trailing: DropdownButton<String>(
                value: status,
                underline: const SizedBox(),
                icon: const Icon(Icons.arrow_drop_down),
                items: statusOptions.map((option) {
                  return DropdownMenuItem(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (newStatus) {
                  setState(() {
                    account['status'] = newStatus!;
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
