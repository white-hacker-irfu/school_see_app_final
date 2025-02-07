import 'dart:ui';

import 'package:flutter/material.dart';

class OTPInputField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) onCompleted;
  final double boxWidth;
  final double boxHeight;
  final double boxSpacing;

  OTPInputField({
    required this.controller,
    required this.onCompleted,
    this.boxWidth = 50, // Default width
    this.boxHeight = 60, // Default height
    this.boxSpacing = 200, // Default spacing
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Container(
          width: boxWidth,
          height: boxHeight,
          margin: EdgeInsets.symmetric(horizontal: boxSpacing / 2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 4,
                offset: Offset(-10, -12), // Top and left
              ),
              // White shadow on bottom-right
              BoxShadow(
                color: Colors.white.withOpacity(0.7),
                blurRadius: 7,
                offset: Offset(10, 10), // Bottom and right
              ),
            ],
          ),
          child: TextField(
            controller: TextEditingController()
              ..text =
                  controller.text.length > index ? controller.text[index] : '',
            onChanged: (value) {
              if (value.length == 1 && index < 5) {
                FocusScope.of(context).nextFocus();
              } else if (value.isEmpty && index > 0) {
                FocusScope.of(context).previousFocus();
              }
              controller.text = controller.text.replaceRange(
                  index, index + 1, value.isNotEmpty ? value : '');
              if (controller.text.length == 6) {
                onCompleted(controller.text);
              }
            },
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: const InputDecoration(
              counterText: "",
              border: InputBorder.none,
            ),
          ),
        );
      }),
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
            filter: ImageFilter.blur(
                sigmaX: 10, sigmaY: 10), // Frosted glass effect
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
                    offset: Offset(-10, -12), // Top and left
                  ),
                  // White shadow on bottom-right
                  BoxShadow(
                    color: Colors.white.withOpacity(0.7),
                    blurRadius: 7,
                    offset: Offset(10, 10), // Bottom and right
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
