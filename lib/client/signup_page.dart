
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _retypePasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureRetypePassword = true;
  String _selectedRole = 'user'; // Default role

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        // Save additional user data to Firestore
        await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
          'name': _nameController.text.trim(),
          'email': _emailController.text.trim(),
          'role': _selectedRole,
        });

        // Navigate based on role
        if (_selectedRole == 'admin') {
          Navigator.pushReplacementNamed(context, '/adminHome');
        } else {
          Navigator.pushReplacementNamed(context, '/userHome');
        }

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Sign up successful")),
        );
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${e.message}")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Center(
                    child: Text("Sign Up", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 20),
                  
                  const Text("User Name", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      hintText: "eg: Saman Kumara",
                      filled: true,
                      fillColor: Color(0xFFF6EFFA),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                    ),
                    validator: (value) => value!.isEmpty ? "Enter your name" : null,
                  ),
                  const SizedBox(height: 16),

                  const Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "eg: samankumara34@gmail.com",
                      filled: true,
                      fillColor: Color(0xFFF6EFFA),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                    ),
                    validator: (value) => value != null && value.contains('@') ? null : "Enter a valid email",
                  ),
                  const SizedBox(height: 16),

                  const Text("Password", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      hintText: "eg: S@bc12",
                      filled: true,
                      fillColor: const Color(0xFFF6EFFA),
                      border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                      suffixIcon: IconButton(
                        icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                        onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                      ),
                    ),
                    validator: (value) => value!.length >= 8 ? null : "Password must be at least 8 characters",
                  ),
                  const SizedBox(height: 16),

                  const Text("Re-Type Password", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextFormField(
                    controller: _retypePasswordController,
                    obscureText: _obscureRetypePassword,
                    decoration: InputDecoration(
                      hintText: "Re-enter your password",
                      filled: true,
                      fillColor: const Color(0xFFF6EFFA),
                      border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                      suffixIcon: IconButton(
                        icon: Icon(_obscureRetypePassword ? Icons.visibility_off : Icons.visibility),
                        onPressed: () => setState(() => _obscureRetypePassword = !_obscureRetypePassword),
                      ),
                    ),
                    validator: (value) => value == _passwordController.text ? null : "Passwords do not match",
                  ),
                  const SizedBox(height: 16),

                  const Text("Select Role", style: TextStyle(fontWeight: FontWeight.bold)),
                  DropdownButtonFormField<String>(
                    value: _selectedRole,
                    items: ['user', 'admin'].map((role) {
                      return DropdownMenuItem(
                        value: role,
                        child: Text(role[0].toUpperCase() + role.substring(1)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() => _selectedRole = value!);
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF6EFFA),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                    ),
                  ),
                  const SizedBox(height: 30),

                  Center(
                    child: ElevatedButton(
                      onPressed: _signUp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      child: const Text("Sign Up", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}