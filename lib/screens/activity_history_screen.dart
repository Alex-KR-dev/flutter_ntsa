// 📌 File: lib/screens/activity_history_screen.dart
import 'package:flutter/material.dart';

class ActivityHistoryScreen extends StatelessWidget {
  const ActivityHistoryScreen({super.key});

  static final List<Map<String, String>> activities = [
    {
      "id": "1",
      "type": "vehicle",
      "action": "Vehicle Search",
      "details": "Searched vehicle GKB 956Z",
      "timestamp": "2024-02-23 14:30",
      "user": "John Kuya",
      "status": "successful"
    },
    {
      "id": "2",
      "type": "driver",
      "action": "Driver License Check",
      "details": "Verified license DL-56789012",
      "timestamp": "2024-02-23 13:15",
      "user": "Erika Wegesa",
      "status": "successful"
    },
    {
      "id": "3",
      "type": "ticket",
      "action": "Work Ticket Created",
      "details": "New ticket #001A",
      "timestamp": "2024-02-23 11:45",
      "user": "John Kuya",
      "status": "pending"
    },
    // Add more mock data here
  ];

  IconData getIcon(String type) {
    switch (type) {
      case 'vehicle':
        return Icons.directions_car;
      case 'driver':
        return Icons.person;
      case 'ticket':
        return Icons.description;
      default:
        return Icons.info;
    }
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'successful':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'failed':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Activity History"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: activities.length,
              itemBuilder: (context, index) {
                final activity = activities[index];
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: Icon(
                        getIcon(activity["type"]!),
                        color: activity["status"] == "successful"
                            ? Colors.green
                            : Theme.of(context).primaryColor,
                      ),
                    ),
                    title: Text(activity["action"]!),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(activity["details"]!),
                        SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(activity["user"]!),
                            Text(activity["timestamp"]!),
                          ],
                        ),
                      ],
                    ),
                    trailing: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: getStatusColor(activity["status"]!),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        activity["status"]!.toUpperCase(),
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(
              'assets/ntsalogo.png',
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
