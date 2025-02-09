// lib/screens/classselectionscreen.dart
import 'package:flutter/material.dart';
import 'AssignmentListScreen.dart';

class ClassSelectionScreen extends StatelessWidget {
  final List<String> classes = [
    'Class 1',
    'Class 2',
    'Class 3',
    'Class 4',
    'Class 5',
    'Class 6',
    'Class 7',
    'Class 8',
    'Class 9',
    'Class 10',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Class'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false, // Removes the back button
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple[100]!, Colors.blue[100]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          padding: EdgeInsets.all(16.0),
          itemCount: classes.length,
          itemBuilder: (context, index) {
            final className = classes[index];
            return GestureDetector(
              onTap: () {
                // Navigate to AssignmentListScreen with the selected class
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AssignmentListScreen(selectedClass: className),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  contentPadding: EdgeInsets.all(16.0),
                  title: Text(
                    className,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple[700],
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
