import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  final String term;
  final int fee;
  final String endDate;
  final String status;

  const PaymentPage({
    required this.term,
    required this.fee,
    required this.endDate,
    required this.status,
  });

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String? selectedPaymentMethod;
  String? selectedUPIMethod;

  void _showUPIOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select a UPI payment method',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  _buildRadioTile(setModalState, 'PhonePe', Colors.blue),
                  _buildRadioTile(setModalState, 'Google Pay', Colors.green),
                  _buildRadioTile(setModalState, 'Paytm', Colors.orange),
                  _buildRadioTile(setModalState, 'Enter UPI ID', Colors.red),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildRadioTile(StateSetter setModalState, String value, Color color) {
    return ListTile(
      leading: Icon(Icons.account_balance_wallet, color: color),
      title: Text(value),
      trailing: Radio<String>(
        value: value,
        groupValue: selectedUPIMethod,
        onChanged: (String? newValue) {
          setState(() {
            selectedUPIMethod = newValue;
            selectedPaymentMethod = 'UPI Payment - $newValue';
          });
          setModalState(() {
            selectedUPIMethod = newValue;
          });
          Navigator.pop(context);
        },
      ),
      onTap: () {
        setState(() {
          selectedUPIMethod = value;
          selectedPaymentMethod = 'UPI Payment - $value';
        });
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Details'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.term,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text('Fee: ₹${widget.fee}', style: TextStyle(fontSize: 18)),
                      SizedBox(height: 8),
                      Text('End Date: ${widget.endDate}', style: TextStyle(fontSize: 18)),
                      SizedBox(height: 8),
                      Text('Status: ${widget.status}', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Add Extra Term',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            Divider(height: 20, thickness: 2),
            ListTile(
              leading: Icon(Icons.account_balance_wallet, color: Colors.orange),
              title: Text('UPI Payment'),
              subtitle: Text(selectedUPIMethod ?? 'Google Pay, PhonePe, Paytm and more'),
              trailing: Radio<String>(
                value: 'UPI Payment',
                groupValue: selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    selectedPaymentMethod = value;
                    _showUPIOptions(context);
                  });
                },
              ),
              onTap: () => _showUPIOptions(context),
            ),
            ListTile(
              leading: Icon(Icons.credit_card, color: Colors.blue),
              title: Text('Credit & Debit Cards'),
              subtitle: Text('Add a new credit or debit card'),
              trailing: Radio<String>(
                value: 'Credit & Debit Cards',
                groupValue: selectedPaymentMethod,
                onChanged: (value) => setState(() => selectedPaymentMethod = value),
              ),
              onTap: () => setState(() => selectedPaymentMethod = 'Credit & Debit Cards'),
            ),
            ListTile(
              leading: Icon(Icons.local_atm, color: Colors.green),
              title: Text('Net Banking'),
              trailing: Radio<String>(
                value: 'Net Banking',
                groupValue: selectedPaymentMethod,
                onChanged: (value) => setState(() => selectedPaymentMethod = value),
              ),
              onTap: () => setState(() => selectedPaymentMethod = 'Net Banking'),
            ),
            ListTile(
              leading: Icon(Icons.money, color: Colors.red),
              title: Text('Cash'),
              trailing: Radio<String>(
                value: 'Cash',
                groupValue: selectedPaymentMethod,
                onChanged: (value) => setState(() => selectedPaymentMethod = value),
              ),
              onTap: () => setState(() => selectedPaymentMethod = 'Cash'),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Continue',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}