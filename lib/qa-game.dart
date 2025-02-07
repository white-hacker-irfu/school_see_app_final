import 'package:flutter/material.dart';

class QAExamScreen extends StatelessWidget {
  const QAExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      body: Column(
        children: [
          const SizedBox(height: 40),
          const Text(
            "Hello 😊",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          const Text(
            "What do you need to know?",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black, width: 2),
              color: Colors.white,
            ),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.camera_alt, size: 24),
                SizedBox(width: 10),
                Text("Snap to Solve", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(5, (index) {
                            return Row(
                              children: [
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: index == 0
                                      ? Colors.green
                                      : Colors.grey.shade300,
                                  child: index == 0
                                      ? const Icon(Icons.check, size: 15, color: Colors.white)
                                      : Text("${index + 1}", style: const TextStyle(fontSize: 14)),
                                ),
                                if (index < 4)
                                  Container(
                                    width: 47,
                                    height: 3,
                                    color: Colors.grey,
                                  ),
                              ],
                            );
                          }),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Explore Features", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black38)),
                                Text("Join Now", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              child: const Text("let's start"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Stack(
                          children: List.generate(3, (index) {
                            return Positioned(
                              left: index * 20,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundImage: AssetImage('assets/profile${index + 1}.png'),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(width: 50),
                        const Expanded(
                          child: Text(
                            "The top champions",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios, size: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
