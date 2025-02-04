import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'payment.dart';

class FeeStatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20), // Move container slightly down
            Container(
              width: double.infinity, // Full width container
              padding: EdgeInsets.symmetric(vertical: 16), // Vertical padding
              decoration: BoxDecoration(
                color: Colors.blueGrey[100], // Background color
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    'Fee Status',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
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
                ],
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
                    endDate: '31-03-2025',
                    status: 'Completed',
                  ),
                  FeeCard(
                    term: 'Term 2',
                    fee: 25000,
                    percentagePaid: 0.3,
                    endDate: '30-06-2025',
                    status: 'Pending',
                  ),
                  FeeCard(
                    term: 'Term 3',
                    fee: 20000,
                    percentagePaid: 0.2,
                    endDate: '30-09-2025',
                    status: 'Over Due',
                  ),
                  FeeCard(
                    term: 'Exam Fee',
                    fee: 5000,
                    percentagePaid: 1.0,
                    endDate: '15-10-2025',
                    status: 'Pending',
                  ),
                  FeeCard(
                    term: 'Bus Fee',
                    fee: 20000,
                    percentagePaid: 1.0,
                    endDate: '15-10-2025',
                    status: 'Completed',
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to PaymentPage when "Proceed to Pay" is clicked
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentPage(
                              term: 'All Terms',  // You can adjust this dynamically as needed
                              fee: 50000,      // Adjust the fee dynamically
                              endDate: '30-06-2025',  // Adjust the end date dynamically
                              status: 'Pending', // Adjust the status dynamically
                            ),
                          ),
                        );
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
                  )

                ],
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
    bool isClickable = status != 'Completed'; // Only clickable if not "Completed"

    return GestureDetector(
      onTap: isClickable
          ? () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PaymentPage(
              term: term,
              fee: fee,
              endDate: endDate,
              status: status,
            ),
          ),
        );
      }
          : null, // No action if "Completed"
      child: Card(
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
      ),
    );
  }
}
