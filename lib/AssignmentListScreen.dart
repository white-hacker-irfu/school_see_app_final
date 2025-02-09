import 'package:flutter/material.dart';
import 'UploadAssignmentScreen.dart';

class AssignmentListScreen extends StatefulWidget {
  final String selectedClass;

  AssignmentListScreen({required this.selectedClass});

  @override
  _AssignmentListScreenState createState() => _AssignmentListScreenState();
}

class _AssignmentListScreenState extends State<AssignmentListScreen> {
  final List<Map<String, String>> assignments = [
    {
      "title": "Math Worksheet #3",
      "subject": "Mathematics",
      "dueDate": "12/02/2025",
      "description": "Solve problems 1-15 on page 42."
    },
    {
      "title": "English Essay: My Favorite Book",
      "subject": "English",
      "dueDate": "15/02/2025",
      "description":
      "Write a 500-word essay about your favorite book and why you enjoy it."
    },
    {
      "title": "Science Project: Solar System Model",
      "subject": "Science",
      "dueDate": "19/02/2025",
      "description":
      "Create a model of the solar system using any materials you like."
    },
  ];

  void _addAssignment(Map<String, String> newAssignment) {
    setState(() {
      assignments.insert(0, newAssignment); // Add to the top of the list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assignments - ${widget.selectedClass}',
      ),
      centerTitle: true, // Centers the title
      automaticallyImplyLeading: false, // Removes the back button
      backgroundColor: Colors.deepPurple[300], // Background color of the AppBar
    ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple[100]!, Colors.blue[100]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          padding: EdgeInsets.all(16.0),
          itemCount: assignments.length,
          itemBuilder: (context, index) {
            final assignment = assignments[index];
            return AssignmentCard(
              assignment: assignment,
              onViewDetails: () {
                _showAssignmentDetails(context, assignment);
              },
            );
          },
        ),
      ),
      // Corrected bottomNavigationBar
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6, // Decreased button width
          child: ElevatedButton(
            onPressed: () async {
              // Navigate to UploadAssignmentScreen and wait for the result
              final newAssignment = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UploadAssignmentScreen(),
                ),
              );

              // If a new assignment is returned, add it to the top of the list
              if (newAssignment != null) {
                _addAssignment(newAssignment as Map<String, String>);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple[300], // Button color
              padding: EdgeInsets.symmetric(vertical: 16.0), // Button height
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0), // Rounded corners
              ),
            ),
            child: Text(
              'Upload Assignment',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,color:Colors.black),
            ),
          ),
        ),
      ),
    );
  }

  void _showAssignmentDetails(
      BuildContext context, Map<String, String> assignment) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(assignment["title"]!),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Subject: ${assignment["subject"]!}"),
              SizedBox(height: 8),
              Text("Due Date: ${assignment["dueDate"]!}"),
              SizedBox(height: 8),
              Text("Description: ${assignment["description"]!}"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }
}

class AssignmentCard extends StatelessWidget {
  final Map<String, String> assignment;
  final VoidCallback onViewDetails;

  const AssignmentCard(
      {Key? key, required this.assignment, required this.onViewDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              assignment["title"]!,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.deepPurple[700],
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.book, size: 16, color: Colors.grey[600]),
                SizedBox(width: 4),
                Text(assignment["subject"]!,
                    style: TextStyle(color: Colors.grey[600])),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: Colors.grey[600]),
                SizedBox(width: 4),
                Text(
                  'Due: ${assignment["dueDate"]!}',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            SizedBox(height: 12),
            // Description
            Text(
              assignment["description"]!,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: onViewDetails,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.deepPurple[400],
                    padding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text('View Details'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
