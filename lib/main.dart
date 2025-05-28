import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'client/user_home.dart';
import 'admin/discount.dart';
import 'client/contact_us.dart';
import 'client/terms_and_conditions.dart';
import 'client/about_us.dart';
import 'admin/edit_item.dart'; // Import Edit Item Page

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class Item {
  String name;
  double price;
  Item({required this.name, required this.price});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery App',
      theme: ThemeData(primarySwatch: Colors.green),
      home: UserHome(),  // Your original home page
      routes: {
        '/admin': (context) => AdminItemListPage(),
        '/discount': (context) => AdminUpload(),
        '/contact': (context) => ContactUsPage(),
        '/terms': (context) => TermsAndConditionsPage(),
        '/about': (context) => AboutUsPage(),
      },
    );
  }
}

class AdminItemListPage extends StatefulWidget {
  @override
  _AdminItemListPageState createState() => _AdminItemListPageState();
}

class _AdminItemListPageState extends State<AdminItemListPage> {
  List<Item> items = [
    Item(name: 'Apple', price: 100.0),
    Item(name: 'Banana', price: 50.0),
    Item(name: 'Orange', price: 80.0),
  ];

  void _navigateToEditPage(Item item, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditItemPage(
          initialName: item.name,
          initialPrice: item.price,
          onUpdate: (updatedName, updatedPrice) {
            setState(() {
              items[index].name = updatedName;
              items[index].price = updatedPrice;
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin - Items")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text(item.name),
            subtitle: Text("Rs. ${item.price.toStringAsFixed(2)}"),
            trailing: IconButton(
              icon: Icon(Icons.edit, color: Colors.blue),
              onPressed: () => _navigateToEditPage(item, index),
            ),
          );
        },
      ),
    );
  }
}
