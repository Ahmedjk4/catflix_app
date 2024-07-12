import 'package:flutter/material.dart';

class TextFieldGlobal extends StatelessWidget {
  const TextFieldGlobal({
    super.key,
    required this.hintText,
    required this.controller,
    required this.obsecure,
  });
  final String hintText;
  final TextEditingController controller;
  final bool obsecure;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.black, fontSize: 20),
      controller: controller,
      decoration: InputDecoration(
        labelStyle: const TextStyle(fontSize: 20, color: Colors.black),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        labelText: hintText,
      ),
      obscureText: obsecure,
      obscuringCharacter: "*",
    );
  }
}
