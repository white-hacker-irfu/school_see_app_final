import 'package:flutter/material.dart';

class Qa_statistics_screen extends StatelessWidget {
  final int questionNumber;
  final String questionText;
  final int marks;
  final int correctCount;
  final int incorrectCount;

  const Qa_statistics_screen({
    super.key,
    required this.questionNumber,
    required this.questionText,
    required this.marks,
    required this.correctCount,
    required this.incorrectCount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Question Statistics"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Question $questionNumber",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              questionText,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatCard("Marks", marks.toString(), Colors.green),
                _buildStatCard("Correct", correctCount.toString(), Colors.blue),
                _buildStatCard(
                    "Incorrect", incorrectCount.toString(), Colors.red),
              ],
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Center(
                child: Icon(
                  Icons.bar_chart,
                  size: 400,
                  color: Colors.blueAccent.withOpacity(0.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            label,
            style: TextStyle(fontSize: 14, color: color),
          ),
        ],
      ),
    );
  }
}
