import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:server_test2/auth/auth.dart';
import 'package:server_test2/firebase_options.dart';
import 'package:server_test2/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      //home: HomePage(url: "ws://borosserver.onrender.com/",),
      home: AuthPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

