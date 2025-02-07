import 'dart:ui';

import 'package:flutter/material.dart';
import '../widgets/otp_input_field.dart';

class OTPVerificationScreen extends StatefulWidget {
  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  TextEditingController otpController = TextEditingController();

  void verifyOTP(String otp) {
    print("Entered OTP: $otp"); // Replace with actual verification logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 80),

          // OTP Security Image
          Image.asset(
            'assets/images/otp-security.png',
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          ),

          const SizedBox(height: 30),

          // OTP Text
          const Text(
            "OTP Verification",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Text(
            "We have sent an OTP to your email",
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),

          const SizedBox(height: 20),

          // OTP Input Field with Reduced Size and Spacing
          OTPInputField(
            controller: otpController,
            onCompleted: verifyOTP,
            boxWidth: 40, // Reduced width of the OTP boxes
            boxHeight: 50, // Reduced height of the OTP boxes
            boxSpacing: 16, // Reduced spacing between boxes
          ),

          const SizedBox(height: 20),

          // "Auto Fill" Text
          const Text(
            "Auto Fill",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Changed to bold black
            ),
          ),

          const SizedBox(height: 20),

          // Verification Button with Reduced Size
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            onPressed: () {
              verifyOTP(otpController.text);
            },
            child: const Text(
              "Verify OTP",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}



Widget _buildTextField(
    String label, TextEditingController controller, String hint) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey)),
                color:
                    const Color.fromARGB(255, 189, 189, 189).withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 4,
                    offset: Offset(-10, -12),
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.7),
                    blurRadius: 7,
                    offset: Offset(10, 10),
                  ),
                ],
              ),
              child: TextFormField(
                controller: controller,
                style: const TextStyle(color: Colors.black87),
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(color: Colors.black45.withOpacity(0.6)),
                  filled: true,
                  fillColor: Colors.transparent,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter $label';
                  }
                  return null;
                },
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
