// admin_upload.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminUpload extends StatefulWidget {
  @override
  _AdminUploadState createState() => _AdminUploadState();
}

class _AdminUploadState extends State<AdminUpload> {
  final _formKey = GlobalKey<FormState>();
  final _percentageController = TextEditingController();
  final _minimumBillController = TextEditingController();

  void _updateDiscount() async {
    if (_formKey.currentState!.validate()) {
      await FirebaseFirestore.instance.collection('discount').doc('banner').set({
        'percentage': int.parse(_percentageController.text),
        'minimumBill': int.parse(_minimumBillController.text),
        'message':
            'Enjoy ${_percentageController.text}% OFF for bills above ${_minimumBillController.text}',
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Discount updated!')));
    }
  }

  @override
  void dispose() {
    _percentageController.dispose();
    _minimumBillController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Discount")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text("Update Discount Banner", style: TextStyle(fontSize: 18)),
              TextFormField(
                controller: _percentageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Discount Percentage"),
                validator:
                    (value) => value!.isEmpty ? 'Enter percentage' : null,
              ),
              TextFormField(
                controller: _minimumBillController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Minimum Bill"),
                validator:
                    (value) => value!.isEmpty ? 'Enter minimum bill' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _updateDiscount,
                child: Text("Update Discount"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
