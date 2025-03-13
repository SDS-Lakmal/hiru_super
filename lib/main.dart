import 'package:flutter/material.dart';
import 'contact_us.dart'; // header.dart import කරනවා

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CustomHeader(), // CustomHeader widget එක මෙහි භාවිතා කරනවා
        body: Center(child: Text('Hello, Flutter!')),
      ),
    );
  }
}
