// 📌 File: lib/screens/work_ticket_screen.dart
import 'package:flutter/material.dart';

class WorkTicketScreen extends StatefulWidget {
  const WorkTicketScreen({super.key});

  @override
  WorkTicketScreenState createState() => WorkTicketScreenState();
}

class WorkTicketScreenState extends State<WorkTicketScreen> {
  final TextEditingController _ticketController = TextEditingController();
  Map<String, String>? ticketData;
  bool isLoading = false;

  void _searchTicket() {
    setState(() {
      isLoading = true;
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        ticketData = {
          "Ticket Number": _ticketController.text,
          "Vehicle Reg": "GKB 956Z",
          "Driver": "John Kuya",
          "Origin": "Nairobi",
          "Destination": "Mombasa",
          "Passengers": "4",
        };
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Work Ticket Search")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _ticketController,
              decoration: InputDecoration(labelText: "Enter Work Ticket Number"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _searchTicket,
              child: Text("Search Ticket"),
            ),
            if (isLoading) CircularProgressIndicator(),
            if (ticketData != null) ...ticketData!.entries.map((entry) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text("${entry.key}: ${entry.value}", style: TextStyle(fontSize: 16)),
            )),
          ],
        ),
      ),
    );
  }
}
