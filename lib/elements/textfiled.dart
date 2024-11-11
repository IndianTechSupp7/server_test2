import 'package:flutter/material.dart';

class MyEntry extends StatelessWidget {
  final String hintText;
  final bool obsucreText;
  final TextEditingController controller;
  
  MyEntry({
    super.key,
    required this.hintText,
    required this.obsucreText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obsucreText,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))
      ),
    );
  }
}
