import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class FeeStatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16), // Move 'Fee Status' slightly down
            Text(
              'Fee Status',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8), // Make 'Fee Status' and 'Class 8' closer
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Class: 8',
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  FeeCard(
                    term: 'Term 1',
                    fee: 40000,
                    percentagePaid: 0.5,
                    endDate: '2025-03-31',
                    status: 'Completed',
                  ),
                  FeeCard(
                    term: 'Term 2',
                    fee: 25000,
                    percentagePaid: 0.3,
                    endDate: '2025-06-30',
                    status: 'Pending',
                  ),
                  FeeCard(
                    term: 'Term 3',
                    fee: 20000,
                    percentagePaid: 0.2,
                    endDate: '2025-09-30',
                    status: 'Over Due',
                  ),
                  FeeCard(
                    term: 'Exam Fee',
                    fee: 5000,
                    percentagePaid: 1.0,
                    endDate: '2025-10-15',
                    status: 'Pending',
                  ),
                  FeeCard(
                    term: 'Bus Fee',
                    fee: 20000,
                    percentagePaid: 1.0,
                    endDate: '2025-10-15',
                    status: 'Completed',
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle Fee Due action
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                backgroundColor: Colors.blueGrey,
              ),
              child: Text(
                'Proceed to Pay',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeeCard extends StatelessWidget {
  final String term;
  final int fee;
  final double percentagePaid;
  final String endDate;
  final String status;

  const FeeCard({
    required this.term,
    required this.fee,
    required this.percentagePaid,
    required this.endDate,
    required this.status,
  });

  Color _getBackgroundColor() {
    switch (status) {
      case 'Pending':
        return Colors.orangeAccent;
      case 'Completed':
        return Colors.green;
      case 'Over Due':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Color _getTextColor() {
    return status == 'Completed' ? Colors.white : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      margin: EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          color: _getBackgroundColor(),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFD1D9E6).withOpacity(1),
              blurRadius: 30,
              offset: Offset(18, 18),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        term,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: _getTextColor(),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Fee: ₹$fee',
                        style: TextStyle(
                          fontSize: 16,
                          color: _getTextColor(),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'End Date: $endDate',
                        style: TextStyle(
                          fontSize: 16,
                          color: _getTextColor(),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: status == 'Completed' ? Colors.white : Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        color: status == 'Completed' ? Colors.green : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                right: 15,
                child: CircularPercentIndicator(
                  radius: 22.5,
                  lineWidth: 4.0,
                  percent: percentagePaid,
                  center: Text(
                    '${(percentagePaid * 100).toInt()}%',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  progressColor: Colors.white,
                  backgroundColor: Colors.black26,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


