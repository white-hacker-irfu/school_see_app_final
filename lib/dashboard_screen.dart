import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; // For indicator
import 'attendence_page.dart';
import 'digitalclasses.dart';
import 'fee_status.dart';
import 'resul_tpage.dart';
import 'busTrackingScreen.dart';
import 'navigation.dart';
import 'qa-game.dart';
import 'ClassSelectionScreen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key); // Added Key? key

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;

  final List<String> carouselImages = [
    'assets/images/school.png',
    'assets/images/school1.png',
    'assets/images/sports.png',
    'assets/images/school.png',
    'assets/images/school1.png',
  ];

  @override
  Widget build(BuildContext context) {
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
                        'School See Teacher App!',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Where teachers update data',
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
                options: CarouselOptions(
                  height: 150.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: false,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),

              const SizedBox(height: 10),

              // Smooth Page Indicator
              Center(
                child: AnimatedSmoothIndicator(
                  activeIndex: _currentIndex,
                  count: carouselImages.length,
                  effect: const ExpandingDotsEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    activeDotColor: Colors.blueGrey,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Dashboard Items
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.9,
                  children: [
                    _DashboardCard(
                      title: 'Update Student Attendance',
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
                      title: 'Upload Digital Classes',
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
                      title: 'School \n Calendar',
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
                      title: 'Upload Assignments',
                      icon: Icons.assignment,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ClassSelectionScreen()),
                        );
                      },
                    ),
                    _DashboardCard(
                      title: 'Upload Student Marks',
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
                    _DashboardCard(
                      title: 'Raise Questions For QA Game',
                      icon: Icons.videogame_asset,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Navigation(initialScreen: QAExamScreen()),
                          ),
                        );
                      },
                    ),
                    _DashboardCard(
                      title: 'Time Table',
                      icon: Icons.access_time_filled,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Navigation(initialScreen: const PlaceholderScreen(title: 'Time Table')),
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
    Key? key, // Added Key? key
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

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

  const PlaceholderScreen({Key? key, required this.title}) : super(key: key); // Added Key? key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('$title Screen')),
    );
  }
}