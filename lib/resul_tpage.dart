import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Formative Assessment 1',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            Table(
              border: TableBorder.all(color: Colors.black),
              columnWidths: {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(1),
                3: FlexColumnWidth(1),
              },
              children: [
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey[300]),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Subject Name',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Internal',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Theory',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Total',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Mathematics'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('20'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('30'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('50'),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Science'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('20'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('30'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('50'),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('English'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('20'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('30'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('50'),
                    ),
                  ],
                ),
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Total',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('60'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('90'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('150'),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add download functionality here
                },
                child: Text('Download'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}