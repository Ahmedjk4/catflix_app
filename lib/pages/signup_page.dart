import 'package:catflix/components/register_button.dart';
import 'package:catflix/components/text_field.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  SignupPage({
    super.key,
  });

  final TextEditingController? nameController = TextEditingController();
  final TextEditingController? emailController = TextEditingController();
  final TextEditingController? passController = TextEditingController();

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
                        hintText: "Name",
                        controller: nameController!,
                        obsecure: false,
                      ),
                      const SizedBox(height: 15),
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
                      RegisterButton(
                          nameController: nameController,
                          emailController: emailController,
                          passController: passController),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already Have An Account ?",
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
      ),
    );
  }
}
