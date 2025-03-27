import 'package:flutter/material.dart';

void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileDetailsScreen(),
    );
  }
}

class ProfileDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.person, color: Colors.black),
              SizedBox(width: 8),
              Text('Profile details'),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EditableProfileField(title: 'User Name', value: 'Saman Kumara'),
            EditableProfileField(title: 'Password', value: '********', isPassword: true),
            EditableProfileField(title: 'Email', value: 'samankumara34@gmail.com'),
            EditableProfileField(title: 'Address', value: 'Galle Road, Moratuwa'),
            Spacer(),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child: Text('Back', style: TextStyle(color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EditableProfileField extends StatefulWidget {
  final String title;
  final String value;
  final bool isPassword;

  EditableProfileField({required this.title, required this.value, this.isPassword = false});

  @override
  _EditableProfileFieldState createState() => _EditableProfileFieldState();
}

class _EditableProfileFieldState extends State<EditableProfileField> {
  late TextEditingController _controller;
  bool _isEditing = false;
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: _isEditing
                      ? TextField(
                          controller: _controller,
                          obscureText: widget.isPassword && !_isPasswordVisible,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        )
                      : Text(
                          widget.isPassword && !_isPasswordVisible
                              ? '•' * widget.value.length
                              : widget.value,
                          style: TextStyle(color: Colors.black),
                          overflow: TextOverflow.ellipsis,
                        ),
                ),
                if (widget.isPassword)
                  IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_isEditing) {
                        // Save the new value
                        // You can add your save logic here
                      }
                      _isEditing = !_isEditing;
                    });
                  },
                  child: Text(_isEditing ? 'Save' : 'Edit', style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
