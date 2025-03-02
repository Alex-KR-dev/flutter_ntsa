// 📌 File: lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSidebarOpen = false;

  void toggleSidebar() {
    setState(() {
      isSidebarOpen = !isSidebarOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text("NTSA GVCU"),
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: toggleSidebar,
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/user-avatar.png'),
                  radius: 20,
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  padding: EdgeInsets.all(10),
                  children: [
                    _buildModuleCard(context, "Vehicle Search", "assets/vehicle-icon.png", '/vehicle-search'),
                    _buildModuleCard(context, "Work Ticket", "assets/ticket-icon.png", '/work-ticket'),
                    _buildModuleCard(context, "Driver Search", "assets/driver-icon.png", '/driver-search'),
                    _buildModuleCard(context, "Activity History", "assets/history-icon.png", '/activity-history'),
                  ],
                ),
              ),
              // NTSA Logo at the bottom
              Padding(
                padding: EdgeInsets.all(20),
                child: Image.asset('assets/ntsalogo.png', width: 120),
              ),
            ],
          ),
        ),
        if (isSidebarOpen) _buildSidebar(),
      ],
    );
  }

  Widget _buildModuleCard(BuildContext context, String title, String imagePath, String route) {
    return GestureDetector(
      onTap: () => context.go(route),
      child: Card(
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 50),
            SizedBox(height: 10),
            Text(title, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget _buildSidebar() {
    return Positioned(
      left: 0,
      top: 0,
      bottom: 0,
      width: 250,
      child: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Alex Rotich"),
              accountEmail: Text("Administrator"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/user-avatar.png'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text("Logs"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Profile"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Help"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About"),
              onTap: () {},
            ),
            Spacer(),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text("Logout", style: TextStyle(color: Colors.red)),
              onTap: () => context.go('/login'),
            ),
          ],
        ),
      ),
    );
  }
}
