import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'dashboard_screen.dart';
import 'attendence_page.dart';
import 'digitalclasses.dart';
import 'fee_status.dart';
import 'busTrackingScreen.dart';
import 'resul_tpage.dart';

class Navigation extends StatefulWidget {
  final Widget initialScreen;

  const Navigation({super.key, required this.initialScreen});

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 2;

  final List<Widget> _screens = [
    const Placeholder(),
    const Placeholder(),
    const DashboardScreen(),
    const Placeholder(),
    const Placeholder(),
  ];

  late Widget _currentScreen;

  @override
  void initState() {
    super.initState();
    _currentScreen = widget.initialScreen;
  }

  Color _getNavBarBackgroundColor() {
    if (_currentScreen is DashboardScreen) {
      return Color(0xFFF5F7FB);
    } else if (_currentScreen is AttendencePage) {
      return Colors.blue;
    } else if (_currentScreen is EducationPage) {
      return Color(0xFFF5F7FB);
    } else if (_currentScreen is FeeStatusPage) {
      return Colors.white;
    } else if (_currentScreen is BusTrackingScreen) {
      return Colors.deepPurple;
    } else if (_currentScreen is ResultsPage) {
      return Colors.white;
    } else {
      return Color(0xFFF5F7FB);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentScreen,
      bottomNavigationBar: Container(
        color: _getNavBarBackgroundColor(),
        child: CurvedNavigationBar(
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
              _currentScreen = _screens[index];
            });
          },
        ),
      ),
    );
  }
}
