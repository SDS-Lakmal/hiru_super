import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

// Import your screens
import 'client/user_home.dart';
import 'admin/discount.dart';
import 'client/contact_us.dart';
import 'client/terms_and_conditions.dart';
import 'client/about_us.dart';
import 'client/user_login.dart';
import 'client/welcome_page.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
  
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery App',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/login': (context) => const LoginScreen(),
        '/admin': (context) =>  AdminUpload(),
        '/contact': (context) =>  ContactUsPage(),
        '/terms': (context) =>  TermsAndConditionsPage(),
        '/about': (context) =>  AboutUsPage(),
        '/home': (context) =>  UserHome(),
      },
    );
  }
}
