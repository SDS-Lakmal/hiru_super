import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

// Admin Dashboard
import 'admin/dashboard.dart';

// Client Pages
import 'client/user_home.dart';
import 'client/contact_us.dart';
import 'client/terms_and_conditions.dart';
import 'client/about_us.dart';

// Admin Pages
import 'admin/discount.dart';

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
      title: 'Hiru Supper Admin',
      theme: ThemeData(primarySwatch: Colors.yellow),
      debugShowCheckedModeBanner: false,
      home: const Dashboard(), //  Main Admin Dashboard
      routes: {
        '/userHome': (context) => UserHome(),
        '/admin': (context) => DiscountPage(),
        '/contact': (context) => ContactUsPage(),
        '/terms': (context) => TermsAndConditionsPage(),
        '/about': (context) => AboutUsPage(),
      },
    );
  }
}
