import 'package:catflix/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final TextEditingController? emailController = TextEditingController();
  final TextEditingController? passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const HomePage();
        } else {
          return LoginPage(
              emailController: emailController, passController: passController);
        }
      },
    );
  }
}
