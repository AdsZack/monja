import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/map.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // search bar
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Tambahkan konten lainnya di sini
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: const Text(
                      "",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Floating Search Bar
          Positioned(
            top: 40, // Posisi search bar mengapung
            left: 20,
            right: 20,
            child: Material(
              shadowColor: Colors.lightBlue,
              elevation: 10,
              borderRadius: BorderRadius.circular(30),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  hintText: 'Search...',
                  hintStyle: const TextStyle(fontSize: 16),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(
                    Icons.menu,
                    size: 30,
                  ),
                  suffixIcon: const Icon(
                    Icons.account_circle,
                    size: 30,
                  ),
                  
                ),
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
