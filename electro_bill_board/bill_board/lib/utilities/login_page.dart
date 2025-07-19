import 'package:bill_board/pages/admi_page.dart';
import 'package:bill_board/utilities/admi_login_page.dart';
import 'package:bill_board/utilities/lecturer_login_page.dart';
import 'package:bill_board/utilities/student_login_page.dart';
import 'package:flutter/material.dart';

class GeneralLoginPage extends StatelessWidget {
  const GeneralLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6F0),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome to Electronic Billboard",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                'Login As',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              _buildLoginButton(context, "Administrator ", Colors.green, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              }),
              const SizedBox(height: 20),
              _buildLoginButton(context, "Lecturer ", Colors.blue, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LecturerLoginPage()),
                );
              }),
              const SizedBox(height: 20),
              _buildLoginButton(context, "Student ", Colors.orange, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const StudentLoginPage()),
                );
              }),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/admi_signup');
                      },
                      child: const Text("Don't have an admin account? Sign up"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context, String title, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onPressed,
      child: Text(title, style: const TextStyle(color: Colors.white)),
    );
  }
}
