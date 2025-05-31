import 'package:flutter/material.dart';
import 'cart_items.dart';

class GroceryPage extends StatelessWidget {
  final List<Map<String, dynamic>> groceryItems = [
    {'name': 'Sugar', 'price': 250, 'image': 'assets/images/sugar.jpg'},
    {'name': 'Rice', 'price': 120, 'image': 'assets/images/rice.jpg'},
    {'name': 'Flour', 'price': 100, 'image': 'assets/images/flour.jpg'},
  ];

  GroceryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (context, index) {
          final item = groceryItems[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: Image.asset(item['image'], width: 50),
              title: Text(item['name']),
              subtitle: Text('Rs. ${item['price']}'),
              trailing: ElevatedButton(
                onPressed: () {
                  cartItems.add(item);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${item['name']} added to cart!')),
                  );
                },
                child: const Text('Add to Cart'),
              ),
            ),
          );
        },
      ),
    );
  }
}
