import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:server_test2/elements/my_btn.dart';
import 'package:server_test2/elements/textfiled.dart';
import 'package:server_test2/helper/show_dialog.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void login() async {
    showDialog(
      context: context,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
      if (context.mounted) Navigator.pop(context);

    }
    on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessageDialog(e.code, context);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.person,
                size: 80,
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "L O G I N",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 50),
              MyEntry(
                  hintText: "Email",
                  obsucreText: false,
                  controller: emailController),
              const SizedBox(height: 10),
              MyEntry(
                  hintText: "Password",
                  obsucreText: true,
                  controller: passwordController),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot password?",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.surfaceTint),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              MyBtn(text: "Login", onPress: login)
            ],
          ),
        ),
      ),
    );
  }
}
