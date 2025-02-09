// navigation.dart
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'dashboard_screen.dart';
import 'digitalclasses.dart';
import 'fee_status.dart';
import 'busTrackingScreen.dart';
import 'resul_tpage.dart';
import 'studentdetails_page.dart';
import 'notifications.dart'; // Import the NotificationsPage

class Navigation extends StatefulWidget {
  final Widget initialScreen;

  const Navigation({super.key, required this.initialScreen});

  @override
  NavigationState createState() => NavigationState();
}

class NavigationState extends State<Navigation> {
  int selectedIndex = 2; // Changed here

  final List<Widget> screens = [ // Changed here
    const Placeholder(),
    NotificationsPage(),
    const DashboardScreen(),
    const BusTrackingScreen(),
    const StudentdetailsPage(),
  ];

  late Widget currentScreen; // Changed here

  @override
  void initState() {
    super.initState();
    currentScreen = widget.initialScreen; // Changed here
  }

  Color getNavBarBackgroundColor() { // Changed here
    if (currentScreen is DashboardScreen) { // Changed here
      return const Color(0xFFF5F7FB);
    } else if (currentScreen is EducationPage) { // Changed here
      return const Color(0xFFF5F7FB);
    } else if (currentScreen is FeeStatusPage) { // Changed here
      return Colors.white;
    } else if (currentScreen is BusTrackingScreen) { // Changed here
      return Colors.deepPurple;
    } else if (currentScreen is ResultsPage) { // Changed here
      return Colors.white;
    } else if (currentScreen is NotificationsPage) { // Changed here
      return const Color(0xFF00C853);
    } else {
      return const Color(0xFFF5F7FB);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentScreen, // Changed here
      bottomNavigationBar: Container(
        color: getNavBarBackgroundColor(), // Changed here
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
          index: selectedIndex, // Changed here
          onTap: (index) {
            setState(() {
              selectedIndex = index; // Changed here
              currentScreen = screens[index]; // Changed here
            });
          },
        ),
      ),
    );
  }
}