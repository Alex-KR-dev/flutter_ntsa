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
      appBar: AppBar(title: Text("GVCU Login")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/avatar.png', width: 80),
            SizedBox(height: 20),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: "Enter Username"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: "Enter Password"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/home'),
              child: Text("LOGIN"),
            ),
            SizedBox(height: 20),
            Image.asset('assets/ntsalogo.png', width: 100),
          ],
        ),
      ),
    );
  }
}
