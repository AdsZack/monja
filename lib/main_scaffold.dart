import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class MainScaffold extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTabSelected;
  final List<Widget> screens;

  const MainScaffold({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
    required this.screens,
  });

  @override
  // ignore: library_private_types_in_public_api
  _MainScaffoldState createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.screens[widget.currentIndex],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react, // Mengatur gaya navbar
        backgroundColor: Colors.lightBlue, // Background navbar putih
        activeColor: Colors.white, // Warna ikon dan teks saat aktif
        color: Colors.white, // Warna ikon dan teks saat tidak aktif
        items: [
          TabItem(
              icon: Icons.camera_alt,
              title: widget.currentIndex == 0 ? 'Survey' : ''),
          TabItem(
              icon: Icons.home,
              title: widget.currentIndex == 1 ? 'Dashboard' : ''),
          TabItem(
              icon: Icons.route, title: widget.currentIndex == 2 ? 'Rute' : ''),
        ],
        initialActiveIndex: widget.currentIndex,
        onTap: (int index) {
          widget.onTabSelected(index);
        },
      ),
    );
  }
}
