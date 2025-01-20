import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'dashboard_screen.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  // Set the default selected index to 2 (center/home icon)
  int _selectedIndex = 2;

  // Screens corresponding to the navigation bar items
  final List<Widget> _screens = [
    const Placeholder(), // Assignment screen (Placeholder)
    const Placeholder(), // Notifications screen (Placeholder)
    const DashboardScreen(), // Home screen (Dashboard)
    const Placeholder(), // Directions screen (Placeholder)
    const Placeholder(), // Profile screen (Placeholder)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Display the currently selected screen
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent, // Background behind the navigation bar
        color: Colors.blueGrey, // Color of the navigation bar
        items: const [
          Icon(Icons.assignment, size: 30, color: Colors.white), // Assignment icon
          Icon(Icons.notifications, size: 30, color: Colors.white), // Notifications icon
          Icon(Icons.home, size: 30, color: Colors.white), // Home icon
          Icon(Icons.directions_bus, size: 30, color: Colors.white), // Directions icon
          Icon(Icons.person, size: 30, color: Colors.white), // Profile icon
        ],
        index: _selectedIndex, // Set the initial active index
        onTap: (index) {
          setState(() {
            _selectedIndex = index; // Update the selected index when an icon is tapped
          });
        },
      ),
    );
  }
}
