// 📌 File: lib/screens/splash_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:logging/logging.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      context.go('/login'); // ✅ Navigates to login after 3 seconds
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 40, // Move image slightly to the left
            right: 20, // Add padding on the right
            top: 0,
            bottom: 0,
            child: Image.asset(
              'assets/splash-image2.png',
              fit: BoxFit.contain, // Make the image smaller
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 130), // Lower the animation down more
              child: Lottie.asset(
                'assets/loading-animation.json',
                width: 100,
                frameRate: FrameRate.max, // Set frame rate to max for smooth animation
                onLoaded: (composition) {
                  // Ensure the animation is loaded
                  setState(() {});
                },
                errorBuilder: (context, error, stackTrace) {
                  // Handle error
                  Logger.root.severe('Error loading animation: $error');
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
