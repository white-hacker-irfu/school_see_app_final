import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController topicController = TextEditingController();
  final TextEditingController youtubeUrlController = TextEditingController();
  File? selectedFile; // To store the uploaded file
  bool isVideo = false; // To check if it's a video file

  // Function to pick an image or video
  Future<void> _pickFile() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickMedia();

    if (pickedFile != null) {
      setState(() {
        selectedFile = File(pickedFile.path);
        isVideo = pickedFile.path.endsWith('.mp4') ||
            pickedFile.path.endsWith('.mov') ||
            pickedFile.path.endsWith('.avi');
      });
    }
  }

  // Function to handle the upload process
  void _uploadData() {
    String subject = subjectController.text.trim();
    String topic = topicController.text.trim();
    String youtubeUrl = youtubeUrlController.text.trim();

    if (subject.isEmpty || topic.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter both Subject and Topic")),
      );
      return;
    }

    if (selectedFile == null && youtubeUrl.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content:
                Text("Please upload an image/video or enter a YouTube link")),
      );
      return;
    }

    // Perform the upload logic here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Uploaded Successfully!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Content"),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Subject Input Field
            TextField(
              controller: subjectController,
              decoration: InputDecoration(
                labelText: "Subject Name",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                prefixIcon: const Icon(Icons.book),
              ),
            ),
            const SizedBox(height: 15),

            // Topic Input Field
            TextField(
              controller: topicController,
              decoration: InputDecoration(
                labelText: "Topic Name",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                prefixIcon: const Icon(Icons.topic),
              ),
            ),
            const SizedBox(height: 20),

            // Upload Button (Gallery)
            Center(
              child: Container(
                width: 200,
                child: ElevatedButton.icon(
                  onPressed: _pickFile,
                  icon: const Icon(Icons.upload_file),
                  label: const Text(
                    " Upload from Gallery  ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ),

            if (selectedFile != null) ...[
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(isVideo ? Icons.video_file : Icons.image,
                      color: Colors.green),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Selected: ${selectedFile!.path.split('/').last}",
                      style: const TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],

            const SizedBox(height: 20),

            // YouTube Link Input Field
            TextField(
              controller: youtubeUrlController,
              decoration: InputDecoration(
                labelText: "YouTube URL (Optional)",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                prefixIcon: const Icon(Icons.link),
              ),
            ),
            const SizedBox(height: 20),

            // Upload Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _uploadData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text("Upload"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
