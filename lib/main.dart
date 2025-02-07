import 'package:flutter/material.dart';
import 'registrationpage.dart';
import 'reset-password.dart';
import 'navigation.dart';
import 'dashboard_screen.dart';

void main() {
  runApp(const SchoolSeeApp());
}

class SchoolSeeApp extends StatelessWidget {
  const SchoolSeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School See - Parent Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
        fontFamily: 'Arial',
      ),
      home: const AdminLoginPage(),
    );
  }
}

class AdminLoginPage extends StatelessWidget {
  const AdminLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E5EC),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo with shadow styling
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500,
                        offset: const Offset(5, 5),
                        blurRadius: 15,
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        offset: Offset(-5, -5),
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.white,
                    backgroundImage: const AssetImage(
                      'assets/images/school_see_logo.png', // Ensure this path is correct
                    ),
                  ),
                ),
              ),
              // Container with form
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFE0E5EC),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade500,
                      offset: const Offset(10, 10),
                      blurRadius: 20,
                    ),
                    const BoxShadow(
                      color: Colors.white,
                      offset: Offset(-10, -10),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Login Title
                    const Text(
                      'Parent Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Login Form
                    const _LoginForm(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Enroll ID Input
        const Text(
          'Enroll ID',
          style: TextStyle(fontSize: 16, color: Colors.black87),
        ),
        const SizedBox(height: 8),
        const _CustomTextField(hintText: 'Enter your Enroll ID'),
        const SizedBox(height: 16),
        // Password Input
        const Text(
          'Password',
          style: TextStyle(fontSize: 16, color: Colors.black87),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: !_isPasswordVisible,
          decoration: InputDecoration(
            hintText: 'Enter your password',
            filled: true,
            fillColor: const Color(0xFFE0E5EC),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.red,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Login Button
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => Navigation(initialScreen: const DashboardScreen()), // Pass initialScreen
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF97C8D6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text(
              'Login',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
        ),

        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegistrationPage(),
                  ),
                );
              },
              child: const Text(
                'Register',
                style: TextStyle(color: Color(0xFF007AFF)),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ResetPasswordApp(),
                  ),
                );
              },
              child: const Text(
                'Forgot Password?',
                style: TextStyle(color: Color(0xFFE53D6D)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CustomTextField extends StatelessWidget {
  final String hintText;
  final bool isPassword;

  const _CustomTextField({
    required this.hintText,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: const Color(0xFFE0E5EC),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: const Center(
        child: Text('Forgot Password Page Content'),
      ),
    );
  }
}
