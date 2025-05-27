import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

// Pages
import 'client/product_page.dart';
import 'client/user_home.dart';
import 'admin/discount.dart';
import 'client/contact_us.dart';
import 'client/terms_and_conditions.dart';
import 'client/about_us.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hiru Cart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.yellow, useMaterial3: true),
      home: const ProductPage(), // Home page set to ProductPage
      routes: {
        '/user_home': (context) => UserHome(),
        '/admin': (context) => AdminUpload(),
        '/contact': (context) => ContactUsPage(),
        '/terms': (context) => TermsAndConditionsPage(),
        '/about': (context) => AboutUsPage(),
      },
    );
  }
}
