import 'package:catflix/components/reset_password.dart';
import 'package:catflix/components/text_field.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatelessWidget {
  ResetPasswordPage({
    super.key,
  });

  final TextEditingController? emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/loginwallpaper.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 2,
                    ),
                    const Text(
                      "Catflix",
                      style: TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontFamily: "TitanOne"),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    const SizedBox(height: 15),
                    TextFieldGlobal(
                      hintText: "Email",
                      controller: emailController!,
                      obsecure: false,
                    ),
                    const SizedBox(height: 15),
                    const SizedBox(height: 15),
                    ResetPasswordButton(emailController: emailController),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Remebered Your Password ?",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Log In",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                    const Spacer(
                      flex: 4,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
