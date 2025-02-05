import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'attendence_page.dart';
import 'digitalclasses.dart';
import 'fee_status.dart';
import 'resul_tpage.dart';
import 'busTrackingScreen.dart';
import 'navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Image constants
    const String schoolImage = 'assets/images/school.png';
    const String school1Image = 'assets/images/school1.png';
    const String sportsImage = 'assets/images/sports.png';

    // Carousel image list
    final List<String> carouselImages = [schoolImage, school1Image, sportsImage];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Info and Avatar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'School See!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Where the students store their data',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/school_see_logo.png'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Carousel Slider
              CarouselSlider(
                options: CarouselOptions(
                  height: 150.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                ),
                items: carouselImages.map((imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: AssetImage(imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              // Dashboard Items
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                  children: [
                    _DashboardCard(
                      title: 'Student Attendance',
                      icon: Icons.person_rounded,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Navigation(initialScreen: const AttendencePage()),
                          ),
                        );
                      },
                    ),
                    _DashboardCard(
                      title: 'Digital Classes',
                      icon: Icons.cast_for_education,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Navigation(initialScreen: const Digitalclasses()),
                          ),
                        );
                      },
                    ),
                    _DashboardCard(
                      title: 'Fee Status',
                      icon: Icons.payment,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Navigation(initialScreen: FeeStatusPage()),
                          ),
                        );
                      },
                    ),
                    _DashboardCard(
                      title: 'Bus Tracking',
                      icon: Icons.directions_bus,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Navigation(initialScreen: BusTrackingScreen()),
                          ),
                        );
                      },
                    ),
                    _DashboardCard(
                      title: 'School Calendar',
                      icon: Icons.calendar_month,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Navigation(initialScreen: const PlaceholderScreen(title: 'School Calendar')),
                          ),
                        );
                      },
                    ),
                    _DashboardCard(
                      title: 'Assignments',
                      icon: Icons.assignment,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Navigation(initialScreen: const PlaceholderScreen(title: 'Assignments')),
                          ),
                        );
                      },
                    ),
                    _DashboardCard(
                      title: 'Results',
                      icon: Icons.bar_chart,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Navigation(initialScreen: ResultsPage()),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _DashboardCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10,
              offset: const Offset(4, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blueGrey),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  final String title;

  const PlaceholderScreen({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('$title Screen')),
    );
  }
}

