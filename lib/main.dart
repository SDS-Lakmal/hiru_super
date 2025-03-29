import 'package:flutter/material.dart';
import 'contact_us.dart'; // Import Contact Us Page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.green),
      home: ContactUsPage(), // Directly load ContactUsPage
    );
  }
}
