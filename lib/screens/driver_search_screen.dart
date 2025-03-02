// 📌 File: lib/screens/driver_search_screen.dart
import 'package:flutter/material.dart';

class DriverSearchScreen extends StatefulWidget {
  const DriverSearchScreen({super.key});

  @override
  DriverSearchScreenState createState() => DriverSearchScreenState();
}

class DriverSearchScreenState extends State<DriverSearchScreen> {
  final TextEditingController _driverIdController = TextEditingController();
  Map<String, dynamic>? driverData;
  bool isLoading = false;
  String error = "";

  final Map<String, Map<String, dynamic>> mockDrivers = {
    "123456": {
      "fullName": "John Kuya",
      "licenseNumber": "DL-98765432",
      "drivingClass": "B, C, E",
      "licenseValidity": "Valid until December 2026",
      "psv": {
        "validity": "Valid until October 2025",
        "name": "Super Metro Sacco",
        "badgeNumber": "PSV-345678",
      },
    },
    "987654": {
      "fullName": "Erika Wegesa",
      "licenseNumber": "DL-56789012",
      "drivingClass": "A, B, C, D",
      "licenseValidity": "Valid until June 2027",
      "psv": {
        "validity": "Not Enrolled",
        "name": "N/A",
        "badgeNumber": "N/A",
      },
    },
  };

  void _searchDriver() {
    setState(() {
      error = "";
      driverData = null;
      isLoading = true;
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        if (mockDrivers.containsKey(_driverIdController.text)) {
          driverData = mockDrivers[_driverIdController.text];
        } else {
          error = "No driver found with this ID.";
        }
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Driver Search"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _driverIdController,
              decoration: InputDecoration(
                labelText: "Enter Driver ID Number",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _driverIdController.text.isNotEmpty ? _searchDriver : null,
              child: Text("Search Driver"),
            ),
            if (isLoading) CircularProgressIndicator(),
            if (error.isNotEmpty) Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(error, style: TextStyle(color: Colors.red)),
            ),
            if (driverData != null) Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("🚦 Driver Details", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
                  Text("👤 Name: ${driverData!['fullName']}", style: TextStyle(fontSize: 16)),
                  Text("🆔 License No: ${driverData!['licenseNumber']}", style: TextStyle(fontSize: 16)),
                  Text("🚗 Driving Class: ${driverData!['drivingClass']}", style: TextStyle(fontSize: 16)),
                  Text("📅 License Expiry: ${driverData!['licenseValidity']}", style: TextStyle(fontSize: 16)),
                  SizedBox(height: 10),
                  Text("🚌 PSV Details", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
                  Text("✅ Validity: ${driverData!['psv']['validity']}", style: TextStyle(fontSize: 16)),
                  Text("🏢 Institution: ${driverData!['psv']['name']}", style: TextStyle(fontSize: 16)),
                  Text("🆔 Badge No: ${driverData!['psv']['badgeNumber']}", style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Image.asset('assets/ntsalogo.png', width: 100, height: 100),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
