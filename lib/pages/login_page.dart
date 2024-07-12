import 'package:catflix/components/text_field.dart';
import 'package:catflix/pages/resetPassword_page.dart';
import 'package:flutter/material.dart';
import './signup_page.dart';
import '../components/login_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
    required this.emailController,
    required this.passController,
  });

  final TextEditingController? emailController;
  final TextEditingController? passController;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {},
      child: Scaffold(
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
                      TextFieldGlobal(
                        hintText: "Email",
                        controller: emailController!,
                        obsecure: false,
                      ),
                      const SizedBox(height: 15),
                      TextFieldGlobal(
                        hintText: "Password",
                        controller: passController!,
                        obsecure: true,
                      ),
                      const SizedBox(height: 15),
                      LoginButton(
                          emailController: emailController,
                          passController: passController),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Forgot Your Password ?",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return ResetPasswordPage();
                                }));
                              },
                              child: const Text(
                                "Reset Passwrod",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't Have An Account ?",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return SignupPage();
                                }));
                              },
                              child: const Text(
                                "Sign Up",
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
      ),
    );
  }
}
