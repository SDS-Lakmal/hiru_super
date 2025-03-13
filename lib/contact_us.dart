import 'package:flutter/material.dart';

// Custom header widget
class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomHeader({super.key}) : preferredSize = const Size.fromHeight(45);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        mainAxisSize: MainAxisSize.min, // Avoid extra space
        children: [
          const SizedBox(height: 5.0), // Move text up
          const Text(
            'Contact Us',
            style: TextStyle(
              fontWeight: FontWeight.bold, // Bold text
              fontSize: 25, // Adjust font size
            ),
          ),
        ],
      ),
      centerTitle: true, // Center the title in AppBar
      backgroundColor: Colors.yellow,
      elevation: 5.0,
    );
  }
}
