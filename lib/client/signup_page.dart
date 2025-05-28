
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Text(
              'Sign Up',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),

            // Username
            TextField(
              decoration: InputDecoration(
                labelText: 'User Name',hintText: 'eg: Saman Kumara',
                border: inputBorder,
              ),
            ),
            SizedBox(height: 20),

            // Email
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'eg: samankumara34@gmail.com',
                border: inputBorder,
              ),
            ),
            SizedBox(height: 20),

            // Password
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'eg: S@bc12',
                border: inputBorder,
                suffixIcon: Icon(Icons.visibility_off),
              ),
            ),
            SizedBox(height: 20),

            // Retype Password
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Re-Type Password',
                hintText: 'eg: S@bc12',
                border: inputBorder,
                suffixIcon: Icon(Icons.visibility_off),
              ),
            ),
            SizedBox(height: 20),

            // OR and Icons
            Row(
              children: [Expanded(child: Divider(thickness: 1)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text('Or'),
                ),
                Expanded(child: Divider(thickness: 1)),
              ],
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.g_mobiledata, size: 32, color: Colors.red),
                SizedBox(width: 20),
                Icon(Icons.facebook, size: 28, color: Colors.blue),
              ],
            ),
            SizedBox(height: 30),

            // Sign Up Button
            ElevatedButton(
              onPressed: () {
                // Handle sign up action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow[700],
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Sign Up', style: TextStyle(fontSize: 16)),
            ),
            SizedBox(height: 20),],
        ),
      ),
    );
  }
}

