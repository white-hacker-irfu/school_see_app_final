// import 'package:flutter/material.dart';

// class AttendancePage extends StatefulWidget {
//   @override
//   _AttendancePageState createState() => _AttendancePageState();
// }

// class _AttendancePageState extends State<AttendancePage> {
//   // List of students with roll numbers and names
//   final List<Map<String, dynamic>> students = List.generate(
//     60,
//     (index) => {
//       "rollNumber": index + 1,
//       "name": "Student ${index + 1}",
//       "status": "Not Marked" // Default status
//     },
//   );

//   // Function to update attendance status
//   void _markAttendance(int index, String status) {
//     setState(() {
//       students[index]["status"] = status;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Attendance"),
//         backgroundColor: Colors.blueGrey,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           children: [
//             Expanded(
//               //  Add Expanded to fix the ListView inside Column
//               child: ListView.builder(
//                 itemCount: students.length,
//                 itemBuilder: (context, index) {
//                   final student = students[index];
//                   return Card(
//                     elevation: 4,
//                     margin:
//                         const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: ListTile(
//                       contentPadding: const EdgeInsets.all(10),
//                       title: Text(
//                         "Roll No: ${student["rollNumber"]} - ${student["name"]}",
//                         style: const TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       subtitle: Text(
//                         "Status: ${student["status"]}",
//                         style: TextStyle(
//                           color: student["status"] == "Present"
//                               ? Colors.green
//                               : student["status"] == "Absent"
//                                   ? Colors.red
//                                   : Colors.grey,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       trailing: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           // Present Button
//                           ElevatedButton(
//                             onPressed: () => _markAttendance(index, "Present"),
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.green.shade400,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                             ),
//                             child: const Text("Present"),
//                           ),
//                           const SizedBox(width: 10),
//                           // Absent Button
//                           ElevatedButton(
//                             onPressed: () => _markAttendance(index, "Absent"),
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.red.shade400,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                             ),
//                             child: const Text("Absent"),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             const SizedBox(height: 10), // Add some space above the button
//             ElevatedButton(
//               onPressed: () {
//                 print("Attendance submitted!");
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.lightBlue,
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               child: const Text(
//                 "Submit",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class AttendancePage extends StatefulWidget {
  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  // List of students with roll numbers and names
  final List<Map<String, dynamic>> students = List.generate(
    60,
    (index) => {
      "rollNumber": index + 1,
      "name": "Student ${index + 1}",
      "status": "Not Marked" // Default status
    },
  );

  // Function to update attendance status
  void _markAttendance(int index, String status) {
    setState(() {
      students[index]["status"] = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendance"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: students.length + 1, // +1 for the Submit button
          itemBuilder: (context, index) {
            if (index == students.length) {
              // Last item: Submit button
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      print("Attendance submitted!");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Submit",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            }

            final student = students[index];
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                title: Text(
                  "Roll No: ${student["rollNumber"]} - ${student["name"]}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Status: ${student["status"]}",
                  style: TextStyle(
                    color: student["status"] == "Present"
                        ? Colors.green
                        : student["status"] == "Absent"
                            ? Colors.red
                            : Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Present Button
                    ElevatedButton(
                      onPressed: () => _markAttendance(index, "Present"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade400,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text("Present"),
                    ),
                    const SizedBox(width: 10),
                    // Absent Button
                    ElevatedButton(
                      onPressed: () => _markAttendance(index, "Absent"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade400,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text("Absent"),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
