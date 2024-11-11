import 'package:flutter/material.dart';

class MyBtn extends StatelessWidget {
  final String text;
  final void Function()? onPress;
  const MyBtn({
    super.key,
    required this.text,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimary
            ),
          ),
        ),
      ),
    );
  }
}
