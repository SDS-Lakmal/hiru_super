import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'orders_page.dart';
import 'items.dart';
import 'discount.dart'; // Make sure this matches the file name
import 'customers.dart';
import 'delivery.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  Future<int> getOrderCount() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('orders').get();
    return snapshot.docs.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      appBar: AppBar(title: const Text('Admin Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            FutureBuilder<int>(
              future: getOrderCount(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) return const CircularProgressIndicator();
                return Text("📦 Orders Received: ${snapshot.data}", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold));
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children: [
                  dashboardButton(context, "Orders", Icons.shopping_bag, OrdersPage()),
                  dashboardButton(context, "Items", Icons.fastfood, ItemsPage()),
                  dashboardButton(context, "Discount", Icons.percent, DiscountPage()),
                  dashboardButton(context, "Customers", Icons.people, CustomersPage()),
                  dashboardButton(context, "Delivery", Icons.delivery_dining, DeliveryPage()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dashboardButton(BuildContext context, String label, IconData icon, Widget page) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.yellow[700],
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.all(20),
      ),
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => page)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40),
          const SizedBox(height: 10),
          Text(label, style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}