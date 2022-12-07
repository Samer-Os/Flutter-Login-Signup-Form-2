import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'screens/my_home_page.dart';
import 'screens/show_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(),
      // routes: {
      //   ShowInfo.routeName: (ctx) => const ShowInfo(),
      // },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case ShowInfo.routeName:
            final args = settings.arguments as Map<String, String>;
            return PageTransition(
              child: ShowInfo(
                email: args['email'] as String,
                password: args['password'] as String,
              ),
              type: PageTransitionType.rightToLeft,
            );
          default:
            return null;
        }
      },
    );
  }
}
