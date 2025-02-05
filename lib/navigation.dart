import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'dashboard_screen.dart';
import 'attendence_page.dart';
import 'digitalclasses.dart';
import 'fee_status.dart';
import 'busTrackingScreen.dart';
import 'resul_tpage.dart';

class Navigation extends StatefulWidget {
  final Widget initialScreen; // Accepts the screen to display first

  const Navigation({super.key, required this.initialScreen});

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 2; // Default to Home

  // Screens for each tab
  final List<Widget> _screens = [
    const Placeholder(), // Assignments
    const Placeholder(), // Notifications
    const DashboardScreen(), // Home
    const Placeholder(), // Directions
    const Placeholder(), // Profile
  ];

  late Widget _currentScreen;

  @override
  void initState() {
    super.initState();
    _currentScreen = widget.initialScreen; // Set initial screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentScreen,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.blueGrey,
        items: const [
          Icon(Icons.assignment, size: 30, color: Colors.white),
          Icon(Icons.notifications, size: 30, color: Colors.white),
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.directions_bus, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        index: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            _currentScreen = _screens[index]; // Change screen when navbar item tapped
          });
        },
      ),
    );
  }
}
