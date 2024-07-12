import 'package:catflix/services/auth_service.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.emailController,
    required this.passController,
  });

  final TextEditingController? emailController;
  final TextEditingController? passController;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        final emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

        if (emailController!.text.isNotEmpty &&
            emailValid.hasMatch(emailController!.text) &&
            passController!.text.length >= 8) {
          AuthService(context: context).signIn(
            email: emailController!.text,
            password: passController!.text,
          );
        } else if (emailController!.text.isEmpty ||
            !emailValid.hasMatch(emailController!.text)) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Invalid Email"),
            ),
          );
        } else if (passController!.text.isEmpty ||
            passController!.text.length < 8) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                  "Invalid Password, Password length should be more than 8 characters"),
            ),
          );
        }
      },
      color: Colors.blue,
      child: const Text('Login'),
    );
  }
}
