// lib/screens/UploadAssignmentScreen.dart

import 'package:flutter/material.dart';

class UploadAssignmentScreen extends StatefulWidget {
  @override
  _UploadAssignmentScreenState createState() => _UploadAssignmentScreenState();
}

class _UploadAssignmentScreenState extends State<UploadAssignmentScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController dueDateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upload Assignment"),
      centerTitle: true, // Centers the title
      automaticallyImplyLeading: false, // Removes the back button
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Assignment Title"),
            ),
            TextField(
              controller: subjectController,
              decoration: InputDecoration(labelText: "Subject"),
            ),
            TextField(
              controller: dueDateController,
              decoration: InputDecoration(labelText: "Due Date (DD/MM/YYYY)"),
              keyboardType: TextInputType.datetime,
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: "Description"),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Map<String, String> newAssignment = {
                  "title": titleController.text,
                  "subject": subjectController.text,
                  "dueDate": dueDateController.text,
                  "description": descriptionController.text,
                };
                Navigator.pop(context, newAssignment);
              },
              child: Text("Upload Assignment"),
            ),
          ],
        ),
      ),
    );
  }
}
