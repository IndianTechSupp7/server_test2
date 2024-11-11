import 'package:flutter/material.dart';
import 'package:server_test2/auth/auth.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Expanded(
          child: ListView(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: IconButton(
                icon: Icon(Icons.logout, size: 27),
                onPressed: () => AuthPage.logout(),
              ),
            )
          ],
        )
      ],
    ));
  }
}
