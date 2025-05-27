import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const CartPage({super.key, required this.cartItems});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late List<Map<String, dynamic>> _cartItems;

  @override
  void initState() {
    super.initState();
    _cartItems = List<Map<String, dynamic>>.from(widget.cartItems);
  }

  void _removeItem(int index) {
    setState(() {
      _cartItems.removeAt(index);
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Item removed from cart.')));
  }

  void _onBackPressed() {
    Navigator.pop(context, _cartItems);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _onBackPressed();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Your Cart"),
          backgroundColor: Colors.yellow[700],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: _onBackPressed,
          ),
        ),
        body:
            _cartItems.isEmpty
                ? const Center(child: Text("Your cart is empty."))
                : ListView.builder(
                  itemCount: _cartItems.length,
                  itemBuilder: (context, index) {
                    var item = _cartItems[index];
                    double total = item['price'] * item['quantity'];

                    return Card(
                      margin: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(item['image'], width: 60, height: 60),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['name'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text("Quantity: ${item['quantity']}"),
                                  Text("Unit Price: Rs. ${item['price']}"),
                                  Text(
                                    "Total: Rs. ${total.toStringAsFixed(2)}",
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Checkout: ${item['name']}",
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green[700],
                                    minimumSize: const Size(80, 35),
                                  ),
                                  child: const Text(
                                    "Checkout",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () => _removeItem(index),
                                  tooltip: "Remove item",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
      ),
    );
  }
}
