
import 'package:auth_project/Authentication/login_page.dart';
import 'package:auth_project/Authentication/signup_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  void toggle() => setState(() => isLogin = !isLogin);

  @override
  @override
Widget build(BuildContext context) {
  return isLogin
      ? LoginPage(onClickedSignUp: toggle)
      : SignupPage(onClickedSignIn: toggle);
}

}
