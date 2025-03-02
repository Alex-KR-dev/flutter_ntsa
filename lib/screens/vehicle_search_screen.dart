// 📌 File: lib/screens/vehicle_search_screen.dart
import 'package:flutter/material.dart';

class VehicleSearchScreen extends StatefulWidget {
  const VehicleSearchScreen({super.key});

  @override
  VehicleSearchScreenState createState() => VehicleSearchScreenState();
}

class VehicleSearchScreenState extends State<VehicleSearchScreen> {
  final TextEditingController _controller = TextEditingController();
  String? vehicleInfo;

  void _searchVehicle() {
    setState(() {
      vehicleInfo = "Vehicle Info: Toyota Corolla, Reg: ${_controller.text}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Vehicle Search")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: "Enter Vehicle Reg No."),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _searchVehicle,
              child: Text("Search"),
            ),
            if (vehicleInfo != null) ...[
              SizedBox(height: 20),
              Text(vehicleInfo!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ],
        ),
      ),
    );
  }
}
