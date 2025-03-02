import 'package:flutter/material.dart';

class VehicleSearchScreen extends StatefulWidget {
  const VehicleSearchScreen({super.key});

  @override
  VehicleSearchScreenState createState() => VehicleSearchScreenState();
}

class VehicleSearchScreenState extends State<VehicleSearchScreen> {
  final TextEditingController _controller = TextEditingController();
  bool loading = false;
  Map<String, dynamic>? vehicleData;

  void _searchVehicle() async {
    if (_controller.text.isEmpty) return;

    setState(() {
      loading = true;
    });

    // Simulating API request
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      vehicleData = {
        "regNumber": _controller.text.toUpperCase(),
        "chassisNumber": "NRE160-458077",
        "engineCapacity": "2000cc",
        "engineNumber": "1NR-5159984",
        "entryNumber": "2021MSA75723",
        "bodyType": "SUV",
        "make": "VOLKSWAGEN",
        "use": "GOK",
        "colour": "Gray",
        "model": "TIGUAN",
        "logbookNumber": "202353198765",
        "rating": "3910",
        "fuel": "Petrol",
        "registrationYear": "2019-10-11T00:00:00",
        "manufactureYear": "2019",
        "caveat": "None",
        "inspection": {
          "centre": "Likoni Inspection Centre",
          "date": "2020-01-15T12:10:40",
          "expiry": "2021-01-15",
          "result": "Pass",
          "stickerNo": "KKM2020011055",
          "type": "Annual Inspection",
          "status": "Active",
        },
        "rsl": {
          "institution": "Uber Kenya Ltd",
          "date": "2023-07-01",
          "expiry": "2025-07-01",
          "type": "Commercial",
          "status": "Active",
        },
        "charges": {
          "financier": "EQUITY BANK",
          "financierPIN": "P00045678",
          "commencement": "2020-09-10",
        },
        "owner": {
          "name": "John Kuya",
          "idNumber": "19178787",
          "kraPin": "A00456789B",
          "phoneNumber": "+254700345678",
          "ownerType": "Individual",
        },
      };
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vehicle Search"),
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
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Enter Vehicle Registration Number (e.g., GKB956Z)",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _searchVehicle,
              child: Text("Search Vehicle"),
            ),
            if (loading) ...[
              SizedBox(height: 20),
              CircularProgressIndicator(),
            ],
            if (vehicleData != null) ...[
              SizedBox(height: 20),
              _buildVehicleDetails(),
            ],
            SizedBox(height: 20),
            Image.asset('assets/ntsalogo.png', width: 100, height: 100),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildVehicleDetails() {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle("Vehicle Details"),
          _buildDetail("🚗 Plate: ${vehicleData!['regNumber']}"),
          _buildDetail("🛠 Chassis No: ${vehicleData!['chassisNumber']}"),
          _buildDetail("⚙️ Engine Capacity: ${vehicleData!['engineCapacity']}"),
          _buildDetail("🔧 Engine No: ${vehicleData!['engineNumber']}"),
          _buildDetail("📌 Entry No: ${vehicleData!['entryNumber']}"),
          _buildDetail("🚘 Body Type: ${vehicleData!['bodyType']}"),
          _buildDetail("🏭 Make: ${vehicleData!['make']}"),
          _buildDetail("🛠 Use: ${vehicleData!['use']}"),
          _buildDetail("🎨 Colour: ${vehicleData!['colour']}"),
          _buildDetail("📌 Model: ${vehicleData!['model']}"),
          _buildDetail("📖 Logbook No: ${vehicleData!['logbookNumber']}"),
          _buildDetail("🔢 Rating: ${vehicleData!['rating']}"),
          _buildDetail("⛽ Fuel: ${vehicleData!['fuel']}"),
          _buildDetail("📅 Registration Year: ${DateTime.parse(vehicleData!['registrationYear']).toLocal().toString().split(' ')[0]}"),
          _buildDetail("🏭 Manufacture Year: ${vehicleData!['manufactureYear']}"),
          _buildDetail("⚠️ Caveat: ${vehicleData!['caveat']}"),
          _buildSectionTitle("Inspection Details"),
          _buildDetail("🏢 Centre: ${vehicleData!['inspection']['centre']}"),
          _buildDetail("📆 Inspection Date: ${DateTime.parse(vehicleData!['inspection']['date']).toLocal().toString().split(' ')[0]}"),
          _buildDetail("📆 Expiry: ${DateTime.parse(vehicleData!['inspection']['expiry']).toLocal().toString().split(' ')[0]}"),
          _buildDetail("✅ Result: ${vehicleData!['inspection']['result']}"),
          _buildDetail("🔖 Sticker No: ${vehicleData!['inspection']['stickerNo']}"),
          _buildDetail("📌 Type: ${vehicleData!['inspection']['type']}"),
          _buildDetail("📢 Status: ${vehicleData!['inspection']['status']}"),
          _buildSectionTitle("RSL Details"),
          _buildDetail("🏢 Institution: ${vehicleData!['rsl']['institution']}"),
          _buildDetail("📆 RSL Date: ${DateTime.parse(vehicleData!['rsl']['date']).toLocal().toString().split(' ')[0]}"),
          _buildDetail("📆 RSL Expiry: ${DateTime.parse(vehicleData!['rsl']['expiry']).toLocal().toString().split(' ')[0]}"),
          _buildDetail("📌 Type: ${vehicleData!['rsl']['type']}"),
          _buildDetail("📢 Status: ${vehicleData!['rsl']['status']}"),
          _buildSectionTitle("Charges"),
          _buildDetail("🏦 Financier: ${vehicleData!['charges']['financier']}"),
          _buildDetail("🔢 Financier PIN: ${vehicleData!['charges']['financierPIN']}"),
          _buildDetail("📆 Charge Commencement: ${DateTime.parse(vehicleData!['charges']['commencement']).toLocal().toString().split(' ')[0]}"),
          _buildSectionTitle("Current Owner"),
          _buildDetail("👤 Name: ${vehicleData!['owner']['name']}"),
          _buildDetail("🆔 ID/Company: ${vehicleData!['owner']['idNumber']}"),
          _buildDetail("📌 KRA PIN: ${vehicleData!['owner']['kraPin']}"),
          _buildDetail("📞 Phone: ${vehicleData!['owner']['phoneNumber']}"),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 5.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _buildDetail(String detail) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Text(
        detail,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
    );
  }
}
