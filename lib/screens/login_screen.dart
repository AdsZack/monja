import 'package:flutter/material.dart';
import 'package:myapp/main_screen.dart';
import 'package:myapp/screens/register_screen.dart'; // Pastikan MainScreen sudah benar

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required void Function() onLogin});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obsecureText = true;

  // Data pengguna lokal untuk validasi login
  final String validEmail = "user@example.com";
  final String validPassword = "password123";

  void _togglePasswordVisibility() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  void _login() {
    final email = _emailController.text;
    final password = _passwordController.text;

    // Validasi email dan password secara lokal
    if (email == validEmail && password == validPassword) {
      // Jika login berhasil, navigasi ke Dashboard
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    } else {
      // Jika login gagal, tampilkan pesan error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email atau password salah')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgroundLogin.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo Monja
              Image.asset(
                alignment: Alignment.center,
                'assets/images/logoMonja.png',
                width: 80,
                height: 80,
              ),

              // Form Input email dan Password
              const SizedBox(height: 75),
              _formInput(),
              _textLupaPassword(),
              const SizedBox(height: 30),

              // Button dan kalimat 'atau'
              _buttonLogin(context),
              const SizedBox(height: 15),
              _atau(),
              const SizedBox(height: 15),
              _buttonRegister(context),
              const SizedBox(height: 5),
              _buttonGoogle()
            ],
          ),
        ),
      ),
    );
  }

  Container _atau() {
    return Container(
      alignment: Alignment.center,
      child: const Text(
          '---------------------------------- Atau ----------------------------------'),
    );
  }

  Container _textLupaPassword() {
    return Container(
      alignment: Alignment.topRight,
      padding: const EdgeInsets.only(top: 0, right: 30),
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Lupa Password',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            decoration: TextDecoration.underline,
            decorationColor: Colors.black,
            decorationThickness: 3,
            decorationStyle: TextDecorationStyle.solid,
          ),
        ),
      ),
    );
  }

  ElevatedButton _buttonGoogle() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 255, 17, 0),
        padding: const EdgeInsets.symmetric(horizontal: 63, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text(
        'Daftar dengan akun Google',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Column _formInput() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              filled: true,
              fillColor: Colors.white,
              hintText: 'Masukan Email',
              hintStyle: const TextStyle(fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              prefixIcon: const Icon(
                Icons.email,
                color: Colors.black,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Isi Email Anda';
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
          child: TextFormField(
            controller: _passwordController,
            obscureText: _obsecureText,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              filled: true,
              fillColor: Colors.white,
              hintText: 'Masukan Password',
              hintStyle: const TextStyle(fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              prefixIcon: const Icon(
                Icons.lock,
                color: Colors.black,
              ),
              suffixIcon: IconButton(
                iconSize: 20,
                icon: Icon(
                    _obsecureText ? Icons.visibility : Icons.visibility_off),
                onPressed: _togglePasswordVisibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Isi Password Anda';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  ElevatedButton _buttonRegister(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RegisterScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 0, 140, 255),
        padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text(
        'Daftar',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  ElevatedButton _buttonLogin(BuildContext context) {
    return ElevatedButton(
      onPressed: _login,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 0, 255, 8),
        padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text(
        'Masuk',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
