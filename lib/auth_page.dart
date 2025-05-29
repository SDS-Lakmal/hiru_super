import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'client/user_login.dart'; 
import './client/user_home.dart'; 

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // If loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // If user is logged in
          if (snapshot.hasData) {
            return UserHome(); // Replace with your actual home screen
          }

          // If user is not logged in
          return const LoginScreen();
        },
      ),
    );
  }
}