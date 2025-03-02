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
    if (_ticketController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a valid work ticket number.")),
      );
      return;
    }

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
          "Days": "5",
          "Details of Journey": "Test Evaluation",
          "Fuel Drawn": "70 litres",
          "Kilometers Covered": "600 km",
          "Passengers": "4",
        };
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Work Ticket Search"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white, // Set background color to white
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: _ticketController,
                decoration: InputDecoration(
                  labelText: "Enter Work Ticket Number",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _searchTicket,
                child: Text("Search Ticket"),
              ),
              if (isLoading) CircularProgressIndicator(),
              if (ticketData != null) ...[
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: ticketData!.entries.map((entry) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          "${entry.key}: ${entry.value}",
                          style: TextStyle(fontSize: 16),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/ntsalogo.png',
                  width: 100,
                  height: 100,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
