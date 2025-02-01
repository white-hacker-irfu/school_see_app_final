import 'package:flutter/material.dart';

void main() {
  runApp(StudentdetailsPage());
}

class StudentdetailsPage extends StatelessWidget {
  const StudentdetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Profile',
      theme: ThemeData.light(), // Default light theme
      darkTheme: ThemeData.dark(), // Dark theme
      themeMode: ThemeMode.system, // Follows system theme
      home: StudentProfilePage(),
    );
  }
}

class StudentProfilePage extends StatefulWidget {
  const StudentProfilePage({super.key});

  @override
  _StudentProfilePageState createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {
  bool _isDarkMode = false;

  void _toggleDarkMode(bool value) {
    setState(() {
      _isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Profile'),
        actions: [
          Switch(
            value: _isDarkMode,
            onChanged: _toggleDarkMode,
            activeColor: Colors.orange,
          ),
        ],
      ),
      body: Theme(
        data: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Student Image
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/student_image.jpg'), // Add your image in assets
              ),
              SizedBox(height: 20),

              // Student Name
              Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),

              // Student ID
              Text(
                'ID: 123456',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),

              // Student Details Card
              Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Email
                      ListTile(
                        leading: Icon(Icons.email),
                        title: Text('Email'),
                        subtitle: Text('john.doe@example.com'),
                      ),
                      Divider(),

                      // Phone
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text('Phone'),
                        subtitle: Text('+1 234 567 890'),
                      ),
                      Divider(),

                      // Address
                      ListTile(
                        leading: Icon(Icons.location_on),
                        title: Text('Address'),
                        subtitle: Text('123 Main St, City, Country'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Additional Information
              Text(
                'Additional Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}