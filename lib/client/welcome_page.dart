import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Welcome', style: TextStyle(color: Colors.black)),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/hirusuperlogo.jpg', height: 100),
              const SizedBox(height: 20),
              const Text(
                'HIRU SUPER',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 40),
              YellowButton(
                text: 'Sign In',
                onPressed: () => Navigator.pushNamed(context, '/login'),
              ),
              const SizedBox(height: 10),
              YellowButton(
                text: 'Sign Up',
                onPressed: () => Navigator.pushNamed(context, '/signup'),
              ),
              const SizedBox(height: 10),
              YellowButton(
                text: 'Admin Login',
                onPressed: () => Navigator.pushNamed(context, '/admin'),
              ),
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

  const YellowButton({required this.text, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.yellow[600],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
      ),
      child: Text(text),
    );
  }
}
