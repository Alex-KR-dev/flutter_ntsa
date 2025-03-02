// 📌 File: lib/screens/login_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, // Set background color to pure white
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/avatar.png', width: 80),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: "Enter Username",
                  labelStyle: TextStyle(
                    color: Colors.grey, // Lighter text color
                    fontSize: 16, // Better font size
                    fontFamily: 'Roboto', // Use custom font
                  ),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.person_outline), // Add person outline icon
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Enter Password",
                  labelStyle: TextStyle(
                    color: Colors.grey, // Lighter text color
                    fontSize: 16, // Better font size
                    fontFamily: 'Roboto', // Use custom font
                  ),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.lock_outline), // Add closed lock outline icon
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: const Color.fromARGB(255, 42, 125, 45), // Change button color to green
                foregroundColor: Colors.white,
                elevation: 4,
              ),
              onPressed: () => context.go('/home'),
              child: Text("LOGIN", style: TextStyle(
                fontSize: 14,
                fontFamily: 'Roboto', // Use custom font
              )),
            ),
            SizedBox(height: 20),
            Image.asset('assets/ntsalogo.png', width: 100),
          ],
        ),
      ),
    );
  }
}
