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
            ],
          ),
          child: TextField(
            controller: TextEditingController()
              ..text = controller.text.length > index
                  ? controller.text[index]
                  : '',
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