import 'package:bill_board/utilities/admi_login_page.dart';
import 'package:bill_board/pages/home_page.dart';
import 'package:bill_board/utilities/lecturer_login_page.dart';
import 'package:bill_board/utilities/student_login_page.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String userType = 'Administrator';
  String selectedTitle = 'Mr'; // Default title value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6F0),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                _buildInputField(nameController, "Full Name", Icons.person_outline, validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                }),
                const SizedBox(height: 20),
                _buildInputField(emailController, "Email", Icons.person, validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                }),
                const SizedBox(height: 20),
                _buildInputField(passwordController, "Password", Icons.lock, obscureText: true, validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                }),
                const SizedBox(height: 20),

                // Title Dropdown
                DropdownButtonFormField<String>(
                  value: selectedTitle,
                  decoration: _buildDropdownDecoration(),
                  items: const [
                    DropdownMenuItem(value: 'Professor', child: Text('Professor')),
                    DropdownMenuItem(value: 'Dr', child: Text('Dr')),
                    DropdownMenuItem(value: 'Mr', child: Text('Mr')),
                    DropdownMenuItem(value: 'Mrs', child: Text('Mrs')),
                    DropdownMenuItem(value: 'Miss', child: Text('Miss')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedTitle = value ?? 'Mr';
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // User Type Dropdown
                DropdownButtonFormField<String>(
                  value: userType.isNotEmpty ? userType : null,
                  decoration: _buildDropdownDecoration(),
                  items: const [
                    DropdownMenuItem(value: 'Administrator', child: Text('Administrator')),
                    DropdownMenuItem(value: 'Lecturer', child: Text('Lecturer')),
                    DropdownMenuItem(value: 'Student', child: Text('Student')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      userType = value ?? '';
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a user type';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (userType == 'Administrator') {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
                      } else if (userType == 'Lecturer') {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const LecturerLoginPage()));
                      } else if (userType == 'Student') {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const StudentLoginPage()));
                      }
                    }
                  },
                  child: const Text("Sign Up", style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      },
                      child: const Text("Already have an account? Sign in"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller, String hint, IconData icon, {bool obscureText = false, String? Function(String?)? validator}) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  InputDecoration _buildDropdownDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    );
  }
}
