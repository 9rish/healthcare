import 'package:flutter/material.dart';
import 'package:healthcare/screens/welcome_screen.dart';
import 'package:healthcare/screens/login_screen.dart';
import 'package:healthcare/screens/sign_up_screen.dart';
import 'package:healthcare/widgets/navbar_roots.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthcare App',
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => const loginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/home': (context) => const NavBarRoots(),
      },
    );
  }
}