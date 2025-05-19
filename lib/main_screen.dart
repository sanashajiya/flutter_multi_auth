import 'package:auth_project/email_authentication/login_page.dart';
import 'package:auth_project/email_authentication/signup_page.dart';
import 'package:auth_project/phone_authentication/phone_auth_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildSignInButton("Email/Password Sign Up", () {
               Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SignupPage(
                onClickedSignIn: () => Navigator.of(context).pop(),
              ),
            ));
            }),
            _buildSignInButton("Email/Password Login", () {
              Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => LoginPage(
                onClickedSignUp: () => Navigator.of(context).pop(),
              ),
            ));
            }),
            _buildSignInButton("Phone Sign In", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PhoneAuthScreen()),
              );
            }),
            _buildSignInButton("Google Sign In", () {
              // TODO: Implement Google sign in
            }),
            _buildSignInButton("Facebook Sign In", () {
              // TODO: Implement Facebook sign in
            }),
            _buildSignInButton("Anonymous Sign In", () {
              // TODO: Implement anonymous sign in
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
