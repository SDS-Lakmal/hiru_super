
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
            SizedBox(height: 20),
            Text(
              'HIRU SUPER',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to Sign In page
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[700],
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text('Sign In'),
              ),
            ),
            SizedBox(height: 15),
            SizedBox(width: 200,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to Sign Up page
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[700],
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text('Sign Up'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

