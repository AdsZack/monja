import 'package:flutter/material.dart';
import 'package:myapp/main_screen.dart';
import 'package:myapp/screens/login_screen.dart';

void main() {
  runApp(const MonjaApp());
}

class MonjaApp extends StatelessWidget {
  const MonjaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Survey App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthScreen(),
    );
  }
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLoggedIn = false;

  // Fungsi untuk login
  void _login() {
    setState(() {
      _isLoggedIn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoggedIn
        ? const MainScreen() // Jika sudah login, masuk ke MainScreen
        : LoginScreen(
            onLogin: _login); // Jika belum login, tampilkan LoginScreen
  }
}
