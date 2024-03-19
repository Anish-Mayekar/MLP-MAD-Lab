import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashcards_quiz/views/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _errorText = '';

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signInWithEmailAndPassword() async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: _usernameController.text.trim(),
        password: _passwordController.text,
      );
      if (userCredential.user != null) {
        // Navigate to home page if authentication successful
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage1()),
        );
      }
    } catch (e) {
      setState(() {
        _errorText =
            'Invalid email or password'; // Set error message for invalid credentials
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: const Color.fromARGB(255, 215, 1, 11),
      ),
      backgroundColor: const Color.fromARGB(255, 215, 1, 11),
      body: SingleChildScrollView(
        // Make content scrollable
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your image widget here
            Image.asset(
              "assets/login_imgg.png",
              width: 250,
              height: 250,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: "Username",
                labelStyle: TextStyle(
                  color: Colors.white, // Set text color
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: const TextStyle(
                  color: Colors.white, // Set text color
                ),
                errorText: _errorText.isNotEmpty ? _errorText : null,
                errorStyle: const TextStyle(
                    color: Colors.white), // Set error text color
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  _signInWithEmailAndPassword, // Call method for authentication
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
