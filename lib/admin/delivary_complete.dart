import 'package:flutter/material.dart';

class DeliveryPage extends StatefulWidget {
  final Map<String, dynamic> orderData;
  final String orderId;

  const DeliveryPage({super.key, required this.orderData, required this.orderId});

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  bool _isComplete = false;

  @override
  Widget build(BuildContext context) {
    final data = widget.orderData;
    final items = List<Map<String, dynamic>>.from(data['items']);

    return Scaffold(
      appBar: AppBar(title: const Text("Delivery")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Center(
              child: Text(
                'Delivery',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.yellow[200],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 6,
                    offset: const Offset(2, 2),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Order ID - ${widget.orderId}"),
                  Text("Name - ${data['name']}"),
                  Text("Address- ${data['address']}"),
                  Text("Telephone- ${data['phone'] ?? 'N/A'}"),
                  Text("Payment Method- ${data['paymentMethod']}"),
                  Text("Date-${data['date']}"),
                  const SizedBox(height: 12),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Order", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Quantity", style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  ...items.map((item) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("> ${item['name']} ${item['weight']}"),
                        Text("${item['quantity']}"),
                      ],
                    );
                  }).toList(),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isComplete = true;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text("Complete", style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 30),
            if (_isComplete)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.yellow[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "Order Complete",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
