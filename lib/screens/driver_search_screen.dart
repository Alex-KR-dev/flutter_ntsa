// 📌 File: lib/screens/driver_search_screen.dart
import 'package:flutter/material.dart';

class DriverSearchScreen extends StatefulWidget {
  @override
  _DriverSearchScreenState createState() => _DriverSearchScreenState();
}

class _DriverSearchScreenState extends State<DriverSearchScreen> {
  final TextEditingController _driverIdController = TextEditingController();
  Map<String, String>? driverData;
  bool isLoading = false;

  void _searchDriver() {
    setState(() {
      isLoading = true;
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        driverData = {
          "Full Name": "John Kuya",
          "License No": "DL-98765432",
          "Driving Class": "B, C, E",
          "PSV Validity": "Valid until October 2025",
        };
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Driver Search")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image.asset('assets/user-avatar.png', width: 80),
            SizedBox(height: 10),
            TextField(
              controller: _driverIdController,
              decoration: InputDecoration(labelText: "Enter Driver ID Number"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _searchDriver,
              child: Text("Search Driver"),
            ),
            if (isLoading) CircularProgressIndicator(),
            if (driverData != null) ...driverData!.entries.map((entry) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text("${entry.key}: ${entry.value}", style: TextStyle(fontSize: 16)),
            )),
          ],
        ),
      ),
    );
  }
}
