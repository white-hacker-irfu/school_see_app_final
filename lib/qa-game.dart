import 'package:flutter/material.dart';
import 'package:school_see_teacher/qaStatistic.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class InvertedLibrary extends StatefulWidget {
  const InvertedLibrary({super.key});

  @override
  _InvertedLibraryState createState() => _InvertedLibraryState();
}

class _InvertedLibraryState extends State<InvertedLibrary> {
  List<Map<String, String>> tileData = [];

  @override
  void initState() {
    super.initState();
    _loadSavedQuestions();
  }

  Future<void> _saveQuestions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encodedData = jsonEncode(tileData);
    await prefs.setString('questions', encodedData);
  }

  Future<void> _loadSavedQuestions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedData = prefs.getString('questions');

    if (savedData != null) {
      List<dynamic> decodedData = jsonDecode(savedData);
      setState(() {
        tileData = decodedData.map((item) {
          return {
            "text": item["text"] as String,
            "subtitle": item["subtitle"] as String,
          };
        }).toList();
      });
    }
  }

  void _addNewTile(String question) {
    setState(() {
      tileData.add({
        "text": question,
        "subtitle": "Tap for more details",
      });
    });
    _saveQuestions();
  }

  void _showAddQuestionDialog() {
    TextEditingController questionController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // Rounded corners
          ),
          child: SizedBox(
            width: 600, // Increased width
            height: 550, // Increased height
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      "Enter Your Test Name ",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: TextField(
                      controller: questionController,
                      maxLines: null, 
                      expands: true, 
                      keyboardType: TextInputType.multiline,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                        hintText: "Enter here...",
                        hintStyle: TextStyle(color: Colors.grey[600]),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              color: Colors.blueAccent, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancel",
                            style: TextStyle(color: Colors.red, fontSize: 16)),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          if (questionController.text.isNotEmpty) {
                            _addNewTile(questionController.text);
                            Navigator.pop(context);
                          }
                        },
                        child: const Text("Add",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _handleTileTap(String question, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Qa_statistics_screen(
          questionNumber: index + 1,
          questionText: question,
          marks: 5, // Example marks assigned to each question
          correctCount: 15, // Example data (fetch actual from database)
          incorrectCount: 5, // Example data (fetch actual from database)
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFE0E5EC),
      appBar: AppBar(
        title: const Text("Question Library"),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Wrap(
            spacing: 10,
            runSpacing: 20,
            children: List.generate(tileData.length, (index) {
              final data = tileData[index];
              return SizedBox(
                width: (screenWidth - 40) / 2,
                child: _buildQuestionTile(
                  serial: index + 1,
                  title: data['text']!,
                  subtitle: data['subtitle']!,
                  onTap: () => _handleTileTap(data['text']!, index),
                ),
              );
            }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddQuestionDialog,
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}

Widget _buildQuestionTile({
  required int serial,
  required String title,
  required String subtitle,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(228, 218, 234, 230),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Q$serial",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 5),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    ),
  );
}
