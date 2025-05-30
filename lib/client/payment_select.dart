import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkout UI',
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: CheckoutPage(),
    );
  }
}

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String selectedPayment = 'Card';
  String address =
      "S.D Dasun Tharaka\n+94 771243074\n143/5 Hiripitiya Pannipitiya, Colombo - Greater, Western";

  void _editAddress() {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController controller = TextEditingController(text: address);
        return AlertDialog(
          title: Text('Edit Address'),
          content: TextField(
            controller: controller,
            maxLines: 4,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() => address = controller.text);
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _deleteAddress() {
    setState(() => address = '');
  }

  void _navigateToPayment() {
    if (selectedPayment == 'Cash') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Proceeding with Cash on Delivery")),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => CardPaymentPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.shopping_cart_outlined, color: Colors.black),
            Text("Rs.495.00", style: TextStyle(color: Colors.black)),
            Icon(Icons.menu, color: Colors.black),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Hinted search text",
                  prefixIcon: Icon(Icons.menu),
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),

            // Address Section
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Shipping & Billing",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      address.isNotEmpty ? address : "No address found",
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(onPressed: _editAddress, child: Text("Edit")),
                      TextButton(
                        onPressed: _deleteAddress,
                        child: Text("Delete"),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Payment Options
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment Option",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed:
                              () => setState(() => selectedPayment = 'Cash'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                selectedPayment == 'Cash'
                                    ? Colors.yellow
                                    : Colors.grey.shade300,
                          ),
                          child: Text(
                            "Cash On Delivery",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed:
                              () => setState(() => selectedPayment = 'Card'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                selectedPayment == 'Card'
                                    ? Colors.yellow
                                    : Colors.grey.shade300,
                          ),
                          child: Text(
                            "Card Payment",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Map Image
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Delivery Location",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/images/map_image.jpg',
                    ), // replace with your map image asset
                  ),
                ],
              ),
            ),

            // Proceed to Pay Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _navigateToPayment,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Proceed to Pay",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardPaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card Payment"),
        backgroundColor: Colors.yellow,
      ),
      body: Center(child: Text("Card Payment Page")),
    );
  }
}
