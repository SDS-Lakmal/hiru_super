import 'package:flutter/material.dart';

void main() {
  runApp(HiruSuperApp());
}

class HiruSuperApp extends StatelessWidget {
  const HiruSuperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background set to white
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/hirusuperlogo.jpg', // Make sure this file exists
                height: 120,
              ),
              SizedBox(height: 20),
              Text(
                'HIRU SUPER',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 40),
              YellowButton(text: 'Sign in', onPressed: () {}),
              SizedBox(height: 10),
              YellowButton(text: 'Sign Up', onPressed: () {}),
              SizedBox(height: 10),
              YellowButton(text: 'Admin Login', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class YellowButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const YellowButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.yellow[600],   // Replaces 'primary'
        foregroundColor: Colors.black,         // Replaces 'onPrimary'
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
      ),
      child: Text(text),
    );
  }
}


