
import 'package:flutter/material.dart';

class WelcomeButtonsPage extends StatelessWidget {
  const WelcomeButtonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/sun.png', height: 150),
            const SizedBox(height: 20),
            const Text(
              'HIRU SUPER',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            YellowButton(
              text: 'Sign In',
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            const SizedBox(height: 15),
            YellowButton(
              text: 'Sign Up',
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
            ),
            const SizedBox(height: 15),
            YellowButton(
              text: 'Admin Login',
              onPressed: () {
                Navigator.pushNamed(context, '/signup'); // or another page
              },
            ),
          ],
        ),
      ),
    );
  }
}

class YellowButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const YellowButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.yellow[700],
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: Text(text),
      ),
    );
  }
}