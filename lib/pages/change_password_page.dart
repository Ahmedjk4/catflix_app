// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({super.key});
  final TextEditingController oldcontroller = TextEditingController();
  final TextEditingController newcontroller = TextEditingController();
  final TextEditingController repeatcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Change Name",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                controller: oldcontroller,
                obscureText: true,
                obscuringCharacter: "*",
                decoration: const InputDecoration(
                  hintText: "Enter old password",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                obscureText: true,
                obscuringCharacter: "*",
                controller: newcontroller,
                decoration: const InputDecoration(
                  hintText: "Enter new password",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                controller: repeatcontroller,
                obscureText: true,
                obscuringCharacter: "*",
                decoration: const InputDecoration(
                  hintText: "Repeat new password",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                )),
          ),
          MaterialButton(
            onPressed: () async {
              String oldPassword = oldcontroller.text;
              String? email = FirebaseAuth.instance.currentUser?.email;
              if (oldcontroller.text.isNotEmpty &&
                  newcontroller.text.isNotEmpty &&
                  repeatcontroller.text.isNotEmpty &&
                  newcontroller.text == repeatcontroller.text) {
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: email!,
                    password: oldPassword,
                  );

                  // Password is correct, you can now change it
                  await FirebaseAuth.instance.currentUser
                      ?.updatePassword(newcontroller.text);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Changed Password Successfully")),
                  );
                } catch (e) {
                  // Password is incorrect
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Old password is incorrect")),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text(
                          "Passwords don't match Or You Left An Empty Field")),
                );
              }
            },
            color: Colors.blue,
            child: const Text("Change Password"),
          )
        ],
      ),
    );
  }
}
