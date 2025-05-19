import 'package:auth_project/email_authentication/login_page.dart';
import 'package:auth_project/email_authentication/signup_page.dart';
import 'package:auth_project/phone_authentication/phone_auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      // Optional manual navigation (only if not using auth listener):
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(builder: (_) => const HomePage()),
      // );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Google sign-in failed')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Something went wrong during sign-in')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildSignInButton("Email/Password Sign Up", () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SignupPage(
                    onClickedSignIn: () => Navigator.of(context).pop(),
                  ),
                ),
              );
            }),
            _buildSignInButton("Email/Password Login", () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LoginPage(
                    onClickedSignUp: () => Navigator.of(context).pop(),
                  ),
                ),
              );
            }),
            _buildSignInButton("Phone Sign In", () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PhoneAuthScreen(),
                ),
              );
            }),
            _buildSignInButton("Google Sign In", () async {
              await signInWithGoogle(context);
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
