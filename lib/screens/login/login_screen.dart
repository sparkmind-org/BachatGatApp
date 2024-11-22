import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../routes/route_generator.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Rive animation in the background
          
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Logo with SVG icon
                  Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icon/LoginIcon.svg',
                        height: 120,
                        width: 120,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Bachat Gat',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Welcome Back\nHello there, sign in to continue',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Account Number Input
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Account No',
                      labelStyle: const TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 20),
                  // Password Input
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: const TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: const Icon(Icons.visibility, color: Colors.black),
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                       Navigator.pushNamed(context, RouteGenerator.home);
                      },
                      child: const Text(
                        'Forgot your password?',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Login Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Colors.blueAccent,
                    ),
                    onPressed: () {
                     Navigator.pushNamed(context, RouteGenerator.home);
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Register Option
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Don't have an account? Request Admin",
                      style: TextStyle(color: Colors.black),
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
