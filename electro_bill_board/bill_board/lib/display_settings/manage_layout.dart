import 'package:flutter/material.dart';

class ManageLayoutsPage extends StatefulWidget {
  const ManageLayoutsPage({super.key});

  @override
  State<ManageLayoutsPage> createState() => _ManageLayoutsPageState();
}

class _ManageLayoutsPageState extends State<ManageLayoutsPage> {
  String selectedLayout = 'Full Screen';

  final List<String> layouts = [
    'Full Screen',
    'Split Screen',
    'Ticker Text Only',
    'Custom Layout',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6F0),
      appBar: AppBar(
        title: const Text("Manage Layouts",style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF3F51B5),
        iconTheme: const IconThemeData(color: Color(0xFFFDF6F0)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Select a Display Layout:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedLayout,
              decoration: InputDecoration(
                labelText: "Layout",
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              items: layouts
                  .map((layout) =>
                  DropdownMenuItem(value: layout, child: Text(layout)))
                  .toList(),
              onChanged: (newLayout) {
                setState(() {
                  selectedLayout = newLayout!;
                });
              },
            ),
            const SizedBox(height: 30),
            Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                transitionBuilder: (child, animation) =>
                    FadeTransition(opacity: animation, child: child),
                child: _buildPreview(selectedLayout),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPreview(String layout) {
    return Card(
      key: ValueKey(layout),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.indigo[50],
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.tv, size: 50, color: Colors.indigo),
            const SizedBox(height: 10),
            Text("Current Layout: $layout",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
