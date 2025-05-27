import 'package:flutter/material.dart';
import 'cart.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Map<String, dynamic>> cartItems = [];

  final List<Map<String, dynamic>> products = [
    {'name': 'Banana', 'price': 170.0, 'image': 'assets/images/banana.jpg'},
    {'name': 'Apple', 'price': 250.0, 'image': 'assets/images/apple.jpg'},
    {'name': 'Orange', 'price': 200.0, 'image': 'assets/images/orange.jpg'},
  ];

  void _addToCart(Map<String, dynamic> product, int quantity) {
    bool found = false;

    for (var item in cartItems) {
      if (item['name'] == product['name']) {
        item['quantity'] += quantity;
        found = true;
        break;
      }
    }

    if (!found) {
      cartItems.add({
        'name': product['name'],
        'price': product['price'],
        'quantity': quantity,
        'image': product['image'],
      });
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Added to cart!')));
  }

  void _goToCart() async {
    final updatedCart = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CartPage(cartItems: cartItems)),
    );

    if (updatedCart != null) {
      setState(() {
        cartItems = List<Map<String, dynamic>>.from(updatedCart);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        backgroundColor: Colors.yellow[700],
        actions: [
          IconButton(
            onPressed: _goToCart,
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          int quantity = 1;

          return Card(
            margin: const EdgeInsets.all(12),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Image.asset(products[index]['image'], height: 100),
                  Text(
                    products[index]['name'],
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text('Rs. ${products[index]['price']}'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StatefulBuilder(
                        builder: (context, setInnerState) {
                          return Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (quantity > 1) {
                                    setInnerState(() => quantity--);
                                  }
                                },
                                icon: const Icon(Icons.remove),
                              ),
                              Text(quantity.toString()),
                              IconButton(
                                onPressed: () {
                                  setInnerState(() => quantity++);
                                },
                                icon: const Icon(Icons.add),
                              ),
                            ],
                          );
                        },
                      ),
                      ElevatedButton(
                        onPressed: () => _addToCart(products[index], quantity),
                        child: const Text("Add to Cart"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
