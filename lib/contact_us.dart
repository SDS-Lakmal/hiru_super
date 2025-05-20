import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contact Us",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.yellowAccent, // Change as needed
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First Food City Branch
              contactCard(
                branchName: "Moratuwa Branch",
                address: "Hiru super, Main St, Moratuwa",
                phone: "077 715 6833",
              ),
              SizedBox(height: 20),
              // Second Food City Branch
              contactCard(
                branchName: "Moratumulla Branch",
                address: " Hiru super, Main St, Moratumulla",
                phone: "077 715 6834",
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable Widget for Contact Card
  Widget contactCard({
    required String branchName,
    required String address,
    required String phone,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              branchName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text("📍 $address", style: TextStyle(fontSize: 16)),
            Text(
              "📞 $phone",
              style: TextStyle(fontSize: 16, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
