import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildSignInButton("Email/Password Sign Up", () {
              // Handle Email/Password Sign Up
            }),
            _buildSignInButton("Email/Password Login", () {
              // Handle Email/Password Login
            }),
            _buildSignInButton("Phone Sign In", () {
              // Handle Phone Sign In
            }),
            _buildSignInButton("Google Sign In", () {
              // Handle Google Sign In
            }),
            _buildSignInButton("Facebook Sign In", () {
              // Handle Facebook Sign In
            }),
            _buildSignInButton("Anonymous Sign In", () {
              // Handle Anonymous Sign In
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildSignInButton(String title, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
          backgroundColor: Colors.blue,
        ),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
