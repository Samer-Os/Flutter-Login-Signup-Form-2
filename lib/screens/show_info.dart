import 'package:flutter/material.dart';

class ShowInfo extends StatelessWidget {
  static const routeName = 'ShowInfoRoute';

  final String email;
  final String password;

  const ShowInfo({required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    // final info =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hi User'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'User name: $email',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Password: $password',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
