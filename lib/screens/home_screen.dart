// 📌 File: lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  bool isSidebarOpen = false;
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset(-1.0, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  void toggleSidebar() {
    setState(() {
      isSidebarOpen = !isSidebarOpen;
      if (isSidebarOpen) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white, // Set background color to white
          appBar: AppBar(
            backgroundColor: Colors.white, // Set app bar background color to white
            centerTitle: true, // Center the title
            title: Text("NTSA GVCU", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)), // Set title color to black and bold
            leading: IconButton(
              icon: Icon(Icons.menu, color: Colors.black), // Set icon color to black
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
            elevation: 4, // Add shadow to the app bar
            shadowColor: Colors.grey.withOpacity(0.5), // Set shadow color
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(1.0),
              child: Container(
                color: Colors.grey, // Set the color of the bottom border
                height: 1.0,
              ),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  padding: EdgeInsets.all(10),
                  children: [
                    _buildModuleCard(context, "Vehicle Search", "assets/vehicle-icon.png", '/vehicle-search', "Search and verify vehicle details"),
                    _buildModuleCard(context, "Work Ticket", "assets/ticket-icon.png", '/work-ticket', "Manage work tickets"),
                    _buildModuleCard(context, "Driver Search", "assets/driver-icon.png", '/driver-search', "Search driver information"),
                    _buildModuleCard(context, "Activity History", "assets/history-icon.png", '/activity-history', "View activity history"),
                  ],
                ),
              ),
              // NTSA Logo at the bottom
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Image.asset('assets/ntsalogo.png', width: 120),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text("© Alex R", style: TextStyle(fontSize: 12)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SlideTransition(
          position: _slideAnimation,
          child: _buildSidebar(),
        ),
      ],
    );
  }

  Widget _buildModuleCard(BuildContext context, String title, String imagePath, String route, String description) {
    return GestureDetector(
      onTap: () => context.go(route),
      child: Card(
        color: Colors.white, // Set background color to snow white
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Add rounded corners
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 50),
            SizedBox(height: 10),
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), // Set title font weight to bold
            SizedBox(height: 5),
            Text(
              description,
              style: TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center, // Center-align the description
            ),
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
            Container(
              color: Colors.green[900], // Jungle green color
              child: UserAccountsDrawerHeader(
                accountName: Text("Alex Rotich"),
                accountEmail: Text("Administrator"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/user-avatar.png'),
                ),
                decoration: BoxDecoration(
                  color: Colors.green[900], // Jungle green color
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white, // White color for the bottom section
                child: Column(
                  children: [
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
            ),
          ],
        ),
      ),
    );
  }
}
