import 'package:flutter/material.dart';

class ScheduleManagementPage extends StatefulWidget {
  const ScheduleManagementPage({super.key});

  @override
  State<ScheduleManagementPage> createState() => _ScheduleManagementPageState();
}

class _ScheduleManagementPageState extends State<ScheduleManagementPage> {
  final List<Map<String, dynamic>> schedules = [];
  final _formKey = GlobalKey<FormState>();
  final contentController = TextEditingController();
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6F0),
      appBar: AppBar(
        title: const Text("Set Display Schedules",style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF3F51B5),
        iconTheme: const IconThemeData(color: Color(0xFFFDF6F0)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildScheduleForm(context),
            const SizedBox(height: 20),
            const Text(
              "Your Scheduled Contents",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: schedules.isEmpty
                  ? const Center(child: Text("No schedules yet."))
                  : ListView.builder(
                itemCount: schedules.length,
                itemBuilder: (context, index) => _buildScheduleCard(schedules[index], index),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScheduleForm(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: contentController,
                decoration: const InputDecoration(labelText: "Content Description"),
                validator: (value) => value == null || value.isEmpty ? 'Enter content description' : null,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.access_time),
                      onPressed: () async {
                        final picked = await showTimePicker(
                            context: context, initialTime: TimeOfDay.now());
                        if (picked != null) setState(() => startTime = picked);
                      },
                      label: Text(
                        startTime == null ? 'Select Start Time' : 'Start: ${startTime!.format(context)}',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.access_time_filled),
                      onPressed: () async {
                        final picked = await showTimePicker(
                            context: context, initialTime: TimeOfDay.now());
                        if (picked != null) setState(() => endTime = picked);
                      },
                      label: Text(
                        endTime == null ? 'Select End Time' : 'End: ${endTime!.format(context)}',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      startTime != null &&
                      endTime != null) {
                    setState(() {
                      schedules.add({
                        'content': contentController.text,
                        'start': startTime!.format(context),
                        'end': endTime!.format(context),
                      });
                      contentController.clear();
                      startTime = null;
                      endTime = null;
                    });
                  }
                },
                label: const Text("Add Schedule"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size.fromHeight(48),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScheduleCard(Map<String, dynamic> schedule, int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: ListTile(
        leading: const Icon(Icons.schedule, color: Colors.blueAccent),
        title: Text(schedule['content'], style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Row(
          children: [
            Chip(
              label: Text("Start: ${schedule['start']}"),
              backgroundColor: Colors.green.shade100,
            ),
            const SizedBox(width: 6),
            Chip(
              label: Text("End: ${schedule['end']}"),
              backgroundColor: Colors.red.shade100,
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            setState(() => schedules.removeAt(index));
          },
        ),
      ),
    );
  }
}
