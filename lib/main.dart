import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

// Client and Admin Pages
import 'client/user_home.dart';
import 'admin/discount.dart';
import 'client/contact_us.dart';
import 'client/terms_and_conditions.dart';
import 'client/about_us.dart';

// Auth and Settings Pages
import 'client/signup_page.dart';
import 'client/settings_page.dart';
import 'client/forgot_password_page.dart';
import 'client/welcome_buttons_page.dart'; // Make sure this is imported

// Global notifier to toggle dark/light theme
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Firebase initialization
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, currentTheme, _) {
        return MaterialApp(
          title: 'Supermarket App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: currentTheme,
          initialRoute: '/', // Optional if you want to start at WelcomeButtonsPage
          routes: {
            '/': (context) => const WelcomeButtonsPage(),
            '/signup': (context) => const SignUpPage(),
            
            '/forgotPassword': (context) => const ForgotPasswordPage(),
          },
        );
      },
    );
  }
}