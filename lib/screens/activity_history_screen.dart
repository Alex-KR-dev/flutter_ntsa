// 📌 File: lib/screens/activity_history_screen.dart
import 'package:flutter/material.dart';

class ActivityHistoryScreen extends StatelessWidget {
  const ActivityHistoryScreen({super.key});

  static final List<Map<String, String>> activities = [
    {
      "Action": "Vehicle Search",
      "Details": "Searched vehicle GKB 956Z",
      "User": "John Kuya",
      "Timestamp": "2024-02-23 14:30",
    },
    {
      "Action": "Driver License Check",
      "Details": "Verified license DL-56789012",
      "User": "Erika Wegesa",
      "Timestamp": "2024-02-23 13:15",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Activity History")),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: activities.length,
        itemBuilder: (context, index) {
          final activity = activities[index];
          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(activity["Action"]!),
              subtitle: Text(activity["Details"]!),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(activity["User"]!, style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(activity["Timestamp"]!, style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
