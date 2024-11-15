import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:server_test2/pages/home_page.dart';
import 'package:server_test2/pages/login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  static void logout() async {
    await FirebaseAuth.instance.signOut();
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage(url: "ws://borosserver.onrender.com/");
          }
          else {
            return LoginPage();
          }
        },
      ),
    );
  }
}