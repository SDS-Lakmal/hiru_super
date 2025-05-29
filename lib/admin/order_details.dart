import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminOrderDetailsPage extends StatelessWidget {
  final String orderId;
  const AdminOrderDetailsPage({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    final orderRef = FirebaseFirestore.instance.collection('orders').doc(orderId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details Page'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: orderRef.get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());

          final data = snapshot.data!.data() as Map<String, dynamic>;

          List<dynamic> items = data['items'];

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Items
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Order ID", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(orderId),
                      ...items.map((item) => orderItem(item)).toList(),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text("Name: ${data['name']}"),
                Text("Address: ${data['address']}"),
                Text("Payment Method: ${data['paymentMethod']}"),
                Text("Total Price: Rs. ${data['totalPrice']}"),
                Text("Payment Type: ${data['paymentType']}"),
                Text("Date: ${data['date']}"),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DeliveryPage()),
                      );
                    },
                    child: const Text("Process"),
                  ),
                  
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget orderItem(dynamic item) {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    leading: const Icon(Icons.fastfood),
    title: Text(item['name']),
    subtitle: Text("Weight: ${item['weight']}"),
    trailing: Text("Qty: ${item['quantity']}"),
  );
}

}

class DeliveryPage extends StatelessWidget {
  const DeliveryPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Delivery Page")),
      body: const Center(child: Text("Delivery processing goes here...")),
    );
  }
}
