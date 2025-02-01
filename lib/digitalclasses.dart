import 'package:flutter/material.dart';
import 'subjectclasses_page.dart';

void main() {
  runApp(const Digitalclasses());
}

class Digitalclasses extends StatelessWidget {
  const Digitalclasses({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Education Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EducationPage(),
    );
  }
}

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Education Page'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // "Most Viewed" Section
              const Text(
                'Most Viewed',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 150, // Increased size to show 2 items
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildLargeCircularBanner('Maths', 'assets/images/maths.png'),
                    _buildLargeCircularBanner('Science', 'assets/images/science.png'),
                    _buildLargeCircularBanner('Social', 'assets/images/social.png'),
                    _buildLargeCircularBanner('English', 'assets/images/english2.png'),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Subjects Section
              const Text(
                'Subjects',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildSubjectCard(
                  context, 'Mathematics', 'assets/images/maths.png', Colors.blue),
              const SizedBox(height: 10),
              _buildSubjectCard(
                  context, 'Science', 'assets/images/science.png', Colors.green),
              const SizedBox(height: 10),
              _buildSubjectCard(
                  context, 'Social', 'assets/images/social.png', Colors.purple),
              const SizedBox(height: 10),
              _buildSubjectCard(
                  context, 'English', 'assets/images/english2.png', Colors.red),
            ],
          ),
        ),
      ),
    );
  }

  // Large Circular Banner Widget
  Widget _buildLargeCircularBanner(String title, String imagePath) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          width: 120, // Increased size
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  // Subject Card Widget
  Widget _buildSubjectCard(
      BuildContext context, String title, String imagePath, Color color) {
    return GestureDetector(
      onTap: () {
        // Navigate to a new page on tap
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CourseListPage(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.8),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white, width: 2), // Added white border
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              child: Image.asset(
                imagePath,
                width: 120, // Increased size
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Subject Detail Page
class SubjectDetailPage extends StatelessWidget {
  final String title;

  const SubjectDetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Text(
          'Welcome to $title!',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
