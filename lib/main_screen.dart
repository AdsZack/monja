import 'package:flutter/material.dart';
import 'package:myapp/screens/dashboard_screen.dart';
import 'package:myapp/screens/rute_screen.dart';
import 'package:myapp/screens/survey_screen.dart';
import 'main_scaffold.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 1; // Dashboard sebagai tab default

  final List<Widget> _screens = [
    const SurveyScreen(),
    const DashboardScreen(),
    const RuteScreen(),
  ];

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      currentIndex: _selectedIndex,
      onTabSelected: _onTabSelected,
      screens: _screens,
    );
  }
}
