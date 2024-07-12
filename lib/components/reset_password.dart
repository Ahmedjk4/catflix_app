import 'package:catflix/services/auth_service.dart';
import 'package:flutter/material.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({
    super.key,
    required this.emailController,
  });

  final TextEditingController? emailController;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        final emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

        if (emailController!.text.isNotEmpty &&
            emailValid.hasMatch(emailController!.text)) {
          AuthService(context: context).resetPassword(
            email: emailController!.text,
          );
        } else if (emailController!.text.isEmpty ||
            !emailValid.hasMatch(emailController!.text)) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Invalid Email"),
            ),
          );
        }
      },
      color: Colors.blue,
      child: const Text('Send Password Reset Email'),
    );
  }
}
