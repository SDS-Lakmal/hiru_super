import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'client/user_home.dart';
import 'admin/discount.dart';
import 'client/contact_us.dart';
import 'client/terms_and_conditions.dart';
import 'client/about_us.dart'; // <- ADD THIS

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery App',
      theme: ThemeData(primarySwatch: Colors.green),
      home: UserHome(),
      routes: {
        '/admin': (context) => AdminUpload(),
        '/contact': (context) => ContactUsPage(),
        '/terms': (context) => TermsAndConditionsPage(),
        '/about': (context) => AboutUsPage(), // <- REGISTER ROUTE
      },
    );
  }
}
